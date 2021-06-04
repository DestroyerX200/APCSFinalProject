public abstract class Tetromino {
  int comx, comy, state, type;
  int[][] box;
  
  public abstract void rotateClockwise();
  public abstract void moveRight();
}
