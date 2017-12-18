boolean envAtBottom=false;
Envelope e = new Envelope(200, 350, 150, 300);
Letter a;

float c1=random(0, 255);
float c2=random(0, 255);
float c3=random(0, 255);
boolean closedEnvelope=true;
float rando = random(1,4);
void setup() {

  a= new Letter("Happy Christmas and Merry Hanukkah and Merry Holidays", e, 210,360, 140,280 );
  size(700, 700);
  if (rando==4)
  background(255-c1, 255-c2, 255-c3);
    if (rando==3)
  background(255-c1, 255-c2, c3);
    if (rando==2)
  background(255-c1, c2, 255-c3);
    if (rando==1)
  background(c1, 255-c2, 255-c3);
}

Snow s = new Snow(1, 10);

void draw() {
 
 
  background(c1, 255-c2, 255-c3);
  strokeWeight(.25);
  s.drawSnow();
  strokeWeight(1);
   if (e.getX()<0)
    envAtBottom=true;
  if (!closedEnvelope) {
     a.openEnvelope();
     a.moveEnvelope(e);
    a.moveLetter();
   
  }
  e.display(a);
 
  
}

void mouseClicked() {
  if (closedEnvelope){
    
  closedEnvelope=false;
  s.setMin(10);
  s.setMax(20);
  }
}
class Envelope {

  private float x;
  private float y;
  private float length;
  private float width;

  Envelope(float xv, float yv, float w, float l) {
    x=xv;
    y=yv;
    length=l;
    width=w;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(float xv) {
    x=xv;
  }

  void setY(float yv) {
    y=yv;
  }

  float getLength() {
    return length;
  } 

  float getWidth() {
    return width;
  }

  void setLength(float l) {
    length=l;
  }

  void setWidth(float w) {
    width=w;
  }

  void display(Letter boop) {
    strokeWeight(.1);
    fill(255);
   rect(x, y, length, width);

     if (!closedEnvelope)
     boop.drawLetter();
    triangle(x, y, x + length/2, y + width/2, x, y + width);
    triangle(x, y+width, x+length/2, y+width/2, x+length, y+width);
    triangle(x+length, y, x + length/2, y + width/2, x + length, y + width);
      if (!!!!!!!!closedEnvelope)
     triangle(x, y, x+length/2, y+width/2 + 20, x+length, y);
   
   
   

    textSize(45);
    fill(c1, c2, c3);
    if (closedEnvelope)
    {
      stroke (80, 255, 80);
      strokeWeight(.5);
      fill(255, 70, 70);
      ellipse(x + length/2, y + width/2 + 16, 30, 30);
      fill(c1, c2, c3);
      text("Click to Open", x, y-100);
      stroke(0);
    }
  }
}
public class Letter
{
  String text;
  float mcxtext;
  float mcytext;
  float xftext;
  float yftext;
  float trixPos;
  float triyPos; 
  float trixPos2;
  float triyPos2;
  float trixPos3;
  float triyPos3;
  float letterX;
  float letterY;
  float letterX2;
  float letterY2;
  float letterX3;
  float letterY3;
float x;
float y;
float length;
float width;
  public Letter(String t, Envelope e, float x1, float y1, float l, float w)
  { length =l;
    width=w;
    x=x1;
  y=y1;
    text = t;
    trixPos = e.getX();
    triyPos = e.getY();
    trixPos2 = e.getX() + e.getLength();
    triyPos2 = e.getY();
    trixPos3 = e.getX() + e.getLength()/2;
    triyPos3 = e.getY() - 75;

    letterX = e.getX() + 10;
    letterY = e.getY() + 5;
    letterX2 = e.getX() + 290;
    letterY2 = e.getY() + 5;
    letterX3 = (letterX + letterX2)/2;
    letterY3 = e.getY() + e.getWidth()/2;
  }

  public void openEnvelope()
  {
    strokeWeight(.2);
    fill(255);
    triangle(trixPos, triyPos, trixPos2, triyPos2, trixPos3, triyPos3);
  }

  public void moveEnvelope(Envelope e)
  {
    if (!envAtBottom) {
      e.setX(e.getX() - 1);
      e.setLength(e.getLength() + 2);

      e.setY(e.getY() + 1);
      e.setWidth(e.getWidth() + 1);

      trixPos -= 1;
      triyPos += 1;
      trixPos2 += 1;
      triyPos2 += 1;
      triyPos3 += .5;

      letterX -= 1;
      letterY += 1;
      letterX2 += 1;
      letterY2 += 1;
      letterY3 += 1.5;

      openEnvelope();
      e.display(this);
    }
  }
  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  void setX(float xv) {
    x=xv;
  }

  void setY(float yv) {
    y=yv;
  }
    float getLength() {
    return length;
  } 

  float getWidth() {
    return width;
  }

  void setLength(float l) {
    length=l;
  }

  void setWidth(float w) {
    width=w;
  }
  public void drawLetter() {
    xftext=x+70;
    yftext=y+200;
    mcxtext=x+70;
    mcytext=y+100;
    fill(245, 216, 165);
    stroke(0);
    rect(x, y, width, length);
    fill(0);
    if (envAtBottom){
      textSize(29);
      fill(255, 0, 0 );
      text(text, mcxtext, mcytext);
      PImage b = loadImage("Left.png");
       image(b, xftext, yftext);
       PImage m = loadImage("Right.png");
       image(m, xftext+360, yftext);
      fill (115, 255, 115);
      textSize(50);
      text("Rey Dies\nand BB8\nExplodes", xftext+155, yftext+55);
      fill(0);
      text("You're Welcome", xftext+98, yftext+570);
      
  }
    fill(255);
  }
  public void moveLetter() {
    if (!envAtBottom) {
      x=x - 1;
      length=length+ 1;
     
     y=y + 1;
     width=width + 2;
  }
  else {
    yftext-=1;
    y-=1;
    if (length<800)
   length+=1;
    
    
    
    
    
  }
}
}
class Snow
{
  int quantity = 300;
  float[] xPos = new float[quantity];
  float[] yPos = new float[quantity];
  int[] size = new int[quantity];
  int[] direction =  new int[quantity];
int min;
int max;
  public Snow(int m, int m1)
  {min=m;
  max=m1;

    for (int i = 0; i < quantity; i++)
    {
      xPos[i] = random(0, 700);
      yPos[i] = random(0, 700);
      size[i] = round(random(min, max));
      direction[i] = round(random(0, 1));
    }
  }

void setMin(int m){
 min=m; 
}
void setMax(int m){
 max=m; 
}
  public void drawSnow()
  {
   

    for (int i = 0; i < quantity; i++)
    {
      fill(255);
   
      ellipse(xPos[i], yPos[i], size[i], size[i]);

      if (direction[i] == 0)
      {//xPos[i] -= 30;
      //yPos[i] += 40;
        xPos[i] -= .5;
        yPos[i] += (float)(size[i]/2);
      }

      if (direction[i] == 1)
      {//xPos[i] += 40;
      //yPos[i] +=30;
       xPos[i] += .5;
        yPos[i] += (float)(size[i]/2);
      }

      if (yPos[i] > 700)
      {
        xPos[i] = random(0, 700);
        yPos[i] = 0;
      }
    }
  }
}
