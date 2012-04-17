SpaceShip spaceShip;

ArrayList<Asteroid> asteroids;

int score;

void setup()
{
    size( 450, 400 );
    
    spaceShip = new SpaceShip();

    asteroids = new ArrayList<Asteroid>();
    for (int i = 0; i < 10; i++) {
        asteroids.add( new Asteroid() );
    }
    
    score = 0;

}

void draw()
{
    background(0);
    noSmooth();
    
    for (Asteroid a : asteroids ) {
        a.update();
        a.render();   
    }
    
    spaceShip.render();
    
    fill(255);
    text("SCORE: " + nf(score, 5), 225, 20 );
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
