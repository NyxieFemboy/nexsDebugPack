//dont remove this
import flixel.addons.display.FlxBackdrop;

function onPostStageCreation(e)
{
    e.stage.characterPoses['girlfriend'].y += 75;
    e.stage.characterPoses['dad'].x -= 300;
    e.stage.characterPoses['boyfriend'].x += 300;
}


function create()
{
    //Should be self explanitory
    square = new FlxBackdrop(Paths.image('stages/debug/square'), FlxAxes.XY, 0, 0);
    square.alpha = 0.5;
    square.scale.set(1.5, 1.5);
    square.scrollFactor.set(1.2, 1.2);
    square.velocity.set(-100, -100);
    insert(1, square);
}