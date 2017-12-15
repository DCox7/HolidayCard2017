boolean envAtBottom=false;
Envelope e = new Envelope(200, 350, 150, 300);
Letter a;

float c1=random(0, 255);
float c2=random(0, 255);
float c3=random(0, 255);
boolean closedEnvelope=true;
float rando = random(1,4);
void setup() {

  a= new Letter("Happy Christmas and Merry Hanukkah", e, 210,360, 140,280 );
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
