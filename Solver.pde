import javafx.util.Pair;

class Solver
{
 
  Cell board[][];
  int N;
  
  public Solver(Cell [][]board, int N)
  {
     this.board = board; 
     this.N = N; 
  }
  
  Pair<Integer, Integer> empty_cell()
  {
     for(int i=0; i<N; i++)
     {
        for(int j=0; j<N; j++)
        {
           if(board[i][j].getValue() == 0)
               retrun (new Pair<Integer, Integer>(i, j));
        }
       
     }
    
      return null;
  }
  
  
  
  
  
  
}
