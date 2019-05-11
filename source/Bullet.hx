package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Bullet extends FlxSprite {
    public function new() {
        super();
        loadGraphic(AssetPaths.bullet__png, true, 6, 6);
    }

    override public function update(elapsed:Float):Void {
        if(!isOnScreen()){
            kill();
        }
        super.update(elapsed);
    }
}