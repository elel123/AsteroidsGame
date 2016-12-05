//your variable declarations here
SpaceShip pieceOfShip;
double spaceShipSpeed;
Star [] twinkle;
ArrayList <Asteroid> spaceRock;   //uses Arraylist
ArrayList <Bullets> metalSphere;
int points = 0;
float healthPercent = 1;
boolean hyp = false;
boolean dead = false;;
public void setup() 
{
  //your code here
  size(1000, 800);
  //fullScreen();
  pieceOfShip = new SpaceShip();
  spaceShipSpeed = 0;
  twinkle = new Star[500];
  spaceRock = new ArrayList <Asteroid>();  //uses arraylist
  metalSphere = new ArrayList <Bullets>();
 
  for(int i = 1; i < twinkle.length; i++)
  {
      twinkle[i] = new Star();
  }

  for(int i = 0; i < 50; i++)  //uses arraylist
  {
    spaceRock.add(i, new Asteroid());
    if(i % 10 == 0)
      spaceRock.set(i, new Asteroid(0));
    spaceRock.get(i).placement();
    spaceRock.get(i).moveDirection();
  }
  if(points % 20 == 0 && points > 0)
  {
    healthPercent += 0.3;
    for(int i = 0; i < 5; i++)
    {
      spaceRock.add(spaceRock.size(), new Asteroid());
      spaceRock.get(i).placement();
      spaceRock.get(i).moveDirection();
    }
  }
  
}
public void draw() 
{
  //your code here
  background(0);
  for(int i = 1; i < twinkle.length; i++)
  {
    if(i % 20 == 0)
    {
      twinkle[i] = new Star();
    }
    if(keyPressed && key == ' ')
      stroke(0);
    else 
      stroke(255);
    twinkle[i].show();
  }

  for(int i = 0; i < metalSphere.size(); i++)
  {
    metalSphere.get(i).move();
    metalSphere.get(i).show();
  } 

  if(healthPercent > 0)
  {
    pieceOfShip.move();
    pieceOfShip.show();
  } 

  for(int i = 0; i < spaceRock.size(); i++)
  {
    spaceRock.get(i).move();
    spaceRock.get(i).show();
    if(spaceRock.get(i).collision())
    {
      if(spaceRock.get(i).getType() == 2)
      {
        spaceRock.add(i + 1, new Asteroid(1));
        spaceRock.add(i + 1, new Asteroid(1));
        spaceRock.get(i + 1).setX(spaceRock.get(i).getX() - 10);
        spaceRock.get(i + 1).setY(spaceRock.get(i).getY() - 10);
        spaceRock.get(i + 2).setX(spaceRock.get(i).getX() + 10);
        spaceRock.get(i + 2).setY(spaceRock.get(i).getY() + 10);
        spaceRock.get(i + 1).setDirectionX(Math.random() * 1 - 0.5);
        spaceRock.get(i + 1).setDirectionY(Math.random() * 1 - 0.5);
        spaceRock.get(i + 2).setDirectionX(Math.random() * 1 - 0.5);
        spaceRock.get(i + 2).setDirectionY(Math.random() * 1 - 0.5);
        spaceRock.remove(i);
        points -= 5;
        healthPercent -= 0.4;
      }
      else if(spaceRock.get(i).getType() == 1)
      {
        spaceRock.remove(i);
        points--;
        healthPercent -= 0.2;
      }
      else if(spaceRock.get(i).getType() == 0)
      {
        spaceRock.get(i).setX((int)(Math.random() * width));
        spaceRock.get(i).setY((int)(Math.random() * height));        
        points -= 5;
        healthPercent -= 0.2;
      }

    }
    for(int j = 0; j < metalSphere.size(); j++)
    {
      if(spaceRock.get(i).bulletCollision())
      {
        if(spaceRock.get(i).getType() == 2)
        {
          spaceRock.add(i + 1, new Asteroid(1));
          spaceRock.add(i + 1, new Asteroid(1));
          spaceRock.get(i + 1).setX(spaceRock.get(i).getX() - 10);
          spaceRock.get(i + 1).setY(spaceRock.get(i).getY() - 10);
          spaceRock.get(i + 2).setX(spaceRock.get(i).getX() + 10);
          spaceRock.get(i + 2).setY(spaceRock.get(i).getY() + 10);
          spaceRock.get(i + 2).setY(spaceRock.get(i).getY() + 10);
          spaceRock.get(i + 1).setDirectionX(Math.random() * 1 - 0.5);
          spaceRock.get(i + 1).setDirectionY(Math.random() * 1 - 0.5);
          spaceRock.get(i + 2).setDirectionX(Math.random() * 1 - 0.5);
          spaceRock.get(i + 2).setDirectionY(Math.random() * 1 - 0.5);
          spaceRock.remove(i);
          points++;
        }
        else if(spaceRock.get(i).getType() == 1)
        {
          spaceRock.remove(i);
          points++;
        }
        else if(spaceRock.get(i).getType() == 0)
        {
          spaceRock.get(i).setTimesHit(1);
          if(spaceRock.get(i).getTimesHit() == 5)
          {
            spaceRock.remove(i);
            points += 5;
            healthPercent += 0.25;
          }
        }
        metalSphere.remove(j);
        break;      
      }
    }
  }
  fill(255);
  textSize(20);
  text("score: " + points, 20, 30);
  text("health:" + Math.round(healthPercent * 100) + " %", 20, 60);
  if(dead == false && hyp == false && healthPercent <= 1)
  {
    noStroke();
    fill(255, 0, 0);
    rect(pieceOfShip.getX() - 15, pieceOfShip.getY() - 18, 30, 5);
    fill(0, 255, 0);
    rect(pieceOfShip.getX() - 15, pieceOfShip.getY() - 18, 30 * healthPercent, 5);
  }
  else if(healthPercent > 1 && hyp == false)
  {
    fill(255, 255, 0);
    stroke(255);
    rect(pieceOfShip.getX() - 14, pieceOfShip.getY() - 18, 30, 5);    
  }
  if(healthPercent < 0)
  {
    int chance = (int)(Math.random() * 3) + 1;
    dead = true;
    textSize(40);
    fill(0);
    rect(-1, -1, width + 1, height + 1);
    fill(255);
    text(" GAME OVER \n You just died! \n \nHint: Blue Stars give you\n health when you \nshoot it with a bullet.  ", 360, 200);
  }
}
public void keyPressed()
{
  if(key == 'q')
  {
    if(dead == false)
    {
      if(metalSphere.size() < 7)
        metalSphere.add(new Bullets(pieceOfShip));
    }
    if(dead == true)
    {
      metalSphere.add(new Bullets(pieceOfShip));
    }
  }


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
    pieceOfShip.setX((int)(Math.random() * width));
    pieceOfShip.setY((int)(Math.random() * height));
    pieceOfShip.setPointDirection((int)(Math.random() * 360));
    pieceOfShip.setDirectionX(0);
    pieceOfShip.setDirectionY(0);
    for(int i = 0; i < spaceRock.size(); i++)
    {
      if(dist(pieceOfShip.getX(), pieceOfShip.getY(), spaceRock.get(i).getX(), spaceRock.get(i).getY()) <= 40)
      {
        if(spaceRock.get(i).getType() == 2)
        {
          pieceOfShip.setX((int)(Math.random() * width));
          pieceOfShip.setY((int)(Math.random() * height));
          healthPercent += 0.12;    
        }  
      }
    }
    while(metalSphere.size() > 0)
      metalSphere.remove(0);

    hyp = true;
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
  hyp = false;
}


class Bullets extends Floater
{
  double dRadians;
  public Bullets(SpaceShip theShip)
  {
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myPointDirection = theShip.getPointDirection();
    dRadians = myPointDirection * (Math.PI/180);
    myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
    myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
  }

  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int) myCenterX;}   
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int) myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int degrees) {myPointDirection = degrees;}
  public double getPointDirection() {return myPointDirection;}

  public void show() 
  {
    fill(255, 0, 0);
    ellipse((int)myCenterX, (int)myCenterY, 7, 7);  
  }

}

class Star 
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
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
  private int asteroidType;
  private int timesHit;
  public Asteroid()
  {
    speedOfRotation = (int)(Math.random() * 4);
    if(speedOfRotation <= 1)
    {
      speedOfRotation = 1;
    } 
    else 
    {
      speedOfRotation = -1;  
    }

    myColor = color(102, 51, 0);
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0; 
    asteroidType = (int)(Math.random() * 2) + 1; 
    timesHit = 0;
    if(asteroidType == 2)
    {
      corners = 15;
      int[] xS = {28, 34, 22, 0, -8, -22, -30, -34, -28, -24, -12, -4, 6, 22, 36};
      int[] yS = {6, 24, 32, 34, 36, 34, 22, 4, -8, -18, -32, -28, -32, -22, -2};
      xCorners = xS;
      yCorners = yS;
    }
    
    else
    {
      corners = 7;
      int[] xS = {20, 12, 8, -12, -20, -10, 16};
      int[] yS = {4, 8, 14, 12, 0, -10, -8};
      xCorners = xS;
      yCorners = yS;
    }
  }

  public Asteroid(int n)
  {
    speedOfRotation = (int)(Math.random() * 4);
    if(speedOfRotation <= 1)
    {
      speedOfRotation = 1;
    } 
    else 
    {
      speedOfRotation = -1;  
    }

    myColor = color(102, 51, 0);
    myCenterX = 400;
    myCenterY = 400;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    timesHit = 0; 
    asteroidType = n; 

    if(asteroidType == 2)
    {
      corners = 15;
      int[] xS = {28, 34, 22, 0, -8, -22, -30, -34, -28, -24, -12, -4, 6, 22, 36};
      int[] yS = {6, 24, 32, 34, 36, 34, 22, 4, -8, -18, -32, -28, -32, -22, -2};
      xCorners = xS;
      yCorners = yS;
    }
    
    else if(asteroidType == 1)
    {
      corners = 7;
      int[] xS = {20, 12, 8, -12, -20, -10, 16};
      int[] yS = {4, 8, 14, 12, 0, -10, -8};
      xCorners = xS;
      yCorners = yS;
    }

    else if (asteroidType == 0) 
    {
      corners = 9;
      int[] xS = {0, 5, 15, 5, 0, -5, -15, -5, 0};
      int[] yS = {15, 5, 0, -5, -15, -5, 0, 5, 15};
      xCorners = xS;
      yCorners = yS;
      myColor = color(0, 0, 255);     
    }
}
  public void move()   //move the floater in the current direction of travel
  {   
    rotate(speedOfRotation);
    super.move();  
  } 

  public void moveDirection()
  {
    if(Math.random() < 0.5)
      myDirectionX = 0.5;
    else 
      myDirectionX = -0.5;

    if(Math.random() < 0.5)
      myDirectionY = 0.5;
    else 
      myDirectionY = -0.5;
  }

  public void rotate(int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection += nDegreesOfRotation;   
  }

  public void placement()
  {
    if(Math.random() < 0.25)
    {
      myCenterX = ((int)(Math.random() * 300));
      myCenterY = ((int)(Math.random() * height));
    }

    else if(Math.random() < 0.33)
    {
      myCenterX = ((int)(Math.random() * 300) + 500);
      myCenterY = ((int)(Math.random() * height));      
    }

    else if(Math.random() < 0.5)
    {
      myCenterX = ((int)(Math.random() * width));
      myCenterY = ((int)(Math.random() * 300));      
    }

    else
    {
      myCenterX = ((int)(Math.random() * width));
      myCenterY = ((int)(Math.random() * 300) + 500); 
    }


  }

  public boolean collision() 
  {
    if(asteroidType == 1)
    {
        if(dist((int)myCenterX, (int)myCenterY, pieceOfShip.getX(), pieceOfShip.getY()) <= 20)
          return true;
        else 
          return false;
    }
    else if(asteroidType == 2)
    {

        if(dist((int)myCenterX, (int)myCenterY, pieceOfShip.getX(), pieceOfShip.getY()) <= 40)
          return true;
        else 
          return false;      
    }
    else if(asteroidType == 0)
    {
      if(dist((int)myCenterX, (int)myCenterY, pieceOfShip.getX(), pieceOfShip.getY()) <= 16)
        return true;
      else 
        return false;         
    }
    else 
      return false; 
  }

  public boolean bulletCollision()
  {
    for(int i = 0; i < metalSphere.size(); i++)
    {
      if(asteroidType == 1)
      {
          if(dist((int)myCenterX, (int)myCenterY, metalSphere.get(i).getX(), metalSphere.get(i).getY()) <= 20)
            return true;
      }
      else if(asteroidType == 2)
      {

          if(dist((int)myCenterX, (int)myCenterY, metalSphere.get(i).getX(), metalSphere.get(i).getY()) <= 40)
            return true;        
      }
      else if(asteroidType == 0)
      {
        if(dist((int)myCenterX, (int)myCenterY, metalSphere.get(i).getX(), metalSphere.get(i).getY()) <= 16)
          return true;        
      }
    }
    return false;          
  }     
  

  public int getType() {return asteroidType;}
  public void setType(int n) {asteroidType = n;}
  public void setColor(int r, int g, int b) {myColor = color(r, g, b);}
  public void setTimesHit(int add) {timesHit += add;}
  public int getTimesHit() {return timesHit;}

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
    
    public void crash()
    {
      //idk
    }

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

