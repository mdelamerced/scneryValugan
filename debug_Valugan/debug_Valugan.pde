//import ddf.minim.*;
import processing.video.*;
import processing.sound.*;



Movie valugan;
Movie pacific;
Capture video;
//Minim minim;
//AudioPlayer player;
//SoundFile soundfile;


void setup() {
  size(1440, 720);
  background (0);
 // minim = new Minim(this);
  //soundfile = new SoundFile (this, "rocks.aif");
  //  video = new Capture (this, "Logitech Camera,size=960x540,fps=15");
  // video = new Capture (this, "FaceTime HD Camera,size=640x360,fps=15");
  //  video.start();
 // player = minim.loadFile("rocks.mp3");
  valugan = new Movie(this, "valugan.mp4");
  //valugan = new Movie (this, "rocks_notfinalaudio.mp4");
  pacific = new Movie(this, "ocean.mp4");
 // player.loop();
}

void movieEvent(Movie m) {
  m.read();
}

void draw () {
  //println(mouseY);
  if (mouseY> height/2 ) {
    pacific.stop();
    tint(255, 40);
    image(valugan, 0, 0, width, height);
    valugan.loop();
 //   player.play();
   
    // soundfile.play();
  } else {
    valugan.stop();
    //  soundfile.stop();
    tint(255, 40);
    image(pacific, 0, 0, width, height);
    pacific.loop();
  //  player.pause();
  }

  /*  if (video.available()) {
   video.read();
   int brightX = 0;
   int brightY = 0;
   float brightValue =0;
   
   
   video.loadPixels();
   int index = 0;
   for (int y=0; y< video.height; y++) {
   for (int x=0; x < video.width; x++) {
   int pixelValue = video.pixels[index];
   float pixelBrightness = brightness(pixelValue);
   if (pixelBrightness > brightValue) {
   //   if (trackColor == pixelBrightness) {
   brightValue = pixelBrightness;
   brightY = y;
   brightX = x;
   println(brightValue);
   }  
   index++;
   }
   }
   if (brightValue > 50) {
   
   tint(255, 40);
   image (valugan, 0, 0, 1440, 720);
   valugan.loop();
   pacific.stop();
   } else if (brightValue < 30) {
   valugan.stop();
   tint(255, 40);
   image(pacific, 0, 0, 1440, 720);
   
   pacific.loop();
   }
   }*/
}