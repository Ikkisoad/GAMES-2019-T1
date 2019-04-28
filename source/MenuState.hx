package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState{
    var _title:FlxText;
    var _btnPlay:FlxButton;
    var _btnCredits:FlxButton;

    override public function create():Void{
        _title = new FlxText(0,0,0,"Strike Tanker S.T.T.",35);
        _title.x = FlxG.width/2 - _title.width/2;
        _title.y = FlxG.height/4;

        _btnPlay = new FlxButton(_title.x + _title.width/3, _title.y + _title.height + 15, "Start", goPlay);
      //  _btnPlay.x = FlxG.width/2 - _btnPlay.width / 2;

        _btnCredits = new FlxButton(0,0, "Credits", goToCredits);
        _btnCredits.x = _btnPlay.x;
        _btnCredits.y = _btnPlay.y + _btnCredits.height + 2;

        add(_title);
        add(_btnPlay);
        add(_btnCredits);
        
        super.create();
    }

    function goPlay():Void{
        FlxG.switchState(new PlayState());
    }

    function goToCredits():Void{
        FlxG.switchState(new CreditsState());
    }
}