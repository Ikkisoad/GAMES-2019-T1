package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class CreditsState extends FlxState {
    var _creditsText:FlxText;
    var _btnBack:FlxButton;
    var _CREDITS_VELOCITY = -256;

    override public function create():Void{
        _creditsText = new FlxText(0,0,0,"Created by:\nIkkisoad\n\n\n\nSpecial thanks:\nHaxeFlixel",12);
        _creditsText.x = FlxG.width/2 - _creditsText.width / 2;
        _creditsText.y = FlxG.height;
        _creditsText.moves = true;
        _creditsText.alignment = CENTER;
        _creditsText.velocity.y = _CREDITS_VELOCITY;
        _creditsText.color = 0xFFff6e00;

        _btnBack = new FlxButton(0, 0, "Back", goToMenu);
        _btnBack.y = FlxG.height - _btnBack.height;

        add(_creditsText);
        add(_btnBack);

        super.create();
    }

    function goToMenu():Void{
        FlxG.switchState(new MenuState());
    }

    override public function update(elapsed:Float):Void{
		super.update(elapsed);
        if(_creditsText.y + _creditsText.height <= 0){
            _creditsText.y = FlxG.height;
        }
    }
}