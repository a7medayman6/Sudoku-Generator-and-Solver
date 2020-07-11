PFont mono;

int w, h;
int N = 9;
Cell board[][];
Generator generator;
Solver solver;

void setup()
{
   size(800, 805);
   background(255);
   w = width / N - 5;
   h = height / N;
   generator = new Generator(N, 40);
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
  }
   fill(0);
   textSize(20);
   text("Press SPACE to see the solution.                                          Press ENTER to exit.", 10, 770);
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
