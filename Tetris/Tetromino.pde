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
    col++;
  }
  public void moveLeft() {
    boolean canMoveLeft = true;
    col--;
  }
  //public void moveDown();
  public void placeNow() {
    int[][] pieceData = arrayData();
    boolean canMoveDown = true;
    while (canMoveDown) {
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
  }
  //public abstract void display();
  public abstract int[][] arrayData();
}
