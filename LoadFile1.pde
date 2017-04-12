/**
 * LoadFile 1
 * 
 * Loads a text file that contains two numbers separated by a tab ('\t').
 * A new pair of numbers is loaded each frame and used to draw a point on the screen.
 */

String[] lines;
int index = 0;
int frames = 0;
int px, py = -1;

void setup() {
  size(640, 480);
  background(0);
  stroke(255);
  //frameRate(15);
  frameRate(30);
  lines = loadStrings("/tmp/positions.txt");
}

void draw() {
  background(0);
  lines = loadStrings("/tmp/positions.txt");
  //println("lines.length = ", lines.length);
  //println("frames = ", frames);
  //if (index < lines.length) {
  while (index < lines.length) {
    String[] pieces = split(lines[index], '\t');
    //println("pieces.length = ", pieces.length);
    if (pieces.length == 2) {
      int x, y;
      if (frames % 2 == 0) {
        x = int(pieces[0]);
        y = int(pieces[1]);
      }
      else {
        x = 640 - int(pieces[0]);
        y = int(pieces[1]);
      }
      //point(x, y);
      if (px == -1 || py == -1) {
        px = x;
        py = y;
      }
      line(px, py, x, y);
      px = x;
      py = y;
    }
    // Go to the next line for the next run through draw()
    index = index + 1;
  }
  index = 0;
  px = -1;
  py = -1;
  frames = frames + 1;
}