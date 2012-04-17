import processing.net.*;

Server server;

void setup()
{
    size( 640, 480 );
    server = new Server( this, 5000 );
    background( 0 );    
}

void draw()
{    
    server.write( getMousePositionAsByteArray() );
}

