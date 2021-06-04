public abstract class Tetromino {
  public int comx, comy, state, type;
  public int[][] box;
  public int COLOR;
  
  //public abstract void rotateClockwise();
  //public abstract void moveRight();
  //public abstract void moveLeft();
  //public void moveDown();
  //public void placeNow();
  //public abstract void display();
  public abstract int[][] arrayData();
}
