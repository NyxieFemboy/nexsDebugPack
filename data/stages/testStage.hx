//dont remove this
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxSort;

function create()
{
    //Should be self explanitory
    square = new FlxBackdrop(Paths.image('bgs/square'), FlxAxes.XY, 0, 0);
    square.alpha = 0.5;
    square.scale.set(1.5, 1.5);
    square.scrollFactor.set(1.2, 1.2);
    square.velocity.set(-100, -100);
    insert(1, square);

    //The Combo Counter's Position
    PlayState.instance.comboGroup.x += 200;
    PlayState.instance.comboGroup.y = 400;

    if(gf != null)  
        gf.scrollFactor.set(1, 1);
}