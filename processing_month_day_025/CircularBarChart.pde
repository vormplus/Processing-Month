class CircularBarChart
{
    float maxRadius;
    float minRadius;
    
    float values[];
    
    float angle;
    
    CircularBarChart(float[] _values)
    {
        minRadius = 50;
        maxRadius = 200;
        
        values = _values;
        
        angle = TWO_PI / float( values.length );
        
    }

    void renderLines()
    {
        for (int i = 0; i < values.length; i++) {
            
            float x1 = cos( i * angle ) * ( minRadius / 2 );
            float y1 = sin( i * angle ) * ( minRadius / 2 );
            
            float r = map(values[i], 0, 100, minRadius, maxRadius);
            
            float x2 = cos( i * angle ) * r;
            float y2 = sin( i * angle ) * r;
            
            line(x1, y1, x2, y2);
        }
        
    } 

}
