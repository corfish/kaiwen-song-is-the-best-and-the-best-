import processing.sound.*;

import android.app.Activity;
import android.content.res.AssetFileDescriptor;
import android.content.Context;
import android.media.MediaPlayer;
import android.media.SoundPool;
import android.media.AudioManager;
 
/////////////////////////////////////////////////////////
 
SoundPool soundPool;
HashMap<Object, Object> soundPoolMap;
Activity act;
Context cont;
AssetFileDescriptor afd1;
int s1;
int streamId;

int gamestate;
PImage[] logo;

SoundFile file;

void playSound(int soundID)
{
  // play(int soundID, float leftVolume, float rightVolume, int priority, int loop, float rate)
 
  soundPool.stop(streamId); // kill previous sound - quick hack to void mousePressed triggering twice
  streamId = soundPool.play(soundID, 1.0, 1.0, 1, 0, 1f);
}


void setup()
{
  size(500,1000);
  //animation
  logo = new PImage[5];


  act = this.getActivity();
  cont = act.getApplicationContext();
 
  // load up the files
  try {
    afd1 = cont.getAssets().openFd("logo thunder.mp3");
   
  } 
  catch(IOException e) {
    println("error loading files:" + e);
  }
  // create the soundPool HashMap - apparently this constructor is now depracated?
  soundPool = new SoundPool(12, AudioManager.STREAM_MUSIC, 0);
  soundPoolMap = new HashMap<Object, Object>(2);
  soundPoolMap.put(s1, soundPool.load(afd1, 1));
 
  //lighter one
  for (int i = 0; i < logo.length; i++) {
    String filename = "startScreen" + i + ".gif";
    logo[i] = loadImage(filename);
  } 
  gamestate = 1000;
}
void draw()
{
 createLogo(); 
 if(gamestate==0)
 {
  background(0);
  text("Hello" , width/2,height/2);
 }
}
void createLogo()
{
  if (height>width)
  {
    background(0);
    float widthL = width * .7142857;
    image(logo[0], width * .14285714, height * .001, widthL, .7 *widthL );

    if (frameCount>=122)
    {
        streamId =  soundPool.play(1,1.0,1.0 ,1, 0,1f);
      image(logo[1], 0, 0, width, height);
    }
    if (frameCount>=126)
    {
 
      image(logo[2], 0, 0, width, height);
      image(logo[0], width * .14285714, height * .001, widthL, .7 *widthL );
      image(logo[4], width*.1428571429, height*.4, width*.7142857143, width*.7142857143);
      soundPool.stop(streamId);
    }
    if (frameCount>=170)
    {
         
      gamestate = 0;
    }
  } else
  {
    background(0);
    float widthL = width * .5;
    image(logo[0], width * .25, height * .001, widthL, .7 *widthL );

    if (frameCount>=122)
    {
       file.play();
      image(logo[1], 0, 0, width, height);
    }
    if (frameCount>=126)
    {

      image(logo[2], 0, 0, width, height);
      //words
      image(logo[0], width * .25, height * .001, widthL, .7 *widthL );
      //logos
      image(logo[4], (width*.25) + (widthL/2) - (height*.225), height*.45, height*.45, height*.45);
            file.stop();
    }
    if (frameCount>=170)
    {

      gamestate = 0;
    }
  }
}