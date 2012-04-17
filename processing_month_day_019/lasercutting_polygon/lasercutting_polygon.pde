import processing.pdf.*;

color cutColor     = color( 255, 0, 0 );
color engraveColor = color( 0 );

void setup()
{
    size( 800, 800, PDF, "pdf/lines.pdf" );
}

void draw()
{
    background( 255 );
    noFill();
    
    translate( width/2, height/2 );
    
    stroke( engraveColor );
    for ( int i = 0; i < 100; i++ ) {
        
        float a1 = random( TWO_PI );
        float r1 = random( width/2 );
        float x1 = cos( a1 ) * r1;
        float y1 = sin( a1 ) * r1;
        
        float a2 = random( TWO_PI );
        float r2 = random( width/2 );
        float x2 = cos( a2 ) * r2;
        float y2 = sin( a2 ) * r2;
        
        line( x1, y1, x2, y2 );
    }
    
    stroke( cutColor );
    regularPolygon( width/2, 8 );
    
    exit();
}

void regularPolygon( float radius, int numPoints )
{
    float angle = TWO_PI / numPoints;
    
    beginShape();
    for (int i = 0; i < numPoints; i++) {
        float x = cos( i * angle ) * radius;
        float y = sin( i * angle ) * radius;
        vertex( x, y );
    }
    endShape(CLOSE);
}
