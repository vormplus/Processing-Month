PImage img;

void setup()
{
    size( 450, 400 );
    img = loadImage("superhero.jpg");
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
            float r = map( c, 0, 255, 0, 10);
            fill( 255 );
            ellipse( i, j, r, r ); 
        }
    }
}
