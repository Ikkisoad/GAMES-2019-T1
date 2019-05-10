package;


import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#elseif (winrt)
			rootPath = "./";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end

		}

		Assets.defaultRootPath = rootPath;

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y25:assets%2Fdata%2Fmap_0.oepR2i4415R3R4R5R7R6tgoR0y26:assets%2Fdata%2Froom-1.oelR2i3296R3R4R5R8R6tgoR0y26:assets%2Fdata%2Froom-2.oelR2i10486R3R4R5R9R6tgoR0y28:assets%2Fimages%2Fbullet.pngR2i2856R3y5:IMAGER5R10R6tgoR0y28:assets%2Fimages%2Fbullet.psdR2i25972R3y6:BINARYR5R12R6tgoR0y28:assets%2Fimages%2Fcamera.pngR2i3902R3R11R5R14R6tgoR0y28:assets%2Fimages%2Fcamera.psdR2i28675R3R13R5R15R6tgoR0y27:assets%2Fimages%2Fcanon.pngR2i3142R3R11R5R16R6tgoR0y27:assets%2Fimages%2Fcanon.psdR2i25800R3R13R5R17R6tgoR0y29:assets%2Fimages%2Fenemy-0.pngR2i4562R3R11R5R18R6tgoR0y29:assets%2Fimages%2Fenemy-0.psdR2i40187R3R13R5R19R6tgoR0y29:assets%2Fimages%2Fenemy-1.pngR2i4586R3R11R5R20R6tgoR0y29:assets%2Fimages%2Fenemy-1.psdR2i44744R3R13R5R21R6tgoR0y28:assets%2Fimages%2Fhealth.pngR2i984R3R11R5R22R6tgoR0y30:assets%2Fimages%2Fspr_coin.pngR2i984R3R11R5R23R6tgoR0y32:assets%2Fimages%2Fspr_player.pngR2i3269R3R11R5R24R6tgoR0y27:assets%2Fimages%2Ftiles.pngR2i1056R3R11R5R25R6tgoR0y36:assets%2Fmusic%2Fmusic-goes-here.txtR2zR3R4R5R26R6tgoR0y36:assets%2Fsounds%2Fsounds-go-here.txtR2zR3R4R5R27R6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3y9:pathGroupaR29y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R28R5y28:flixel%2Fsounds%2Fflixel.mp3R30aR32y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3y5:SOUNDR5R31R30aR29R31hgoR2i33629R3R34R5R33R30aR32R33hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R35R36y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R11R5R41R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R11R5R42R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_map_0_oep extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_room_1_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_room_2_oel extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bullet_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_camera_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_camera_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_canon_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_canon_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_0_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_psd extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spr_coin_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_spr_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/data/map_0.oep") @:noCompletion #if display private #end class __ASSET__assets_data_map_0_oep extends haxe.io.Bytes {}
@:keep @:file("assets/data/room-1.oel") @:noCompletion #if display private #end class __ASSET__assets_data_room_1_oel extends haxe.io.Bytes {}
@:keep @:file("assets/data/room-2.oel") @:noCompletion #if display private #end class __ASSET__assets_data_room_2_oel extends haxe.io.Bytes {}
@:keep @:image("assets/images/bullet.png") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_png extends lime.graphics.Image {}
@:keep @:file("assets/images/bullet.psd") @:noCompletion #if display private #end class __ASSET__assets_images_bullet_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/camera.png") @:noCompletion #if display private #end class __ASSET__assets_images_camera_png extends lime.graphics.Image {}
@:keep @:file("assets/images/camera.psd") @:noCompletion #if display private #end class __ASSET__assets_images_camera_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/canon.png") @:noCompletion #if display private #end class __ASSET__assets_images_canon_png extends lime.graphics.Image {}
@:keep @:file("assets/images/canon.psd") @:noCompletion #if display private #end class __ASSET__assets_images_canon_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/enemy-0.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_0_png extends lime.graphics.Image {}
@:keep @:file("assets/images/enemy-0.psd") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_0_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/enemy-1.png") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_png extends lime.graphics.Image {}
@:keep @:file("assets/images/enemy-1.psd") @:noCompletion #if display private #end class __ASSET__assets_images_enemy_1_psd extends haxe.io.Bytes {}
@:keep @:image("assets/images/health.png") @:noCompletion #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spr_coin.png") @:noCompletion #if display private #end class __ASSET__assets_images_spr_coin_png extends lime.graphics.Image {}
@:keep @:image("assets/images/spr_player.png") @:noCompletion #if display private #end class __ASSET__assets_images_spr_player_png extends lime.graphics.Image {}
@:keep @:image("assets/images/tiles.png") @:noCompletion #if display private #end class __ASSET__assets_images_tiles_png extends lime.graphics.Image {}
@:keep @:file("assets/music/music-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_music_music_goes_here_txt extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/sounds-go-here.txt") @:noCompletion #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends haxe.io.Bytes {}
@:keep @:file("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("D:/Haxetoolkit/haxe/lib/flixel/4,6,1/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
