
float timery;
 
 PImage bo; 
boolean envAtBottom=false;
Envelope e = new Envelope(200, 350, 150, 300);
Letter z;
float x;
float y;
  float mcxtext;
  float mcytext;
  float xftext;
  float yftext;
Snow[] a = new Snow[300];
String text="My New Year's Resolution";;
float c1=random(0, 255);
float c2=random(0, 255);
float c3=random(0, 255);
boolean closedEnvelope=true;
float rando = random(1,4);
void setup() {
  timery=  0;
bo= loadImage("borderr.png");
  for(int i = 0; i < a.length; i++)
  {
    a[i] = new Snow();
  }

  z= new Letter( e, 210,360, 140,280 );
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



void draw() {
  ellipse(-50, timery, 10, 10);
  timery++;
   if (closedEnvelope&&timery==31){
  closedEnvelope=false;

  }
 
  background(c1, 255-c2, 255-c3);
  strokeWeight(.25);
 for(int i = 0; i < a.length; i++)
  {
    a[i].drawSnow();
    if(a[i].getDirection() == 0)
    {
      a[i].setX(a[i].getX() - .5);
      a[i].setY(a[i].getY() + a[i].getSize()/2);
    }
    
    if(a[i].getDirection() == 1)
    {
      a[i].setX(a[i].getX() + .5);
      a[i].setY(a[i].getY() + a[i].getSize()/2);
    }
    
    if(a[i].getY() > 1000)
    {
      a[i].setY(0);
      a[i].setX(random(1, 1000));
    }
  }
  strokeWeight(1);
   if (e.getX()<0)
    envAtBottom=true;
  if (!closedEnvelope) {
     z.openEnvelope();
     z.moveEnvelope(e);
    z.moveLetter();
   
  }
  e.display(z);
  
 
  
}

void rEsEt(){

  
  
  
  
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

     if (!closedEnvelope){
     boop.drawLetter();
   
     
     }
     fill(255);
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
   
      stroke(0);
    }
  }
}
public class Letter
{
  

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

float length;
float width;
  public Letter(Envelope e, float x1, float y1, float l, float w)
  { length =l;
    width=w;
    x=x1;
  y=y1;
   
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
Message m = new Message();
m.message1();

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
class Message{
  
  Message(){
    
  }
  
  
  void message1(){
        xftext=x+70;
    yftext=y+200;
    mcxtext=x+70;
    mcytext=y+100;
    fill(245, 216, 165);
    stroke(0);
    rect(x, y, z.width, z.length);
    
    fill(0);
    if (envAtBottom){
      textSize(40);
      fill(255, 0, 0 );
      text(text, mcxtext+30, mcytext);
      tint(255, 0, 0);
       bo.resize((int)z.width, (int)z.length);
      image(bo, x, y);
    
      fill (35, 137, 61);
      textSize(50);
      text(" -Mitchelll", xftext+155, yftext+55);
      fill(24, 54, 163);
      textSize(18);
      text("By Danny Cox, Lucas Hanley, Kam Werk", xftext+98, yftext+540);
  }}
  
  
    void message2(){
        xftext=x+70;
    yftext=y+200;
    mcxtext=x+70;
    mcytext=y+100;
    fill(245, 216, 165);
    stroke(0);
    rect(x, y, z.width, z.length);
    fill(0);
    if (envAtBottom){
      textSize(20);
      fill(255, 0, 0 );
    
      text(text, mcxtext, mcytext);
      PImage j = loadImage("jar.png");
       j.resize(400, 200);
      image(j,  xftext+115, yftext+325);
      PImage b = loadImage("Left.png");
       image(b, xftext, yftext);
       PImage m = loadImage("Right.png");
       image(m, xftext+360,yftext);
      fill (115, 240, 115);
      textSize(50);
      text("Phantom \nMenace\nWas\nBetter", xftext+155, yftext+55);
      fill(255,0,0);
      textSize(18);
      text("Jar-Jar Binks Sith Lord Confirmed", xftext+98, yftext+570);
  }}
  
  
  
  }  
class Snow
{
 
  float xPos;
  float yPos;
  int size;
  int direction;

  public Snow()
  {

      xPos = random(0, 1000);
      yPos = random(0, 1000);
      size = round(random(1, 10));
      direction = round(random(0, 1));
    
  }
  
  void setX(float x1){
    xPos = x1;
  }
  void setY(float y1){
    yPos = y1;
  }
  
  float getX(){
    return xPos;
  }
  float getY(){
    return yPos;
  }
  float getSize(){
    return size;
  }
  float getDirection(){
    return direction;
  }



  public void drawSnow()
  {
    fill(255);
    noStroke();
    ellipse(xPos, yPos, size, size);
    stroke(0);
  }
}
