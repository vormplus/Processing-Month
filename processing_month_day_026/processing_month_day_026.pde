int numValues = 60;
float[] values = new float[numValues];

CircularChart chart;

void setup()
{
    size( 440, 440 );
    
    for ( int i = 0; i < numValues; i++ ) {
        values[i] = random( 100 );
    }

    chart = new CircularChart( values );

    noLoop();
}

void draw()
{    
    
    background(255);
    smooth();
    pushMatrix();
    translate(width/2, height/2);
    stroke( 255, 0, 0 );
    strokeWeight( 1.5 );
    chart.renderPolygon();
    stroke( 0 );
    strokeWeight( 1 );
    chart.renderCircles();
    popMatrix();
    
    saveFrame("images/data-visualisation.png");
}
