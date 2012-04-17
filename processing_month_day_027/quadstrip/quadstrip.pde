boolean saveOne = false;

void setup()
{
    size( 440, 100 );
}

void draw()
{

    background(0);
    noFill();
    stroke(255);
    smooth();

    translate( 20, 20 );

    beginShape(QUAD_STRIP);
    for (int i = 0; i < 11; i++) {
        vertex( i * 40, 0 );
        vertex( i * 40, 60 );
    }
    endShape();


    if (saveOne) {
        saveFrame("images/"+getClass().getSimpleName()+"-####.png");
        saveOne = false;
    }
}

void keyPressed()
{
    if (key == 's') {
        saveOne = true;
    }
}

