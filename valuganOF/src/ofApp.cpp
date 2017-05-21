#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    valugan.load("valugan.mp4");
    ocean.load("ocean.mp4");
    cam.setup(640,480);
    
  //  float brightestValue = 0;

    vector<ofVideoDevice> devices = cam.listDevices();
    
    for(int i = 0; i < devices.size(); i++){
        if(devices[i].bAvailable){
            //log the device
            ofLogNotice() << devices[i].id << ": " << devices[i].deviceName;
        }else{
            //log the device and note it as unavailable
            ofLogNotice() << devices[i].id << ": " << devices[i].deviceName << " - unavailable ";
        }
        
        cam.setDeviceID(0);
        cam.setDesiredFrameRate(15);
        cam.initGrabber(camWidth, camHeight);
    }
    
}

//--------------------------------------------------------------
void ofApp::update(){
    valugan.update();
    ocean.update();
    cam.update();
    
    // this looks for the brightest point in the webcam , there is an IR filter attached to the webcam
    if(cam.isFrameNew()) {
        float brightestValue = 0;
        int brightestX = 0, brightestY = 0;
        int width = cam.getWidth();
        int height = cam.getHeight();
        ofPixels& pix = cam.getPixels();
        for(int y = 0; y < height; y++) {
            for(int x = 0; x < width; x++) {
                float brightness = pix.getColor(x, y).getBrightness();
                if(brightness > brightestValue) {
                    brightestValue = brightness;
                    brightestX = x;
                    brightestY = y;
                    
                    //for debugging purposes to see the value of brightness
                    std::cout << "brightness: " << brightestValue << endl;
                    
                }
            }
        }
    }
}


//--------------------------------------------------------------
void ofApp::draw(){
 

    
    //for debugging purposes to see the value of brightness
    std::cout << "brightnessV: " << brightestValue << endl;

 
      if (brightestValue > 51){
        valugan.draw(0,0, 1440, 720);
        ocean.stop();
        valugan.play();
        valugan.setLoopState(OF_LOOP_NORMAL);
    }

     else if (brightestValue< 50){

            ocean.draw(0,0, 1440, 720);
            valugan.stop();
            ocean.play();
            ocean.setLoopState(OF_LOOP_NORMAL);
            
        }

    }

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){
    
}

