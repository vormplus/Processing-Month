class CircularChart
{
    float maxRadius;
    float minRadius;
    
    float values[];
    
    float angle;
    
    CircularChart(float[] _values)
    {
        minRadius = MIN_RADIUS;
        maxRadius = MAX_RADIUS;
        
        values = _values;
        
        angle = TWO_PI / float( values.length );
        
    }

    void renderPolygon()
    {
        float closeX = 0;
        float closeY = 0;
        
        beginShape();
        for (int i = 0; i < values.length; i++) {
            
            float r = map(values[i], 0, 100, minRadius, maxRadius);

            if ( i == 0 ) {
                closeX = cos(i * angle) * r;
                closeY = sin(i * angle) * r;
            }
            
            float x1 = cos(i * angle) * r;
            float y1 = sin(i * angle) * r;
            
            float x2 = cos((i + 1) * angle) * r;
            float y2 = sin((i + 1) * angle) * r;
            
            vertex(x1, y1);
            vertex(x2, y2);
        }

        endShape(CLOSE);
        
        ellipse( 0, 0, minRadius, minRadius );
        ellipse( minRadius/2 + 5, 0, 4, 4 );
    }

    void renderCircles()
    {
        float diff = maxRadius - minRadius;
        
        for (int i = 0; i < 10; i++) {
            float r = lerp( minRadius, maxRadius, i / 10.0 ) * 2;
            noFill();
            ellipse( 0, 0, r, r );
        }
        
        ellipse( 0, 0, maxRadius * 2, maxRadius * 2 );
    }    
}
