import javafx.util.Pair;

class Solver
{
 
  Cell board[][];
  int N;
  int sqr;
  
  public Solver(Cell [][]board, int N)
  {
     this.board = board; 
     this.N = N; 
     this.sqr = (int) Math.sqrt(N);
     Solve();
  }
  
  public boolean Solve()
  {
     Pair<Integer, Integer> empty = empty_cell();
     print_board();
     if(empty == null)
         return true;
     int r = empty.getKey();
     int c = empty.getValue();
     for(int num = 1; num<=N; num++)
     {
       boolean safe = is_safe(r, c, num);
         if(safe)
            board[r][c].setValue(num);
         if(Solve())
           return true;
          
          board[r][c].setValue(0);
       
     }
    
     return false;    
  }
  
  
  Pair<Integer, Integer> empty_cell()
  {
     for(int i=0; i<N; i++)
     {
        for(int j=0; j<N; j++)
        {
           if(board[i][j].getValue() == 0)
           {
              println(i, j);
             return new Pair<Integer, Integer>(i, j);
           }
        } 
     }
      return null;
  }
  
  boolean is_safe(int r, int c, int n)
  {
    return check_row(r, n) && check_col(c, n) && check_square((int)r-r%sqr, (int)c-c%sqr, n);
  }
  boolean check_row(int r, int n)
  {
    for(int i=0; i<N; i++)
    {
       if(board[r][i].getValue() == n)
         return false;
    }
    return true;
  }
  boolean check_col(int c, int n)
  {
    for(int i=0; i<N; i++)
    {
       if(board[i][c].getValue() == n)
         return false;
    }
    return true;
  }
  boolean check_square(int r, int c, int n)
  {
    for (int i = 0; i<sqr; i++)
    {
      for (int j = 0; j<sqr; j++)
      { 
          if(board[r + i][c + j].getValue() == n)
              return false;
      }
    }
    return true;
  }
  
  public Cell[][] getBoard()
  {
     return board; 
  }
  
  void print_board()
  {
    for (int i = 0; i<N; i++)
    {
      for (int j = 0; j<N; j++)
      { 
          print(board[i][j].getValue() + "\t");
      }
      println();
    }
    print("_________________________\n\n");
    
  }
  
  
  
}
