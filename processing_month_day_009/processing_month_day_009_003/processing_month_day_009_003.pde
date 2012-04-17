PImage img;

void setup()
{
    size( 450, 400 );
    img = loadImage("ceiling.jpg");
    noStroke();
    
    strokeWeight(2);
}

void draw()
{
    background(0);
    smooth();
    
    translate( 5, 5 );

    for (int i = 0; i < width; i+=10) {
        for (int j = 0; j < height; j+=10) {
            int   c = img.get( i, j );
            float b = brightness( c );
            fill( b );
            stroke( c );
            float r = map( b, 0, 255, 0, 10);
            ellipse( i, j, r, r ); 
        }
    }
}
