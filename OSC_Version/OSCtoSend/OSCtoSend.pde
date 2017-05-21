import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

void setup()
{
  size(400, 400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this, 5555);

  myRemoteLocation = new NetAddress("127.0.0.1", 5555);
}

void draw()
{
  background(0);
} 

void mousePressed()
{
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage( "play the ocean" );

  myMessage.add(new int[] { 1 }); 

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}

void keyPressed(){
  
  
  
  
  
}