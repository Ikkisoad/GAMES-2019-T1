package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;
 import flixel.group.FlxGroup;
 import flixel.math.FlxAngle;
 //import flixel.*;

 class Player extends FlxSprite{

    public var speed:Float = 200;

    public function new(?X:Float=0, ?Y:Float=0){
        super(X, Y);
        loadGraphic(AssetPaths.spr_player__png, true, 32, 32);
        setFacingFlip(FlxObject.LEFT, false, false);
        setFacingFlip(FlxObject.RIGHT, true, false);
        animation.add("lr", [2, 2, 2, 2], 2, false);
        animation.add("u", [0, 0, 0, 0], 0, false);
        animation.add("d", [1, 1, 1, 1], 1, false);
        drag.x = drag.y = 1600;
        setSize(25, 30);
        offset.set(4, 2);
        //loadGraphic(AssetPaths.canon__png, true, 32, 32);
        
    }

    override public function update(elapsed:Float):Void{
        movement();
        shoot();
        super.update(elapsed);
    }

    function movement():Void{
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        _up = FlxG.keys.anyPressed([UP, W]);
        _down = FlxG.keys.anyPressed([DOWN, S]);
        _left = FlxG.keys.anyPressed([LEFT, A]);
        _right = FlxG.keys.anyPressed([RIGHT, D]);

        if (_up && _down) _up = _down = false;
        if (_left && _right) _left = _right = false;

        if (_up || _down || _left || _right){
            var mA:Float = 0;
            if (_up){
                mA = -90;
                if (_left)
                    mA -= 45;
                else if (_right)
                    mA += 45;
                facing = FlxObject.UP;
            }else if (_down){
                mA = 90;
                if (_left)
                    mA += 45;
                else if (_right)
                    mA -= 45;
                facing = FlxObject.DOWN;
            }else if (_left){
                mA = 180;
                facing = FlxObject.LEFT;
            }else if(_right){
                mA = 0;
                facing = FlxObject.RIGHT;
            }

            velocity.set(speed, 0);
            velocity.rotate(FlxPoint.weak(0, 0), mA);

             if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE){
                switch (facing){
                    case FlxObject.LEFT, FlxObject.RIGHT:
                        animation.play("lr");
                    case FlxObject.UP:
                        animation.play("u");
                    case FlxObject.DOWN:
                        animation.play("d");
                }
            }
        }else{
            this.velocity.y = PlayState._camSpeed * 2;
            animation.play("u");
        }
    }

    function shoot(){
        if (FlxG.keys.justPressed.SPACE || FlxG.mouse.justPressed){
			var bullet:Bullet = PlayState._bullets.recycle();
			bullet.reset(x + (width - bullet.width) / 2, y + (height - bullet.height) / 2);
			bullet.angle = FlxAngle.angleBetweenMouse(this, true);
			
			bullet.velocity.set(150, 0);
			bullet.velocity.rotate(FlxPoint.weak(0, 0), bullet.angle);
			
			bullet.velocity.x *= 5;
			bullet.velocity.y *= 5;
		}
    }
 }