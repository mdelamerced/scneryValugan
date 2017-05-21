var capture;
var valugan;
var ocean;

function setup() {
createCanvas (1440, 720);
capture = createCapture(VIDEO);
valugan = createVideo("ocean.mp4");
ocean = createVideo("valugan.mp4");
capture.hide;
valugan.hide;
ocean.hide;
}

function draw() {
	background (0);

   var index = 0;
	capture.loadPixels();

   var x = new Array ();
   var y = new Array ();

for (var y=0; y< capture.height; y++) {
   for (var x=0; x < capture.width; x++) {
      var pixelValue = capture.pixels[index];
      colorMode(HSB,255);
     // b = color(0,0,255);
      var pixelBrightness; = brightness(color);
      if (pixelBrightness > brightValue) {
         var brightValue = pixelBrightness;
         var  brightY = y;
         var brightX = x;
   println(brightValue);
   }  
   index++
   if (brightValue > 50) {

   tint(255, 40);
   image (valugan, 0, 0, 1440, 720);
  // valugan.play();
   valugan.loop();
   ocean.stop();

   } else if (brightValue < 30) {
   valugan.stop();
   tint(255, 40);
   image(ocean, 0, 0, 1440, 720);
  // ocean.play();
   ocean.loop();
   }
  
}
}
}