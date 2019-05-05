package;

import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	var _player:Player;
	var _map:FlxOgmoLoader;
 	var _mWalls:FlxTilemap;
	var _grpCoins:FlxTypedGroup<Coin>;
	var _grpEnemies:FlxTypedGroup<Enemy>;

	override public function create():Void{

		
		_map = new FlxOgmoLoader(AssetPaths.room_001__oel);
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

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
		FlxG.overlap(_player, _grpCoins, playerTouchCoin);
		FlxG.collide(_grpEnemies, _mWalls);
 		_grpEnemies.forEachAlive(checkEnemyVision);
	}

	 function placeEntities(entityName:String, entityData:Xml):Void{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player")
		{
			_player.x = x;
			_player.y = y;
		} else if (entityName == "coin"){
     		_grpCoins.add(new Coin(x + 4, y + 4));
 		}else if (entityName == "enemy"){
			_grpEnemies.add(new Enemy(x + 4, y, Std.parseInt(entityData.get("etype"))));
		}
	}

	function playerTouchCoin(P:Player, C:Coin):Void{
		if (P.alive && P.exists && C.alive && C.exists){
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
}
