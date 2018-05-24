int gamestate;
PImage[] logo;


void setup()
{
  //animation
  logo = new PImage[5];

  //lighter one
  for (int i = 0; i < logo.length; i++) {
    String filename = "startScreen" + i + ".gif";
    logo[i] = loadImage(filename);
  } 
}
void draw()
{
 createLogo(); 
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
      image(logo[1], 0, 0, width, height);
    }
    if (frameCount>=126)
    {

      image(logo[2], 0, 0, width, height);
      //words
      image(logo[0], width * .25, height * .001, widthL, .7 *widthL );
      //logos
      image(logo[4], width*.359375, height*.45, height*.45, height*.45);
    }
    if (frameCount>=170)
    {

      gamestate = 0;
    }
  }
}