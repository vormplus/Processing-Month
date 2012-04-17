int numValues = 60;
float[] values = new float[numValues];

CircularBarChart chart;

void setup()
{
    size( 440, 440 );
    
    for ( int i = 0; i < numValues; i++ ) {
        values[i] = random( 100 );
    }
    
    chart = new CircularBarChart( values );
    
    noLoop();
}

void draw()
{
    background( 255 );
    smooth();
    translate( width/2, height/2);

    stroke( 0 );
    strokeWeight( 3 );
    strokeCap(SQUARE);
    
    chart.renderLines();
    
    saveFrame("images/circular-bar-chart-"+numValues+".png");
}
