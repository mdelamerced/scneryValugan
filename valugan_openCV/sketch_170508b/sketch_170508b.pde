import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

void setup() {
  size(720, 486);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV (this, "Logitech Camera,size=960x540,fps=15");
 // opencv = new OpenCV(this, 640/2, 480/2);


  video.start();
}

void draw() {
  image(opencv.getOutput(), 0, 0); 
  PVector loc = opencv.max();
  scale(2);
  opencv.loadImage(video);

  // image(video, 0, 0 );

  stroke(255, 0, 0);
  strokeWeight(4);
  noFill();
  ellipse(loc.x, loc.y, 10, 10);
}

void captureEvent(Capture c) {
  c.read();
}