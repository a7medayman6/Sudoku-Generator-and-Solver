import javafx.util.Pair;

//Inheritance 
class Solver extends Game
{
 
  
  public Solver(Cell [][]board, int N)
  {
     super(N);
     this.board = board; 
     start();
  }
  public void start()
  {
    Solve();
  }
  public boolean Solve()
  {
     Pair<Integer, Integer> empty = empty_cell();
     //print_board();
     if(empty == null)
         return true;
     int r = empty.getKey();
     int c = empty.getValue();
     
     for(int num = 1; num<=N; num++)
     {
         boolean safe = Checker.is_safe(board, r, c, num, N);
         if(safe)
         {
            board[r][c].setValue(num);
            if(Solve())
               return true;
          
            board[r][c].setValue(0);
         }
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
             return new Pair<Integer, Integer>(i, j);
           }
        } 
     }
      return null;
  }
  
 
  public Cell[][] getBoard()
  {
     return board; 
  }
  
 
  
  
}
