package;

import flixel.FlxSprite;
import flixel.math.FlxAngle;

class Canon extends FlxSprite{
    public function new() {
        super();
        loadGraphic(AssetPaths.canon__png, true, 10, 15);
    }

     override public function update(elapsed:Float):Void {
         angle = FlxAngle.angleBetweenMouse(this, true) + 90;
         x = PlayState._player.x+9;
         y = PlayState._player.y+5;
         super.update(elapsed);
     }

}