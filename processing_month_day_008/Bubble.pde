class Bubble
{
    PVector loc;
    float   speed;
    float   radius;
    
    Bubble()
    {
        loc = new PVector( random(width), random(height) );
        speed = random(0.5, 2);
        radius = random( 5, 10 );
    }
    
    void update()
    {
        loc.y -= speed;
    }
    
    void render()
    {
        stroke(59, 173, 224);
        fill(59, 173, 224, 64);
        for (int i = 1; i < 3; i++) {
            ellipse( loc.x, loc.y, i * radius * 2, i * radius * 2 ); 
        }
    }
    
    void reset()
    {
        loc.x = random(width);
        loc.y = height + 50;
        speed = random(0.5, 2);
        radius = random( 5, 10 );
    }
    
}
