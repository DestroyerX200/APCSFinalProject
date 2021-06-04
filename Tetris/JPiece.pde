public class JPiece extends Tetromino {
  JPiece() {
    comx = 2;
    comy = 1;
    state = 0;
    type = 0;
    COLOR = #1520E3;
  }
  public int[][] arrayData() {
    if (state == 0) {
      return new int[][] {{0, 0, 0},
                          {0, 0, 0},
                          {0, 0, 0}};
    }
    else if (state == 1) {
      return null;
    }
    else if (state == 2) {
      return null;
    }
    else {
      return null;
    }
  }
}
