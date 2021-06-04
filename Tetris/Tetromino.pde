public abstract class Tetromino {
  public int comx, comy, state, type;
  public int row, col;
  public int COLOR;
  
  //public abstract void rotateClockwise();
  public void moveRight() {
    col++;
  }
  public void moveLeft() {
    col--;
  }
  //public void moveDown();
  //public void placeNow();
  //public abstract void display();
  public abstract int[][] arrayData();
}
