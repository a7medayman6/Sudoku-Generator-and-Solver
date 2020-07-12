int w, h;
int N = 9;
Cell board[][];
Generator generator;
Solver solver;

int number_of_empty_cells = 60;
void setup()
{
   size(800, 810);
   background(255);
   w = width / N - 10;
   h = height / N;
   generator = new Generator(N, number_of_empty_cells);
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
     {
       exit();  
     }
     if(key == 'a')
     {
        setup(); 
     }
  }
   fill(0);
   textSize(20);
   text(":SPACE = display solution.\n:a = again.\n:ENTER = exit.", 10, 730);
   show();
}

void show()
{
  for(int i=0; i<N; i++)
  {
     for(int j=0; j<N; j++)
     {
        board[i][j].show();
     }
  } 
}
