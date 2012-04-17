import processing.net.*;

Client client;
int dataIn;

byte[] byteBuffer = new byte[9];
byte interesting = 10;

float prevX, prevY;

void setup()
{
    size( 640, 480 );
    client = new Client( this, "127.0.0.1", 5000 );
    
    background( 0 );
    noFill();
    stroke( 255 );
}

void draw()
{
    fill( 0, 8);
    noStroke();
    rect( 0, 0, width, height );

    noFill();
    stroke( 255 );
    
    if ( client.available() > 0 ) {
        
        int byteCount = client.readBytesUntil( interesting, byteBuffer );
        
        byte[] xb = new byte[4];
        for (int i = 0; i < 4; i++) {
            xb[i] = byteBuffer[i];
        }
        
        byte[] yb = new byte[4];
        for (int i = 0; i < 4; i++) {
            yb[i] = byteBuffer[i+4];
        }
        
        int x = byteArrayToInt( xb );
        int y = byteArrayToInt( yb );
        
        line( x, y, prevX, prevY );
        ellipse( x, y, 10, 10 );
        
        prevX = x;
        prevY = y;
    }
    
}
