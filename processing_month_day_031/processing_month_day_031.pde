import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

int contrastValue;;
int brightnessValue;

boolean DEBUG = false;

void setup()
{
    size( 1024, 768 );
    
    contrastValue = 0;
    brightnessValue = 0;
    
    opencv = new OpenCV( this );
    opencv.capture( 640, 480 );
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
}

void draw()
{
    opencv.read();
    opencv.flip( OpenCV.FLIP_HORIZONTAL );
    opencv.contrast( contrastValue );
    opencv.brightness( brightnessValue );
    
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
    
    if ( faces.length > 0 ) {
        
        float x = map( faces[0].x, 0, 640, 0, 1024 );
        float y = map( faces[0].y, 0, 480, 0, 768 );
        float f = map( faces[0].width, 0, 640, 0, 1024 );
        
        if ( f <= 200) {
            // no blurring
        } else if ( f > 200 && f <= 300 ) {
            opencv.blur( OpenCV.GAUSSIAN, 11 );    
        } else if ( f > 300 && f <= 400 ) {
            opencv.blur( OpenCV.GAUSSIAN, 31 );    
        } else if ( f > 400 && f <= 500 ) {
            opencv.blur( OpenCV.GAUSSIAN, 51 );   
        } else {
            opencv.blur( OpenCV.GAUSSIAN, 71 );
        }
        
        image( opencv.image(), 0, 0, width, height );
        
        if ( DEBUG ) {
            noFill();
            stroke( 255, 0, 0 );
            rect( x, y, f, f );
        }
    }
}

public void stop()
{
    opencv.stop();
    super.stop();
}

void keyPressed()
{
    if ( keyCode == UP ) {
        contrastValue++;
        contrastValue = constrain( contrastValue, -128, 128 );
    }
    
    if ( keyCode == DOWN ) {
        contrastValue--;
        contrastValue = constrain( contrastValue, -128, 128 );
    }

    if ( keyCode == LEFT ) {
        brightnessValue++;
        brightnessValue = constrain( brightnessValue, -128, 128 );
    }
    
    if ( keyCode == RIGHT ) {
        brightnessValue--;
        brightnessValue = constrain( brightnessValue, -128, 128 );
    }
    
    if ( key == 'd' ) {
        DEBUG = !DEBUG;
    }
}


