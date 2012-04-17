class Brush
{
    PVector loc;
    float   r;
    color   c;
    float   rot;
    
    Brush()
    {
        loc = new PVector( random(width), random(height) );
        r   = random(5, 15);
        rot = random( TWO_PI );
    }
    
    void update()
    {
        loc.x += random(-2, 2);
        loc.y += random(-2, 2);
        
        loc.x = constrain( loc.x, 0, width );
        loc.y = constrain( loc.y, 0, height );
        
        c = getTransparentColor( img.get( floor(loc.x), floor(loc.y) ), 64);
        
        rot += 0.01;
    }
    
    void render()
    {
        fill( c );
        pushMatrix();
        translate( loc.x, loc.y );
        rotate( rot );
        stroke( 0, 64 );
        rect( 0, 0, r * 2, r * 2 );
        popMatrix();
    }
}
