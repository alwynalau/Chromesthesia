//Ketai Library Used
//References: AudioInput and Accelerometer Sketches
PImage title, help, end;
PFont gothic;
int state =1;
import ketai.sensors.*;
KetaiAudioInput mic;
short[] voice;

KetaiSensor sensor;
float accelerometerA, accelerometerB, accelerometerC;


void setup()
{
  orientation(LANDSCAPE);
  mic = new KetaiAudioInput(this);
  sensor = new KetaiSensor(this);
  sensor.start();
  title = loadImage("title.jpg");
  help = loadImage("help.jpg");
  end = loadImage("end.jpg");
  gothic = loadFont("gothic.vlw");
  frameRate(24);
  println("Hi");
}


void draw()
{
  println(state);
  if (state == 1) {
    background(0);
    imageMode(CENTER);
    image(title, width/2, height/2);
  }
  else if (state ==2) {
    background(0);
    imageMode(CENTER);
    image(help, width/2, height/2);
  }
  else if (state ==3) {
    //background(0);
    mic.isActive();

    if (voice != null)
    {  
      for (int i = 0; i < voice.length*0.5; i++)
      {
        if ((i != voice.length*0.5-1)&&(accelerometerA<=2)) {
          stroke(60, 240, 120, 10);
          fill(240, 100, 100, 50);
          rect(i, map(voice[i], -10000, 10000, width, 0), i+1, map(voice[i+1], -30000, 30000, height, 0));
        }
        if ((i != voice.length*0.5-1)&&(accelerometerB<=2)) {
          stroke(60, 120, 240, 50);
          fill(60, 240, 120, 50);
          rect(i, map(voice[i], -10000, 10000, height, 0), i+1, map(voice[i+1], -30000, 30000, height, 0));
        }
        if ((i != voice.length*0.5-1)&&(accelerometerC<=2)) {
          stroke(100, 100, 240, 10);
          fill(60, 120, 240, 50);
          rect(i, map(voice[i], -10000, 10000, width, 0), i+1, map(voice[i+1], -30000, 30000, height, 0));
        }
      }
    }
    textFont(gothic, 18);
    textAlign(RIGHT);
    fill(255);
    text("tap here to exit", width, height);
  }
}
void onAudioEvent(short[]_voice) {
  voice= _voice;
  // println(voice.length);
}

