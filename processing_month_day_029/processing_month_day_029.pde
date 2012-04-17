boolean saveOne = false;

PVector[][] vertices = new PVector[11][11];

void setup()
{
    size( 440, 440, P3D );
    
    for (int j = 0; j < 11; j++) {
        for (int i = 0; i < 11; i++) {
            vertices[i][j] = new PVector( i*40 + random(-10, 10), j*40 + random(-10, 10), random(-20, 20) );
        }
    }
    
}

void draw()
{

    background(0);
    lights();
    fill(255);
    noStroke();
    smooth();

    translate( width/2, 20, -100 );
    rotateY( radians( frameCount ));
    
    pushMatrix();
    translate( -width/2, 0 );
    
    for (int j = 0; j < 10; j ++) {
        beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < 11; i++) {
            vertex( vertices[i][j].x  , vertices[i][j].y  , vertices[i][j].z );
            vertex( vertices[i][j+1].x, vertices[i][j+1].y, vertices[i][j+1].z );
        }
        endShape();
    }

    popMatrix();

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

