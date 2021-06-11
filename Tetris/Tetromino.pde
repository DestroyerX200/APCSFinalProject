public abstract class Tetromino {
  public TetrisBoard board;
  public int comx, comy, state, type;
  public int row, col;
  public int COLOR;
  
  public void rotateClockwise() {
    state++;
    state%=4;
  }
  public void moveRight() {
    boolean canMoveRight = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (coli == board.grid[0].length-1 || board.grid[rowi][coli] != 0) {
            canMoveRight = false;
          }
        }
      }
    }
    if(canMoveRight) {
      col++;
    }
  }
  public void moveLeft() {
    boolean canMoveLeft = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (coli == 0 || board.grid[rowi][coli-1] != 0) {
            canMoveLeft = false;
          }
        }
      }
    }
    if(canMoveLeft) {
      col--;
    }
  }
  public void moveDown() {
    boolean canMoveDown = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (rowi+1 == board.grid.length || board.grid[rowi+1][coli] != 0) {
            canMoveDown = false;
          }
        }
      }
    }
    if (canMoveDown) {
      row++;
    }
  }
  private int getBottomRow() {
    int[][] pieceData = arrayData();
    boolean canMoveDown = true;
    int bottomRow = row;
    while (canMoveDown) {
      for(int r = 0; r < pieceData.length; r++) {
        for(int c = 0; c < pieceData[0].length; c++) {
          if (pieceData[r][c] != 0) {
            int rowi = bottomRow - comx + r;
            int coli = col - comy + c;
            if (rowi+1 == board.grid.length || board.grid[rowi+1][coli] != 0) {
              canMoveDown = false;
            }
          }
        }
      }
      if (canMoveDown) {
        bottomRow++;
      }
    }
    return bottomRow;
  }
  public void placeNow() {
    row = getBottomRow();
    println(row);
  }
  //public abstract void display();
  public abstract int[][] arrayData();
}
