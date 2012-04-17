// Function to convert a byte Array (4 bytes) into an integer
int byteArrayToInt(byte[] bytes) {
    int bits = 0;
    int counter = 0;
    for (int i = 3; i >= 0; i--) {
        bits |= ((int) bytes[counter] & 0xff) << (i * 8);
        counter++;
    }
    return bits;
}
