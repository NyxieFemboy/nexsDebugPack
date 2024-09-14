//dont remove this
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxSort;

function create()
{
    //Set the stage's zoom here
	defaultCamZoom = 0.5;

    //Should be self explanitory
    square = new FlxBackdrop(Paths.image('bgs/square'), FlxAxes.XY, 0, 0);
    square.alpha = 0.5;
    square.updateHitbox();
    square.scale.set(1.5, 1.5);
    square.scrollFactor.set(1.2, 1.2);
    insert(1, square);

    platform = new FunkinSprite(-300, 820).loadGraphic(Paths.image('bgs/platform'));
    platform.scale.set(1.5, 1.5);
    platform.updateHitbox();
    insert(2, platform);
    
    bfPlaceHolder = new FlxSprite(1075, 450);
    bfPlaceHolder.frames = Paths.getSparrowAtlas('characters/bfJustIdle');
    bfPlaceHolder.animation.addByPrefix('idle', 'BF idle dance', 24, false);
    bfPlaceHolder.animation.play("idle");
    bfPlaceHolder.alpha = 0.5;
    insert(3, bfPlaceHolder);

    dadPlaceHolder = new FlxSprite(100 - 300, 100);
    dadPlaceHolder.frames = Paths.getSparrowAtlas('characters/dadJustIdle');
    dadPlaceHolder.animation.addByPrefix('idle', 'Dad idle dance', 24, false);
    dadPlaceHolder.animation.play("idle");
    dadPlaceHolder.alpha = 0.5;
    dadPlaceHolder.flipX = false;
    insert(4, dadPlaceHolder);

    gfPlaceHolder = new FlxSprite(351, 172);
    gfPlaceHolder.frames = Paths.getSparrowAtlas('characters/gfJustIdle');
    gfPlaceHolder.animation.addByPrefix('idle', 'GF Dancing Beat0', 24, false);
    gfPlaceHolder.animation.play("idle");
    gfPlaceHolder.alpha = 0.5;
    gfPlaceHolder.flipX = false;
    insert(5, gfPlaceHolder);

    //The Combo Counter's Position
    PlayState.instance.comboGroup.x += 200;
    PlayState.instance.comboGroup.y = 400;

    //I suggest not touching these unless you really have to as the placeholder offset helpers are pixel perfect alligned to the base character's positions as closely as I could but these are the character positions
    if(gf != null)
    {
        gf.scrollFactor.set(1, 1);
        gf.y += 75;
    }
    boyfriend.x += 300;
    dad.x -= 300;

    
}

function postCreate()
{
    //This will automatically place any extra characters in the first two strumlines backwards by 150 units, delete the two loops or comment them out if you dont want that
    // for (i in 0...strumLines.members[1].characters.length) {
    //     strumLines.members[1].characters[i].x += 650 * i;
    // }
    
    // for (i in 0...strumLines.members[0].characters.length) {
    //     strumLines.members[0].characters[i].x -= 650 * i;
    // }
    
    for (i in 0...strumLines.members[1].characters.length) {
        strumLines.members[1].characters[i].x = boyfriend.x;
        strumLines.members[1].characters[i].y = boyfriend.y;
    }

    for (i in 0...strumLines.members[0].characters.length) {
        strumLines.members[0].characters[i].x = dad.x + (50 * i);
        strumLines.members[0].characters[i].y = dad.y - (50 * i);
    }

    strumLines.members[0].characters.sort(FlxSort.byY, FlxSort.ASCENDING);
}

function beatHit()
{
    //Plays the placeholder's animations
    bfPlaceHolder.animation.play("idle");
    dadPlaceHolder.animation.play("idle");
    gfPlaceHolder.animation.play("idle");
}

function update(elapsed)
{
    //updates the BG square's positions
    square.x -= 1/2;
    square.y -= 0.5/2;
}
