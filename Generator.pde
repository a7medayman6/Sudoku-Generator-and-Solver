import java.util.Set;
import java.util.HashSet;

class Generator
{
  int rows = 9;
  int cols = 9;
  Cell board[][];
  int sqr = (int)Math.sqrt(rows); 
  public Generator(int rows, int cols)
  {
    this.rows = rows;
    this.cols = cols;
    board = new Cell[rows][cols];
    init();
    fill_board();
  }

  void fill_board()
  {
     fill_diagonal();
     Solver solver = new Solver(board, rows);
     this.board = solver.getBoard();
     
  }
 
  

  void fill_diagonal()
  {
    for (int i=0; i<rows; i+=3)
    {
      fill_square(i, i);
    }
  }
  void fill_square(int r, int c)
  {
    Set used = new HashSet<Integer>();
    
    for (int i = r; i<r+3; i++)
    {
      for (int j = c; j<c+3; j++)
      {
        int n = generate_random_number();  
        boolean safe = is_safe(i, j, n);
        if (!used.contains(n) && safe)
        {
          board[i][j].setValue(n);
          used.add(n);
          //println(str(i) + "\t" + str(j)); 
        } 
        else
          j--;
        //print(safe); 
      }
    }
  }
  boolean is_safe(int r, int c, int n)
  {
    return check_row(r, n) && check_col(c, n) && check_square(r-r%sqr, c-c%sqr, n);
  }
  boolean check_row(int r, int n)
  {
    for(int i=0; i<r; i++)
    {
       if(board[r][i].getValue() == n)
         return false;
    }
    return true;
  }
  boolean check_col(int c, int n)
  {
    for(int i=0; i<c; i++)
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
  
  
  int generate_random_number()
  {
    return (int) Math.floor((Math.random()*rows+1));
  }

  void init()
  {
    for (int i=0; i<rows; i++)
    {
      for (int j=0; j<cols; j++)
      {
        board[i][j] = new Cell(i, j, w, h, rows, cols);
      }
    }
  }

  public Cell[][] getBoard()
  {
    return board;
  }
}



//  boolean fill_rest(int i, int j)
//  {
//     int N = rows;
//     if (j>=N && i<N-1) 
//        { 
//            i = i + 1; 
//            j = 0; 
//        } 
//        if (i>=N && j>=N) 
//            return true; 
  
//        if (i < sqr) 
//        { 
//            if (j < sqr) 
//                j = sqr; 
//        } 
//        else if (i < N-sqr) 
//        { 
//            if (j==(int)(i/sqr)*sqr) 
//                j =  j + sqr; 
//        } 
//        else
//        { 
//            if (j == N-sqr) 
//            { 
//                i = i + 1; 
//                j = 0; 
//                if (i>=N) 
//                    return true; 
//            } 
//        } 
  
//        for (int num = 1; num<=N; num++) 
//        { 
//            if (is_safe(i, j, num)) 
//            { 
//                board[i][j].setValue(num); 
//                if (fill_rest(i, j+1)) 
//                    return true; 
  
//                board[i][j].setValue(0); 
//            } 
//        } 
//        return false;
//  }
