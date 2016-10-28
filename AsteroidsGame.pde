//your variable declarations here
SpaceShip pieceOfShip;
double spaceShipSpeed;
Star [] twinkle;
Asteroid spaceRock;
public void setup() 
{
  //your code here
  size(800, 800);
  pieceOfShip = new SpaceShip();
  spaceShipSpeed = 0;
  twinkle = new Star[500];
  for(int i = 1; i < twinkle.length; i++)
  {
      twinkle[i] = new Star();
  }

  spaceRock = new Asteroid();
}
public void draw() 
{
  //your code here
  background(0);
  pieceOfShip.move();
  pieceOfShip.show();
  for(int i = 1; i < twinkle.length; i++)
  {
    if(i % 20 == 0)
    {
      twinkle[i] = new Star();
    }
    twinkle[i].show();
  }
  //spaceRock.show();
}

public void keyPressed()
{
  if(key == 'a')
  {
    pieceOfShip.rotate(-10);
  }

  if(key == 'd')
  {
    pieceOfShip.rotate(10);
  }

  if(key == ' ')
  {
    pieceOfShip.accelerate(0);
    pieceOfShip.setX((int)(Math.random() * 800));
    pieceOfShip.setY((int)(Math.random() * 800));
    pieceOfShip.setPointDirection((int)(Math.random() * 360));
    pieceOfShip.setDirectionX(0);
    pieceOfShip.setDirectionY(0);

  }

    if(key == 'w')
      spaceShipSpeed = 0.5;

    else if(key == 's')
      spaceShipSpeed = -0.5;
    
    else 
      spaceShipSpeed = 0;
   


    pieceOfShip.accelerate(spaceShipSpeed);
}

public void keyReleased()
{

    //fill(255, 0, 0);
    //triangle(pieceOfShip.getX() - 10, pieceOfShip.getY() - 10, pieceOfShip.getX() - 20, pieceOfShip.getY(), pieceOfShip.getX() - 10, pieceOfShip.getY() + 10);
}




class Star 
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random() * 800);
    myY = (int)(Math.random() * 800);
  }

  public void show()
  {
    fill((int)(Math.random() * 16) + 239, 255, (int)(Math.random() * 255));
    ellipse(myX, myY, 1, 1);
  }
}

class Asteroid extends Floater
{
  private int speedOfRotation;

  public Asteroid()
  {
    speedOfRotation = (int)(Math.random() * 3) - 1; 
    myColor = color(0, 0, 255);
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;  
    corners = 7;
    xCorners = new int [corners];
    yCorners = new int [corners]; 
    xCorners[1] = -35;
    yCorners[1] = -34;
    xCorners[2] = -28;
    yCorners[2] = 30;
    xCorners[3] = 20;
    yCorners[3] = 35;
    xCorners[4] = 46;
    yCorners[4] = 34;
    xCorners[5] = 34;
    yCorners[5] = -34;
    xCorners[6] = 0;
    yCorners[6] = -20;
  }

  public void move()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  } 

  public void rotate()   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection += speedOfRotation;   
  }  

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}  
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}
}


class SpaceShip extends Floater  
{   
    //your code here
    public SpaceShip()
    {
      myColor = color(255);
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0; //in Degrees--not Radians
      corners = 13;
      xCorners = new int [corners];
      yCorners = new int [corners];
      xCorners[0] = -8;
      yCorners[0] = 8;
      xCorners[1] = -3;
      yCorners[1] = 8;
      xCorners[2] = 6;
      yCorners[2] = 2;  
      xCorners[3] = 8;
      yCorners[3] = 2;  
      xCorners[4] = 11;
      yCorners[4] = 0;  
      xCorners[5] = 8;
      yCorners[5] = -2;  
      xCorners[6] = 6;
      yCorners[6] = -2;  
      xCorners[7] = -3;
      yCorners[7] = -8;  
      xCorners[8] = -8;
      yCorners[8] = -8;  
      xCorners[9] = -5;
      yCorners[9] = -3;  
      xCorners[10] = -7;
      yCorners[10] = -1;  
      xCorners[11] = -7;
      yCorners[11] = 1;  
      xCorners[12] = -5;
      yCorners[12] = 3;  
    }
    public void setX(int x) {myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y) {myCenterY = y;}
    public int getY() {return (int)myCenterY;}
    public void setDirectionX(double x) {myDirectionX = x;}  
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}
    public void setPointDirection(int degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}
    
    public void accelerate (double dAmount)   
    {          
      //convert the current direction the floater is pointing to radians    
      double dRadians =myPointDirection*(Math.PI/180);     
      //change coordinates of direction of travel    
      myDirectionX += ((dAmount) * Math.cos(dRadians));    
      myDirectionY += ((dAmount) * Math.sin(dRadians));    

      if(dAmount > 5)
      {
        dAmount = 0;
      }   
    } 


    public void show ()  //Draws the floater at the current position  
    { 
      if(keyPressed && key == ' ')
      {
        stroke(myColor, 10); 
        fill(myColor, 10); 
      }  
      else 
      {
        stroke(myColor); 
        fill(myColor);
      }
   
      //convert degrees to radians for sin and cos         
      double dRadians = myPointDirection*(Math.PI/180);                 
      int xRotatedTranslated, yRotatedTranslated;    
      beginShape();         
      for(int nI = 0; nI < corners; nI++)    
      {     
        //rotate and translate the coordinates of the floater using current direction 
        xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
        yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
        vertex(xRotatedTranslated,yRotatedTranslated);    
      }   
      endShape(CLOSE);  
    } 



}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

