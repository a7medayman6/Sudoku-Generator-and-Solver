import java.util.Set;
import java.util.HashSet;

//Inheritance 
class Generator extends Game
{
  
  private int k;
  private int w;
  private int h;
  public Generator(int N, int k, int w, int h)
  {
    super(N);
    this.k = k;
    this.w = w;
    this.h = h;
    board = new Cell[N][N];
    start();
    
  }
  public void start()
  {
    //creating objeccts from the cell class to initialize the board
    init();
    //fill the whole board
    fill_board();
    //remove k numbers from the fully filled board
    cut_board(k);
  }
  void fill_board()
  {
     //initialize the board with some random values in the diagonal bands
     fill_diagonal();
     //fill the rest of the board by solving the sudoku board
     Solver solver = new Solver(board, N);
     this.board = solver.getBoard();
  }
 
  void fill_diagonal()
  {
    for (int i=0; i<N; i+=3)
    {
      fill_square(i, i);
    }
  }
  
  void fill_square(int r, int c)
  {
   
    for (int i = r; i<r+3; i++)
    {
      for (int j = c; j<c+3; j++)
      {
        int n = generate_random_number();
        boolean safe = Checker.is_safe(board, i, j, n, N);
        if (safe)
        {
          board[i][j].setValue(n);
        } 
        else
          j--; 
      }
    }
  }
  
  
  int generate_random_number()
  {
    return (int) Math.floor((Math.random()*N+1));
  }

  void init()
  {
    for (int i=0; i<N; i++)
    {
      for (int j=0; j<N; j++)
      {
        board[i][j] = new Cell(i, j, w, h, N);
      }
    }
  }

  void cut_board(int k)
  {
     Set used = new HashSet<Pair<Integer, Integer>>();
     for(int i=0; i<k; i++)
     {
        int r = generate_random_number()-1;
        int c = generate_random_number()-1;
        if(!used.contains(new Pair<Integer, Integer>(r,c)))
        {
          
          used.add(new Pair<Integer, Integer>(r,c));
          board[r][c].setValue(0);
          board[r][c].setBlue(true);
        }
        else
          i--;
     }
  }

  
}
