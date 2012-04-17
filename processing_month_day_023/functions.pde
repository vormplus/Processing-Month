// Function to convert an integer into a byte Array (4 bytes).
byte[] intToByteArray(int number) {
    byte[] result = new byte[4];
    for (int i = 0; i < 4; i++) {
        int offset = (result.length - 1 - i) * 8;
        result[i] = (byte) ((number >>> offset) & 0xff);
    }
    return result;
}

// Function to convert the current mouse position into a byte Array (9 bytes)
// The last byte will be used to separate the mouse coordinates so it will be
// easier for the client application to read 
byte[] getMousePositionAsByteArray()
{
    byte[] x = intToByteArray( mouseX );
    byte[] y = intToByteArray( mouseY );
    
    byte[] b = new byte[9];
    for (int i = 0; i < 4; i++) {
        b[i] = x[i];
    }
    
    for (int i = 4; i < 8; i++) {
        b[i] = y[i-4];
    }
    
    b[8] = 10;

    return b;
}
