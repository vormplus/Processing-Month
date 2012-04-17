SpaceShip spaceShip;

void setup()
{
    size( 450, 400 );
    
    spaceShip = new SpaceShip();
}

void draw()
{
    background(0);
    noSmooth();
    
    spaceShip.render();
}

void keyPressed()
{
    if (key == CODED) {
        if (keyCode == LEFT) {
            spaceShip.update( -10 );
        }

        if (keyCode == RIGHT) {
            spaceShip.update( 10 );
        }
    }
}
