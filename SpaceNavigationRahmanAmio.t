/* *****************************************************
 Name: Rahman Amio
 Date:  May 25, 2015
 Program Name: Navigate in Space
 Program Description: The program is created for the user to maneuver in space
 and dodge rocks along the way. The user is controlling the spaceship and you move
 it in any direction.
 ****************************************************** */
%variables
setscreen ("graphics:970;486,offscreenonly")
var font1 : int
var font2 : int
var background : int
var finished : boolean := false
var num : int
var start : string
var num2 : int

var pic1 : int := Pic.FileNew ("ship.bmp")
Pic.SetTransparentColor (pic1, black)
var sprite1 : int := Sprite.New (pic1)
var x : int := 435
var y : int := 243
var centered : boolean := false
var chars : array char of boolean

Sprite.SetHeight (sprite1, 1)

%
var asteroid : int
asteroid := Pic.FileNew ("asteroid.bmp")
var spriteAsteroid : int := Sprite.New (asteroid)
Sprite.SetHeight (spriteAsteroid, 2)

%Asteroid positions for both coordinates
var xAsteroid : int
xAsteroid := 50
var yAsteroid : int := 50
var xAsteroidchange : int := 1
var yAsteroidchange : int := 1


var asteroid2 : int
asteroid2 := Pic.FileNew ("asteroid2.bmp")
var spriteAsteroid2 : int := Sprite.New (asteroid2)
Sprite.SetHeight (spriteAsteroid2, 2)


var xAsteroid2 : int := 250
var yAsteroid2 : int := 250
var xAsteroid2Change : int := 2
var yAsteroid2Change : int := 2

var asteroid3 : int
asteroid3 := Pic.FileNew ("asteroid3.bmp")
var spriteAsteroid3 : int := Sprite.New (asteroid3)
Sprite.SetHeight (spriteAsteroid3, 3)

var xAsteroid3 : int := 550
var yAsteroid3 : int := 150
var xAsteroid3Change : int := 2
var yAsteroid3Change : int := 3

var asteroid4 : int
asteroid4 := Pic.FileNew ("asteroid4.bmp")
var spriteAsteroid4 : int := Sprite.New (asteroid4)
Sprite.SetHeight (spriteAsteroid4, 4)

var xAsteroid4 : int := 435
var yAsteroid4 : int := 50
var xAsteroid4Change : int := 1
var yAsteroid4Change : int := 1

var asteroid5 : int
asteroid5 := Pic.FileNew ("asteroid5.bmp")
var spriteAsteroid5 : int := Sprite.New (asteroid5)
Sprite.SetHeight (spriteAsteroid5, 5)

var xAsteroid5 : int := 435
var yAsteroid5 : int := 50
var xAsteroid5Change : int := 3
var yAsteroid5Change : int := 2


font1 := Font.New ("Times New Roman:46")
%delay (500)
%Font.Draw ("Navigation In Space", 80, 350, font1, red)


%This is to play the background music, its a loop so that it keeps on playing
%until the game is over
process Background (file : string)
    loop
	Music.PlayFile (file)
	exit when finished
    end loop
end Background


fork Background ("backgroundM.mp3")

procedure starting

    var start : boolean := false
    font1 := Font.New ("Times New Roman:46")
    %delay(500)
    Font.Draw ("Navigation In Space", 1000, 500, font1, red)
    colour (blue)
    locate (15, 30)
    delay (300)
    put "By:"
    locate (15, 34)
    delay (300)
    put "A"
    locate (15, 35)
    delay (300)
    put "M"
    locate (15, 36)
    delay (300)
    put "I"
    locate (15, 37)
    delay (300)
    put "O"
    locate (15, 39)
    delay (300)
    put "R"
    locate (15, 40)
    delay (300)
    put "A"
    locate (15, 41)
    delay (300)
    put "H"
    locate (15, 42)
    delay (300)
    put "M"
    locate (15, 43)
    delay (300)
    put "A"
    locate (15, 44)
    delay (300)
    put "N"

    locate (16, 25)
    %put"Press any key to enter the game"


    locate (10, 5)
    colour (black)
    put "TO PLAY THE GAME, USE THE ARROW KEYS TO MOVE THE SPACESHIP AVOID THE ROCKS"
    locate (15, 29)
    put "PRESS ANY KEY TO START THE GAME"
    Input.Pause ()
    cls

end starting


%The movement procedure for the spaceship
procedure move
    Input.KeyDown (chars)
    if chars (KEY_UP_ARROW) then
	y := y + 2
    end if
    if chars (KEY_DOWN_ARROW) then
	y := y - 2
    end if
    if chars (KEY_LEFT_ARROW) then
	x := x - 2
    end if
    if chars (KEY_RIGHT_ARROW) then
	x := x + 2
    end if
    Sprite.SetPosition (sprite1, x, y, centered)
    Sprite.Show (sprite1)
end move

%The boundary for the spaceship on the screen
proc margin
    if x > 940 then
	x := 935
    end if
    if x < 0 then
	x := 5
    end if
    if y > 455 then
	y := 450
    end if
    if y < 0 then
	y := 5
    end if
end margin

%The procedure for the movement of the asteroid
procedure asteroidmove
    xAsteroid := xAsteroid - xAsteroidchange
    yAsteroid := yAsteroid + yAsteroidchange
    View.Update
    %delay (10)
    Sprite.SetPosition (spriteAsteroid, xAsteroid, yAsteroid, centered)
    delay (1)
    View.Update
    Sprite.Show (spriteAsteroid)
end asteroidmove

procedure asteroidMove2
    xAsteroid2 := xAsteroid2 - xAsteroid2Change
    yAsteroid2 := yAsteroid2 + yAsteroid2Change
    View.Update
    %delay (10)
    Sprite.SetPosition (spriteAsteroid2, xAsteroid2, yAsteroid2, centered)
    delay (1)
    View.Update
    Sprite.Show (spriteAsteroid2)
end asteroidMove2

procedure asteroidMove3
    xAsteroid3 := xAsteroid3 - xAsteroid3Change
    yAsteroid3 := yAsteroid3 + yAsteroid3Change
    View.Update
    %delay (10)
    Sprite.SetPosition (spriteAsteroid3, xAsteroid3, yAsteroid3, centered)
    delay (1)
    View.Update
    Sprite.Show (spriteAsteroid3)
end asteroidMove3

procedure asteroidMove4
    xAsteroid4 := xAsteroid4 - xAsteroid4Change
    yAsteroid4 := yAsteroid4 + yAsteroid4Change
    View.Update
    % delay (10)
    Sprite.SetPosition (spriteAsteroid4, xAsteroid4, yAsteroid4, centered)
    delay (1)
    View.Update
    Sprite.Show (spriteAsteroid4)
end asteroidMove4

procedure asteroidMove5
    xAsteroid5 := xAsteroid5 - xAsteroid5Change
    yAsteroid5 := yAsteroid5 + yAsteroid5Change
    View.Update
    % delay (10)
    Sprite.SetPosition (spriteAsteroid5, xAsteroid5, yAsteroid5, centered)
    delay (1)
    View.Update
    Sprite.Show (spriteAsteroid5)
end asteroidMove5

%Different boundaries for the asteroids to bump irregularly
proc asteroidmargin
    if xAsteroid = 5 or xAsteroid = 484 then
	xAsteroidchange := xAsteroidchange * -2
	View.Update
    end if
    if yAsteroid = 10 or yAsteroid = 450 then
	yAsteroidchange := yAsteroidchange * -1
	View.Update
    end if
end asteroidmargin

proc asteroidMargin2
    if xAsteroid2 = 10 or xAsteroid2 = 700 then
	xAsteroid2Change := xAsteroid2Change * -1
	View.Update
    end if
    if yAsteroid2 = 10 or yAsteroid2 = 350 then
	yAsteroid2Change := yAsteroid2Change * -1
	View.Update
    end if
end asteroidMargin2

proc asteroidMargin3
    if xAsteroid3 = 450 or xAsteroid3 = 950 then
	xAsteroid3Change := xAsteroid3Change * -1
	View.Update
    end if
    if yAsteroid3 = 0 or yAsteroid3 = 450 then
	yAsteroid3Change := yAsteroid3Change * -1
	View.Update
    end if
end asteroidMargin3

proc asteroidMargin4
    if xAsteroid4 = 10 or xAsteroid4 = 950 then
	xAsteroid4Change := xAsteroid4Change * -1
	View.Update
    end if
    if yAsteroid4 = 20 or yAsteroid4 = 450 then
	yAsteroid4Change := yAsteroid4Change * -1
	View.Update
    end if
end asteroidMargin4

proc asteroidMargin5
    if xAsteroid5 = 0 or xAsteroid5 = 450 then
	xAsteroid5Change := xAsteroid5Change * -1
	View.Update
    end if
    if yAsteroid5 = 10 or yAsteroid5 = 450 then
	yAsteroid5Change := yAsteroid5Change * -1
	View.Update
    end if
end asteroidMargin5

%The sprite collision for the spaceship and asteroids
proc finish
    if x + Pic.Width (pic1) > xAsteroid and x < xAsteroid + Pic.Width (asteroid) and y + Pic.Height (pic1) > yAsteroid and y < yAsteroid + Pic.Height (asteroid) then
	finished := true
	Music.PlayFileStop
	font2 := Font.New ("Times New Roman:46")

	Font.Draw ("GAME OVER!!!!", 250, 350, font1, red)
	View.Update
    end if
end finish

proc finish2
    if x + Pic.Width (pic1) > xAsteroid2 and x < xAsteroid2 + Pic.Width (asteroid2) and y + Pic.Height (pic1) > yAsteroid2 and y < yAsteroid2 + Pic.Height (asteroid2) then
	finished := true
	Music.PlayFileStop
	font2 := Font.New ("Times New Roman:46")

	Font.Draw ("GAME OVER!!!!", 250, 350, font1, red)
	View.Update
    end if
end finish2

proc finish3
    if x + Pic.Width (pic1) > xAsteroid3 and x < xAsteroid3 + Pic.Width (asteroid3) and y + Pic.Height (pic1) > yAsteroid3 and y < yAsteroid3 + Pic.Height (asteroid3) then
	finished := true
	Music.PlayFileStop
	font2 := Font.New ("Times New Roman:46")

	Font.Draw ("GAME OVER!!!!", 250, 350, font1, red)
	View.Update
    end if
end finish3

proc finish4
    if x + Pic.Width (pic1) > xAsteroid4 and x < xAsteroid4 + Pic.Width (asteroid4) and y + Pic.Height (pic1) > yAsteroid4 and y < yAsteroid4 + Pic.Height (asteroid4) then
	finished := true
	Music.PlayFileStop
	font2 := Font.New ("Times New Roman:46")

	Font.Draw ("GAME OVER!!!!", 250, 350, font1, red)
	View.Update
    end if
end finish4

proc finish5
    if x + Pic.Width (pic1) > xAsteroid5 and x < xAsteroid5 + Pic.Width (asteroid5) and y + Pic.Height (pic1) > yAsteroid5 and y < yAsteroid5 + Pic.Height (asteroid5) then
	finished := true
	Music.PlayFileStop
	font2 := Font.New ("Times New Roman:46")

	Font.Draw ("GAME OVER!!!!", 250, 350, font1, red)
	View.Update
    end if
end finish5


%procedure that starts the game
proc game
    Sprite.SetFrameRate (120)
    background := Pic.FileNew ("universe.jpg")
    Pic.Draw (background, 0, 0, picCopy)
    asteroidmargin
    asteroidMargin2
    asteroidMargin3
    asteroidMargin4
    asteroidMargin5
    asteroidmove
    asteroidMove2
    asteroidMove3
    asteroidMove4
    asteroidMove5
    move
    margin
    View.Update
    finish
    finish2
    finish3
    finish4
    finish5
    View.Update
end game

%Game begins
starting
loop
    game
    exit when finished = true
end loop


