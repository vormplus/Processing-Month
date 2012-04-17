int spacer = 8;
int minW   = 10;
int maxW   = 80;
int minH   = 30;
int maxH   = 70;

int currentX, currentY;
int currentW, currentH;

float transparency = 64;

boolean nextColumn = true;

void setup()
{
    size(450, 600);

    background(128);
    fill(255);

    currentW = (int)random(minW, maxW);
    currentH = (int)random(minH, maxH);

    currentX = spacer;
    currentY = spacer;
    
    stroke(0, 255, 0);
    
    // horizontal lines at bottom
    line(0, height - spacer, width, height-spacer);
    line(0, height - spacer - minH, width, height - spacer - minH);

    line(0, height - (spacer*2) - minH, width, height - (spacer*2) - minH);
    line(0, height - (spacer*2) - maxH, width, height - (spacer*2) - maxH);

    // vertical lines at right side
    line(width - spacer, 0, width - spacer, height);
    line(width - spacer - minW, 0, width - spacer - minW, height);

    line(width - (spacer*2) - minW, 0, width - (spacer*2) - minW, height);
    line(width - (spacer*2) - maxW, 0, width - (spacer*2) - maxW, height);
    
    stroke(0);
    
}

void draw()
{
    if ( !nextColumn ) {
        currentY += currentH + spacer;
        currentH = (int)random(minH, maxH);
        
        if (currentY + currentH > height - minH - (spacer * 2) ) {
            fill( 0, 0, 255, transparency );           
            currentH = height - currentY - spacer;
        }
        
    } else {
        currentW = (int)random(minW, maxW);
        nextColumn = false;
    }

    if ( !(currentY + currentH > height - spacer) ) {
        if ( currentY + currentH > height - spacer - minH ) {
            currentH = height - spacer - currentY;

            fill( 255, 0, 0, transparency );
            rect( currentX, currentY, currentW, currentH );

            currentX += currentW + spacer;
            currentY = spacer;
            
            nextColumn = true;

        } else {
            if ( currentX + currentW > width - (spacer * 2) - minW ) {
                currentW = width - spacer - currentX; 
                if (currentW > minH) {
                    fill( 0, 255, 255, transparency );
                    rect( currentX, currentY, currentW, currentH );
                }
            } else {
                    fill( 0, transparency );
                    rect( currentX, currentY, currentW, currentH );
            }
        }
    }

    if (currentX >= width - spacer) {
        noLoop();
    }

    saveFrame("images/rectangle-fitting-#####.png");
}
