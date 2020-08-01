//Abstract Class
abstract class Game
{
  protected int N;
  protected  Cell board[][];
  protected int sqr;
  
  public Game(int N)
  {
    this.N = N;
    this.sqr = (int)Math.sqrt(N);
  }
  abstract void start();
  
  public void print_board()
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
  
  public Cell[][] getBoard()
  {
    return board;
  }
}
