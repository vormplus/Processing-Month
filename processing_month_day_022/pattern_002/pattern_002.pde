import colorLib.calculation.*;
import colorLib.*;
import colorLib.webServices.*;

ClLovers cl;
ClLoversTheme[] ctl;

int numLines = 11;

void setup()
{
    size( 440, 440 );
    
    cl = new ClLovers(this);
    ctl = cl.searchForThemes("sunshine");
    
    rectMode(CENTER);
    noFill();
}

void draw()
{
    background(0);
    smooth();
    for ( int i = 0; i < 21; i++ ) {
        for ( int j = 0; j < 21; j++ ) {
            stroke( ctl[floor(random(ctl.length))].getColor(0) );
            pushMatrix();
            translate( i * 22, j * 22 );
            drawShape();
            popMatrix();
        }
    }

    saveFrame("images/pattern-#####.png");
    noLoop();
    
    noLoop();
}


void drawShape()
{
    int decay = floor( random( 1, numLines/2 ));
    
    float a = TWO_PI / numLines;
    for (int i = 0; i < numLines; i++) {
        if ( !(i % decay == 0) ) {
            rotate( a * i );
            rect( 0, 0, 4, 40 );
        }
    }
}

void keyPressed()
{
    if (key == ' ') {
        loop();
    }
}
