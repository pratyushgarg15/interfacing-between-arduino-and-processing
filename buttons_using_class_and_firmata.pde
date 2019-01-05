int number_of_buttons=8;
button []b=new button[number_of_buttons];
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int i;
void setup()
{
  size(1000,600);
  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for (i = 0; i < number_of_buttons; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
  float x=0,y=height/4;
  
  for(i=0;i<number_of_buttons;i++)
  {
    x=(x+width/5)%width;
    if(x==0)
    {
      y=y+height/2;
      x=width/5;
    }
    b[i]=new button(x,y);  
  } 
      
}

void draw()
{
  background(50,50,100);
  for(i=0;i<number_of_buttons;i++)
    b[i].display();
}    

void mousePressed()
{
  
  for(i=0;i<number_of_buttons;i++)
  {
    b[i].mouse_press();
    if(b[i].state==true)
      arduino.digitalWrite(i, Arduino.HIGH);
    else if(b[i].state==false)
       arduino.digitalWrite(i, Arduino.LOW);
      
  }    
     
}
