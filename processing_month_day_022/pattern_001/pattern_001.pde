import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;

ClLovers cl;
ClLoversTheme[] ctl;

int numLines = 9;

int decay;

void setup()
{
    size( 440, 440 );
    
    cl = new ClLovers(this);
    ctl = cl.searchForThemes("strawberry");
}

void draw()
{
    background(0);
    smooth();

    decay = floor( random( 2, 4 ));    

    for ( int i = 0; i < 21; i++ ) {
        for ( int j = 0; j < 21; j++ ) {
            stroke( ctl[floor(random(ctl.length))].getColor(0) );
            strokeWeight( random( 1, 2 ));
            pushMatrix();
            translate( i * 22, j * 22 );
            drawShape();
            popMatrix();
        }
    }
    
    saveFrame("images/pattern-#####.png");
    noLoop();
}


void drawShape()
{
    float a = TWO_PI / numLines;
    for (int i = 0; i < numLines; i++) {
        if ( !(i % decay == 0) ) {
            float x = cos( a * i ) * 20;
            float y = sin( a * i ) * 20;
            line( 0, 0, x, y );
        }
    }
}

void keyPressed()
{
    if (key == ' ') {
        loop();
    }
}
