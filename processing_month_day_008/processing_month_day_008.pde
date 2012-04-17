int numBubbles = 50;
Bubble[] bubbles;

void setup()
{
    size(450, 400);
    
    bubbles = new Bubble[numBubbles];
    for (int i = 0; i < numBubbles; i++) {
        bubbles[i] = new Bubble();
    }
}

void draw()
{
    background(39, 61, 118);
    smooth();
    
    for (int i = 0; i < bubbles.length; i++) {
        bubbles[i].update();
        bubbles[i].render();
        if ( bubbles[i].loc.y < -50) {
            bubbles[i].reset();
        }
    }
}
        

