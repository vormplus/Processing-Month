boolean saveOne = false;

PVector[][] vertices = new PVector[11][11];

void setup()
{
    size( 440, 440 );
    
    for (int j = 0; j < 11; j++) {
        for (int i = 0; i < 11; i++) {
            vertices[i][j] = new PVector( i*40 + random(-10, 10), j*40 + random(-10, 10) );
        }
    }
    
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
            vertex( vertices[i][j].x, vertices[i][j].y );
            vertex( vertices[i][j+1].x, vertices[i][j+1].y );
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

