package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxCamera;
import flixel.math.FlxPoint;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class PlayState extends FlxState{
	var _hud:HUD;
	var _money:Int = 0;
	var _stage:Int = 1;
	var _lives:Int = 3;
	public static var _camSpeed:Int = 0;
	public static var _player:Player;
	var _canon:Canon;
	var _map:FlxOgmoLoader;
 	var _mWalls:FlxTilemap;
	var _grpCoins:FlxTypedGroup<Coin>;
	var _grpEnemies:FlxTypedGroup<Enemy>;
	public static var spr_cam:FlxSprite;

    public static var _bullets:FlxTypedGroup<Bullet>;

	override public function create():Void{

		spr_cam = new FlxSprite();
        spr_cam.makeGraphic(16, 16, 0xFFFFFFFF);

		_grpCoins = new FlxTypedGroup<Coin>();
		_grpEnemies = new FlxTypedGroup<Enemy>();
		_player = new Player();
		_canon = new Canon();
		_hud = new HUD();
		

		
        _bullets = new FlxTypedGroup<Bullet>();
		

		FlxG.camera.follow(spr_cam, TOPDOWN, 1);
		/*var camera2 = new FlxCamera();
		camera2.focusOn(new FlxPoint(_player.x,_player.y));
		FlxG.cameras.reset(camera2);*/
		stage(_stage);
		super.create();
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _grpCoins, playerTouchCoin);
		//FlxG.overlap(_bullets, _mWalls, bulletDies);
		FlxG.overlap(_player, _grpEnemies, playerDies);
		FlxG.collide(_grpEnemies, _mWalls);
		FlxG.overlap(_bullets, _grpEnemies, bulletHits);
 		_grpEnemies.forEachAlive(checkEnemyVision);
		clear_stage();
		if(!_player.isOnScreen()){
			remove(_player);
			_lives--;
			_hud.updateHUD(_lives, _money, _stage);
			_player.x = spr_cam.x;
			_player.y = spr_cam.y;
			add(_player);
		}
		if (_lives < 1){
			FlxG.camera.fade(FlxColor.BLACK, .33, false, end);
			return;
		}
	}

	function end(){
		FlxG.switchState(new GameOverState(false, _money));
	}

	function clear_stage(){
		if(_stage == 1){
			_camSpeed = 0;
			if(_grpEnemies.countLiving() == 0){
				_stage++;
				removeALL();
				_camSpeed = -50;
				stage(_stage);
				_hud.updateHUD(_lives, _money, _stage);
			}
		}else if(_stage == 2){
			if(!spr_cam.isOnScreen()){
				_stage++;
				removeALL();
				_hud.updateHUD(_lives, _money, _stage);
				_camSpeed = 50;
				stage(_stage);
			}
		}else if(_stage == 3){
			if(!spr_cam.isOnScreen()){
				_stage++;
				removeALL();
				_hud.updateHUD(_lives, _money, _stage);
				stage(_stage);
			}
		}

	}

	function bulletDies(B:Bullet, M:FlxTilemap):Void{
		B.kill();
	}

	function playerDies(P:Player, E:Enemy):Void{
		remove(_player);
		E.destroy();
		_lives--;
		_hud.updateHUD(_lives, _money, _stage);
		_player.x = spr_cam.x;
		_player.y = spr_cam.y;
		add(_player);
	}

	function removeALL() {
		remove(_mWalls, true);
		remove(_player, true);
		remove(spr_cam, true);
		remove(_grpCoins);
		remove(_grpEnemies);
		remove(_bullets);
		remove(_hud);
		remove(_canon);
	}

	 function placeEntities(entityName:String, entityData:Xml):Void{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player"){
			_player.x = x;
			_player.y = y;
		}else if (entityName == "coin"){
     		_grpCoins.add(new Coin(x + 4, y + 4));
 		}else if (entityName == "enemy"){
			_grpEnemies.add(new Enemy(x + 4, y, Std.parseInt(entityData.get("etype"))));
		}else if (entityName == "camera"){
			spr_cam.x = x;
			spr_cam.y = y;
		}
	}

	function playerTouchCoin(P:Player, C:Coin):Void{
		if (P.alive && P.exists && C.alive && C.exists){
			_money++;
			_hud.updateHUD(_lives, _money, _stage);
			C.kill();
		}
	}

	 function checkEnemyVision(e:Enemy):Void{
		if (_mWalls.ray(e.getMidpoint(), _player.getMidpoint()))
		{
			e.seesPlayer = true;
			e.playerPos.copyFrom(_player.getMidpoint());
		}
		else
			e.seesPlayer = false;
	}

	function bulletHits(Object1:FlxObject, Object2:FlxObject){
		Object1.kill();
		Object2.destroy();
		//increaseScore();
	}

	function stage(stage:Int):Void{
		for(i in _grpEnemies){
			remove(i,true);
			i.destroy();
		}
		_map = new FlxOgmoLoader("assets/data/room-"+stage+".oel");
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);

		_map.loadEntities(placeEntities, "entities");
		
		add(_grpEnemies);
		add(_grpCoins);
		add(_player);
		add(spr_cam);
		add(_hud);
		add(_canon);
		spr_cam.velocity.y = _camSpeed;
		for(i in 0...100){
            var s = new Bullet();
            s.kill();

            _bullets.add(s);
        }
        add(_bullets);
	}
}
