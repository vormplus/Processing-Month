class Particle
{
    PVector loc;
    PVector vel;
    color   c;
    
    Particle()
    {
        loc = new PVector( random(width), height/2 + random(-100, 100) );
        vel = new PVector( random(-2, 2), random(-1, 1) );
        
        c = color( mainHue, random(100), random(100) );
    }

    void update()
    {
        loc.add( vel );
    }
    
    void render()
    {
        strokeWeight(8);
        stroke( c );
        point( loc.x, loc.y );
    }

    boolean isDead()
    {
        if ( loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height ) {
            return true;
        } else {
            return false;
        }
    }
}
