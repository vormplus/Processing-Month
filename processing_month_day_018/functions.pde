boolean collide(Asteroid a)
{
    boolean line1 = circleLineIntersect(spaceShip.point1.x, spaceShip.point1.y, spaceShip.point2.x, spaceShip.point2.y, a.location.x, a.location.y, a.radius);
    boolean line2 = circleLineIntersect(spaceShip.point3.x, spaceShip.point3.y, spaceShip.point1.x, spaceShip.point1.y, a.location.x, a.location.y, a.radius);

    if ( line1 || line2 ) {
        return true;
    } else {
        return false;
    }
}

// Code adapted from Paul Bourke:
// http://local.wasp.uwa.edu.au/~pbourke/geometry/sphereline/raysphere.c
boolean circleLineIntersect(float x1, float y1, float x2, float y2, float cx, float cy, float cr )
{
    float dx = x2 - x1;
    float dy = y2 - y1;
    
    float a = dx * dx + dy * dy;
    float b = 2 * (dx * (x1 - cx) + dy * (y1 - cy));
    float c = cx * cx + cy * cy;
    c += x1 * x1 + y1 * y1;
    c -= 2 * (cx * x1 + cy * y1);
    c -= cr * cr;
    float bb4ac = b * b - 4 * a * c;

    if (bb4ac < 0) {
        return false;
    } else {
        float mu = (-b + sqrt( b*b - 4*a*c )) / (2*a);
        float ix1 = x1 + mu*(dx);
        float iy1 = y1 + mu*(dy);
        mu = (-b - sqrt(b*b - 4*a*c )) / (2*a);
        float ix2 = x1 + mu*(dx);
        float iy2 = y1 + mu*(dy);
        float testX;
        float testY;

        if (dist(x1, y1, cx, cy) < dist(x2, y2, cx, cy)) {
            testX = x2;
            testY = y2;
        } else {
            testX = x1;
            testY = y1;
        }

        if (dist(testX, testY, ix1, iy1) < dist(x1, y1, x2, y2) || dist(testX, testY, ix2, iy2) < dist(x1, y1, x2, y2)) {
            return true;
        } else {
            return false;
        }
    }
}

void star( float _x, float _y, float _radius)
{
    int numSpikes = 9;
    int numPoints = numSpikes * 2;
    float angle = TWO_PI / float(numPoints);
    
    pushMatrix();
    translate( _x, _y );
    beginShape();
    for (int i = 0; i < numPoints; i++) {
        float x;
        float y;
        if ( i % 2 == 0 ) {
            x = cos( angle * i ) * _radius;
            y = sin( angle * i ) * _radius;
        } else {
            x = cos( angle * i ) * (_radius / 2);
            y = sin( angle * i ) * (_radius / 2);
        }
        vertex( x, y );
    }
    endShape(CLOSE);
    popMatrix();
}

void resetAfterHit()
{
    for (Asteroid a : asteroids ) {
        a.reset();
    }
    
    spaceShip.reset();
    
    life--;
    
    delay(1000);

}

void resetGame()
{
    for (Asteroid a : asteroids ) {
        a.reset();
    }
    
    spaceShip.reset();
    
    life = 3;
    score = 0;

}
