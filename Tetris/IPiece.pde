public class IPiece extends Tetromino{
  IPiece() {
    comx = 2;
    comy = 1;
    state = 0;
    type = 0;
    COLOR = #1EF5F3;
  }
  public int[][] arrayData() {
    if (state == 0) {
      return new int[][] {{0, 0, 0, 0},
                          {1, 1, 1, 1},
                          {0, 0, 0, 0},
                          {0, 0, 0, 0}};
    }
    if (state == 1) {
      return new int[][] {{0, 1, 0, 0},
                          {0, 1, 0, 0},
                          {0, 1, 0, 0},
                          {0, 1, 0, 0}};
    }
    if (state == 2) {
      return new int[][] {{0, 0, 0, 0},
                          {0, 0, 0, 0},
                          {1, 1, 1, 1},
                          {0, 0, 0, 0}};
    }
    if (state == 3) {
      return new int[][] {{0, 0, 1, 0},
                          {0, 0, 1, 0},
                          {0, 0, 1, 0},
                          {0, 0, 1, 0}};
    }
  }
}
