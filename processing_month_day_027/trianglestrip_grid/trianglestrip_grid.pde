boolean saveOne = false;

void setup()
{
    size( 440, 440 );
}

void draw()
{

    background(0);
    noFill();
    stroke(255);
    smooth();

    translate( 20, 20 );

    for (int j = 0; j < 10; j ++) {
        beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < 11; i++) {
            vertex( i * 40, j * 40 );
            vertex( i * 40, (j+1) * 40 );
        }
        endShape();
    }


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

