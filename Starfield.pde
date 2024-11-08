Stripe [] redStripe = new Stripe[100];  //declare array of red stripes
Stripe [] whiteStripe = new Stripe[100]; //declare array of white stripes
Stripe [] blueStripe = new Stripe[100]; //declare array of blue stripes
stars [] starsArray = new stars[10]; //declare array of stars (our oddball)



int originX = 250; // middle of page x
int originY = 250; // middle of page y
void setup()
{

  noStroke();
  size(500, 500);
  for (int i = 0; i < redStripe.length; i++) {
    redStripe[i] = new Stripe(1.0, 255); //initalize array of red stripes 
    whiteStripe[i] = new Stripe(2, 255, 0); //initalize array of white stripes, the 0 at the end is just for the sake of differentiating the constructors. it does nothing, ignore it.
    blueStripe[i] = new Stripe(255, (double)4, 0, 0); //initalize array of blue stripes, casting speed as a double for the sake of differentiating, // has two useless args at the end for the sake of differentiating
  }
  for (int i = 0; i < starsArray.length; i++) {
    starsArray[i] = new stars(); //intalize array of stars with no args
  }
}


//red, white, blue
void draw()
{
  background(0, 0, 0);
  for (int i = 0; i < redStripe.length; i++) { //moves and shows rings/stripes 
    redStripe[i].show();
    redStripe[i].move();
    whiteStripe[i].show();
    whiteStripe[i].move();
    blueStripe[i].show();
    blueStripe[i].move();
  }
  for (int i = 0; i < starsArray.length; i++) { //moves and shows stars
    starsArray[i].move();
    starsArray[i].show();
  }
}

void mousePressed() { //when mouse pressed, call function to redo stripes
  redoStripes();
}
class Stripe
  //need to add overloader
{
  color myColor; //member var
  double myX, myY, myAngle, mySpeed, my2Speed; // member vars
  Stripe() { //only here since stars subclass needs a no arg constructor
  }
  Stripe(float spdSlow, int redColor) { // 1st and slowest ring red
    myColor = color(redColor, 0, 0);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spdSlow;
  }

  Stripe(double spdMedium, int whiteColor, int justToDiffereniate) { //2nd and medium speed ring white 
    myColor = color(whiteColor, whiteColor, whiteColor);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spdMedium;
  }
  Stripe(int blueColor, double spdFast, int secondDiff, int thirdDiff) { // 3rd and fastest ring blue // has two useless args at the end for the sake of differentiating
    myColor = color(0, 0, blueColor);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = spdFast;
  }

  void show() { //the visible ellipses
    fill(myColor);
    ellipse((float)myX, (float)myY, 5, 5);
  }
  void move() { //movement
    myX += (double)(Math.cos(myAngle)*mySpeed);
    myY += (double)(Math.sin(myAngle)*mySpeed);
  }
}

void redoStripes() { //reinitalize stripes for the redo stripes, does not do anything to the stars on purpose
  for (int i = 0; i < redStripe.length; i++) {
    redStripe[i] = new Stripe(1.0, 255); //initalize array of red stripes 
    whiteStripe[i] = new Stripe(2, 255, 0); //initalize array of white stripes, the 0 at the end is just for the sake of differentiating the constructors. it does nothing, ignore it.
    blueStripe[i] = new Stripe(255, (double)4, 0, 0); //initalize array of blue stripes, casting speed as a double for the sake of differentiating
  }
}


class stars extends Stripe //subclass that inherits from Stripe
{
  stars() {
    myColor = color(255, 255, 0);
    myX = originX;
    myY = originY;
    myAngle = (Math.random()*90);
    mySpeed = 0.2;
  }
}
