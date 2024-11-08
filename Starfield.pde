Stripe [] redStripe = new Stripe[100];
Stripe [] whiteStripe = new Stripe[100];
Stripe [] blueStripe = new Stripe[100];
oddBallStripe [] oddBallStripe = new oddBallStripe[3];

//i want order to be red, white, then blue

int originX = 250;
int originY = 250;
void setup()  
{
  
  noStroke();
  size(500,500);
  for(int i = 0; i < redStripe.length; i++){
    redStripe[i] = new Stripe(1.0, 255);
    whiteStripe[i] = new Stripe(2 , 255, 0);
    blueStripe[i] = new Stripe(255, (double)4); // note to future self: this is mixed up, fix it. 
  }
  for (int i = 0; i < oddBallStripe.length; i++){
    oddBallStripe[i] = new oddBallStripe();
  }
}

void draw()
{
  background(0,0,0);
  for (int i = 0 ; i < redStripe.length; i++){
    redStripe[i].show();
    redStripe[i].move();
    whiteStripe[i].show();
    whiteStripe[i].move();
    blueStripe[i].show();
    blueStripe[i].move();

  }
  for(int i = 0; i < oddBallStripe.length; i++){    
    oddBallStripe[i].move();
    oddBallStripe[i].show();
  }
}

void mousePressed(){
  redoStripes();
}
class Stripe
//need to add overloader
{
  color myColor;
  double myX, myY, myAngle, mySpeed, my2Speed;
  Stripe(){
  }
  Stripe(float spd, int redColor){ // 1st and slowest ring red
    myColor = color(redColor,0,0);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spd;
  }
  
  Stripe(double spd, int whiteColor, int justToDiffereniate){ //2nd and medium speed ring white
    myColor = color(whiteColor,whiteColor,whiteColor); 
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spd;
  }
  Stripe(int blueColor, double spd){ // 3rd and fastest ring blue
    myColor = color(0,0, blueColor);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spd;
  }
  
  void show(){
    fill(myColor);
    ellipse((float)myX,(float)myY, 5, 5);
  }
  void move(){
   myX += (double)(Math.cos(myAngle)*mySpeed);
   myY += (double)(Math.sin(myAngle)*mySpeed);
  }
}

void redoStripes(){
  for(int i = 0; i < redStripe.length; i++){
    redStripe[i] = new Stripe(1.5, 255);
    whiteStripe[i] = new Stripe(3 , 255, 0);
    blueStripe[i] = new Stripe(255, (double)0.75); // note to future self: this is mixed up, fix it. 
  }
}


class oddBallStripe extends Stripe //inherits from Stripe
{
  oddBallStripe(){
    myColor = color(255,255,0);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = 0.15;
  }
}
