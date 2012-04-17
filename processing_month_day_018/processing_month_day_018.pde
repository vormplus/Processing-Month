SpaceShip spaceShip;

ArrayList<Asteroid> asteroids;

int score;
int life;

void setup()
{
    size( 450, 400 );
    
    spaceShip = new SpaceShip();

    asteroids = new ArrayList<Asteroid>();
    for (int i = 0; i < 10; i++) {
        asteroids.add( new Asteroid() );
    }
    
    score = 0;
    life = 3;

}

void draw()
{
    background(0);
    noSmooth();
 
    if ( life > 0 ) {
 
        for (Asteroid a : asteroids ) {
            a.update();
            a.render();
        
            if ( collide( a ) ) {
                spaceShip.hit = true;
            }
        }

        spaceShip.render();

        if ( spaceShip.hit && spaceShip.starRadius > 40 ) {
            resetAfterHit();
        }
    } else {
        fill(255);
        text("GAME OVER", 255, 200 );
    }

    fill(255);
    text("SCORE: " + nf(score, 5) + " LIFE: " + life, 225, 20);
    
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
    
    if (key == ' ' && life == 0 ) {
        resetGame();
    }
}
