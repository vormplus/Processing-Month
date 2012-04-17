PImage img;

float r = 15;

float minRadius = 10;
float maxRadius = 20;

boolean grow = false;

boolean saveOne = false;

void setup()
{
    size( 450, 400 );
    background(255);
    
    img = loadImage("milky.jpg");
    
    noStroke();
}

void draw()
{
    smooth();
    
    color c = getTransparentColor( img.get( mouseX, mouseY ), 64 );
    fill( c );

    ellipse(mouseX, mouseY, r * 2, r * 2);
    
    if ( grow ) {
        r++;
        if (r > maxRadius) {
            grow = false;
        } 
    } else {
        r--;
        if (r < minRadius) {
            grow = true;
        }
    }
}

color getTransparentColor( color c, float a )
{
    int r = (c >> 16) & 0xff;
    int g = (c >> 8) & 0xff;
    int b = c & 0xff;
		
    return color(r, g, b, a);
}
