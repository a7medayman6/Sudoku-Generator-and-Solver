int w, h;
int N = 9;
Cell board[][];

//Polymorphisim 
Game generator, solver;

int number_of_empty_cells = 30;
void setup()
{
   size(800, 810);
   background(255);
  
   w = width / N - 10;
   h = height / N;
   generator = new Generator(N, number_of_empty_cells, w, h);
   board = generator.getBoard();  
}

void draw()
{
  if(keyPressed)
  {
     if(key == ' ')
     {
       solver = new Solver(board, N);
       board = solver.getBoard();
     }
     if(key == '\n')
       exit(); 
     if(key == 'a')
       setup(); 
  }
   fill(0);
   textSize(20);
   text(":SPACE = display solution.\n:a = again.\n:ENTER = exit.", 10, 730);
   show();
}

void show_cell(Cell c)
{
    noFill();
    
    if(c.j%3 == 0 && c.j != 0)
    {
      strokeWeight(3);
      stroke(255,0,0);
      line(c.j * h, c.i * w, c.j * h, c.i * w + h - 8 );
    }
    if(c.i%3 == 0 && c.i != 0)
    {
      stroke(255,0,0);
      strokeWeight(3);
      line(c.j * h, c.i * w, c.j * h + w + 3, c.i * w  );
    }
    strokeWeight(1);
    stroke(0);
    rect(c.j * h, c.i * w, h - 1, w - 1); 
    textSize(30);
    
    String val = str(c.value);
    if(c.value == 0)
        val = "";
    if(c.blue)
      c.col = color(0, 102, 153);
    fill(c.col);
    text(val, c.j * h + 35, c.i * w + 50);
}
   
void show()
{
  for(int i=0; i<N; i++)
  {
     for(int j=0; j<N; j++)
     {
        show_cell(board[i][j]);
     }
  } 
}
