PImage img;

int numBrushes = 50;
Brush[] brushes;

void setup()
{
    size( 450, 400 );
    background(255);
    rectMode(CENTER);
    
    img = loadImage("wires.jpg");
    
    brushes = new Brush[numBrushes];
    for (int i = 0; i < numBrushes; i++) {
        brushes[i] = new Brush();
    }
    
    noStroke();
}

void draw()
{
    smooth();
    
    for (int i = 0; i < brushes.length; i++) {
        brushes[i].update();
        brushes[i].render();
    }
}

color getTransparentColor( color c, float a )
{
    int r = (c >> 16) & 0xff;
    int g = (c >> 8) & 0xff;
    int b = c & 0xff;
		
    return color(r, g, b, a);
}
