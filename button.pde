class button
{
  float cx=0,cy=0,rect_width=100,rect_height=80,r=200,g=100,b=50;
  boolean state=false;
  
  button(float x1, float y1)
  {
    cx=x1;
    cy=y1;
   
  } 
  void display()
  {
    fill(r,g,b);
    rectMode(CENTER);
    rect(cx,cy,rect_width,rect_height,20);
  }  
    
  void update()
  {
    if(state==false){
         r=150;
         g=200;
         b=50;
    }
    if(state==true)
    {
         r=200;
         g=100;
         b=50;    }
    state = !state;
   
  }  
  
  boolean mouse_press()
  {
    if (mouseX>=cx-rect_width/2 && mouseX<=cx+rect_width/2 && mouseY>=cy-rect_height/2 && mouseY<=cy+rect_height/2) 
    {
      update();
      return true;
    }
    else
      return false;
  }
}  
