PImage img;

void setup()
{
    size( 450, 400 );
    img = loadImage("fire-extinguisher.jpg");
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
            float c = brightness( img.get( i, j ) );
            fill( c );
            ellipse( i, j, 10, 10 );
        }
    }
}
