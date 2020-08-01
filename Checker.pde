//Static Class
static class Checker
{
   static int N;
   static int sqr;
   //check if it is safe to place the number n into cell (r,c)
  //Static methods
  public static boolean is_safe(Cell[][] board, int r, int c, int n, int Nu)
  {
    N = Nu;
    sqr = (int)Math.sqrt(N);
    return check_row(board, r, n) && check_col(board, c, n) && check_square(board, r-r%sqr, c-c%sqr, n);
  }
  //different access modifires 
  protected static boolean check_row(Cell[][] board, int r, int n)
  {
    for(int i=0; i<N; i++)
    {
       if(board[r][i].getValue() == n)
         return false;
    }
    return true;
  }
  protected static boolean check_col(Cell[][] board, int c, int n)
  {
    for(int i=0; i<N; i++)
    {
       if(board[i][c].getValue() == n)
         return false;
    }
    return true;
  }
  protected static boolean check_square(Cell[][] board, int r, int c, int n)
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
  
  
}
