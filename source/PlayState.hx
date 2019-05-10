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

class PlayState extends FlxState{
	var _hud:HUD;
	var _money:Int = 0;
	var _health:Int = 3;
	var _player:Player;
	var _map:FlxOgmoLoader;
 	var _mWalls:FlxTilemap;
	var _grpCoins:FlxTypedGroup<Coin>;
	var _grpEnemies:FlxTypedGroup<Enemy>;
	var spr_cam:FlxSprite;

    public static var _bullets:FlxTypedGroup<Bullet>;

	override public function create():Void{

		spr_cam = new FlxSprite();
        spr_cam.makeGraphic(64, 16, 0xFFFFFFFF);
		spr_cam.velocity.y = -10;

		_map = new FlxOgmoLoader(AssetPaths.room_002__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);

		_grpCoins = new FlxTypedGroup<Coin>();
 		add(_grpCoins);

		_grpEnemies = new FlxTypedGroup<Enemy>();
 		add(_grpEnemies);

		_player = new Player();
 		_map.loadEntities(placeEntities, "entities");
 		add(_player);

		_hud = new HUD();
		add(_hud);

		
        _bullets = new FlxTypedGroup<Bullet>();
		for(i in 0...200){
            var s = new Bullet();
            s.kill();

            _bullets.add(s);
        }
        add(_bullets);
		add(spr_cam);

		FlxG.camera.follow(spr_cam, TOPDOWN, 1);
		/*var camera2 = new FlxCamera();
		camera2.focusOn(new FlxPoint(_player.x,_player.y));
		FlxG.cameras.reset(camera2);*/
		super.create();
	}

	override public function update(elapsed:Float):Void{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _grpCoins, playerTouchCoin);
		FlxG.collide(_grpEnemies, _mWalls);
		FlxG.overlap(_bullets, _grpEnemies, bulletHits);
 		_grpEnemies.forEachAlive(checkEnemyVision);
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
			spr_cam.velocity.y = -10;
		}
	}

	function playerTouchCoin(P:Player, C:Coin):Void{
		if (P.alive && P.exists && C.alive && C.exists){
			_money++;
			_hud.updateHUD(_health, _money);
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
		Object2.kill();
		//increaseScore();
	}
}
