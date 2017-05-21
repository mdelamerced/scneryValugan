import processing.sound.*; //<>// //<>//
import processing.video.*;
import processing.opengl.*;

Movie valugan;
Movie pacific;
Capture video;


void setup() {
  size(1440, 720);
  background (0);
  video = new Capture (this, "Logitech Camera,size=960x540,fps=15");
  // video = new Capture (this, "FaceTime HD Camera,size=640x360,fps=30");
  video.start();
  //  valugan = new Movie(this, "valugan.mov");
  valugan = new Movie (this, "rocks_notfinalaudio.mp4");
  pacific = new Movie(this, "ocean.mp4");
  valugan.loop();
  pacific.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  if (video.available()) {
    video.read();
    int brightX = 0;
    int brightY = 0;
    float brightValue = norm (0, 0, 0.5);
    //  color trackColor = color(255, 255, 255);

    video.loadPixels();
    int index = 0;
    for (int y=0; y< video.height; y++) {
      for (int x=0; x < video.width; x++) {
        int pixelValue = video.pixels[index];
        float pixelBrightness = brightness(pixelValue);
        if (pixelBrightness > brightValue) {
          //  if (trackColor == pixelBrightness){
          brightValue = pixelBrightness;
          brightY = y;
          brightX = x;
          println(brightValue);
        }  
        index++;
      }
    }
    if (brightValue>50) {
      tint(255, 40);
      image (valugan, 0, 0, width, height);
      valugan.loop();
      pacific.stop();
    } else if (brightValue<30) {
      tint(255, 40);
      pacific.loop();
      image(pacific, 0, 0, width, height);
      valugan.stop();
    }
  }
}