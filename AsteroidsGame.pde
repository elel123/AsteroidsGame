//your variable declarations here
SpaceShip pieceOfShip;
int spaceShipSpeed;
public void setup() 
{
  //your code here
  size(800, 800);
  pieceOfShip = new SpaceShip();
  spaceShipSpeed = 0;

}
public void draw() 
{
  //your code here
  background(0);
  pieceOfShip.move();
  pieceOfShip.show();
  pieceOfShip.accelerate(spaceShipSpeed);
}
public void keyPressed()
{
  if(key == 'a')
  {
    pieceOfShip.rotate(-15);
  }

  if(key == 'd')
  {
    pieceOfShip.rotate(15);
  }

  if(key == 'h')
  {

  }
}

public void keyReleased()
{
    if(key == 'w')
      spaceShipSpeed = 1;

    if(key == 's')
      spaceShipSpeed = -1;

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
      xCorners[0] = -7;
      yCorners[0] = 7;
      xCorners[1] = -3;
      yCorners[1] = 7;
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
      yCorners[7] = -7;  
      xCorners[8] = -7;
      yCorners[8] = -7;  
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

