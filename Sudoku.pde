int cols = 9;
int rows = 9;
int w, h;
Cell board[][];
Generator generator;

void setup()
{
   size(800, 800);
   background(255);
   w = width / rows;
   h = height / cols;
   generator = new Generator(rows, cols);
   board = generator.getBoard();
   
   
}

void draw()
{
   
  
  show();
}

void show()
{
  for(int i=0; i<rows; i++)
  {
     for(int j=0; j<cols; j++)
     {
        board[i][j].show();
     }
  } 
}
