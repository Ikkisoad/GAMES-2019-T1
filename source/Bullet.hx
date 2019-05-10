package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Bullet extends FlxSprite {
    public function new() {
        super();
        loadGraphic(AssetPaths.bullet__png, true, 6, 6);
        animation.add("u", [0, 0, 0, 0], 0, false);
    }

    override public function update(elapsed:Float):Void {
        animation.play("u");
        if(!isOnScreen()){
            kill();
        }
        super.update(elapsed);
    }
}