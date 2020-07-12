class Cell
{
  //value of the square
   int value;
  //coordinates
   int i;
   int j;
   //dimisions
   int w;
   int h;
   //grid
   int rows;
   int cols; 
   //color
   color col = 0;
   //visited or not
   boolean empty = true;
  
   
   public Cell(int i, int j, int w, int h, int rows, int cols)
   {
     //col = color(255);
     this.i = i;
     this.j = j;
     this.w = w;
     this.h = h;
     this.rows = rows;
     this.cols = cols;
     this.value = 0;
   }
   
   public void show()
   {
      noFill();
      
      if(this.j%3 == 0 && this.j != 0)
      {
        strokeWeight(3);
        stroke(255,0,0);
        line(this.j * h, this.i * w, this.j * h, this.i * w + h - 8 );
      }
      if(this.i%3 == 0 && this.i != 0)
      {
        stroke(255,0,0);
        strokeWeight(3);
        line(this.j * h, this.i * w, this.j * h + w + 3, this.i * w  );
      }
      strokeWeight(1);
      stroke(0);
      rect(this.j * h, this.i * w, h - 1, w - 1); 
      textSize(30);
      
      String val = str(value);
      if(value == 0)
          val = "";
      fill(col);
      text(val, this.j * h + 35, this.i * w + 50);
   }
   
   public void setValue(int value)
   {
     this.value = value;
   }
   public int getValue()
   {
     return this.value;
   }  
   public void setCol(color col)
   {
      this.col = col; 
   }
  
}
