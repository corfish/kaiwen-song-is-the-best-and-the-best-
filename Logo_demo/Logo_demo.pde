import processing.sound.*;
int gamestate;
PImage[] logo;

SoundFile file;


void setup()
{
  size(500,700);
  //animation
  logo = new PImage[5];
  file = new SoundFile(this, "logo thunder.mp3");
 
  //lighter one
  for (int i = 0; i < logo.length; i++) {
    String filename = "startScreen" + i + ".gif";
    logo[i] = loadImage(filename);
  } 
  gamestate = 1000;
}
void draw()
{
 // if(gamestate == 1000)
 // {
     createLogo(); 
//  }

 //if(gamestate==0)
 //{
 // background(0);
 // text("Hello" , width/2, height/2);
 //}
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
      image(logo[1], 0, 0, width, height);
    }
    if (frameCount>=126)
    {

      image(logo[2], 0, 0, width, height);
      image(logo[0], width * .14285714, height * .001, widthL, .7 *widthL );
      image(logo[4], width*.1428571429, height*.4, width*.7142857143, width*.7142857143);
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
      image(logo[4], width*.359375, height*.45, height*.45, height*.45);
       file.stop();
    }
    if (frameCount>=170)
    {
     
      gamestate = 0;
    }
  }
}