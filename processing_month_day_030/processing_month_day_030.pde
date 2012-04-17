import processing.video.*;

boolean saveOne = false;

ArrayList<Particle> particles;

float mainHue;

MovieMaker mm;

void setup()
{
    size( 1920, 1080 );

    colorMode( HSB, 360, 100, 100, 100 );
    
    mainHue = random( 360 );
        
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 200; i++) {
        particles.add( new Particle() );
    }
    
    mm = new MovieMaker( this, width, height, "video/stellar-system2.mov", 25, MovieMaker.ANIMATION, MovieMaker.BEST );
}

void draw()
{
    background(0);
    smooth();
    
    stroke(255);
    noFill();
    
    for (int i = particles.size() - 1; i >= 0; i--) {
        Particle p = particles.get( i );
        p.update();
     
        for (int j = particles.size() - 1; j >= 0; j--) {
            Particle p2 = particles.get( j );
            
            if ( j != i ) {
                float dst = dist( p.loc.x, p.loc.y, p2.loc.x, p2.loc.y );
                if (dst < 100 ) {
                    strokeWeight(0.5);
                    stroke( 0, 0, 99 ); 
                    line( p.loc.x, p.loc.y, p2.loc.x, p2.loc.y );
                    for (int k = 0; k < 10; k++) {
                        float x = lerp( p.loc.x, p2.loc.x, k/10.0);
                        float y = lerp( p.loc.y, p2.loc.y, k/10.0);
                        strokeWeight(4);
                        color c = lerpColor( p.c, p2.c, k/10.0);
                        stroke(c);
                        point( x, y );
                    } 
                }
            }        
        }
        
        p.render();
        
        if (p.isDead() ) {
            particles.remove( p );

            particles.add( new Particle() );
        }
    }
    
    mainHue++;
    if (mainHue > 360) {
        mainHue = 0;
    }
    
    if (saveOne) {
        saveFrame("images/"+getClass().getSimpleName()+"-####.png");
        saveOne = false;
    }
    
    mm.addFrame();
    if ( frameCount == 750 ) {
        mm.finish();
        exit();
    }
}

void keyPressed()
{
    if (key == 's') {
        saveOne = true;
    }
}

