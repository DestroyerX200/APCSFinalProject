public class SPiece extends Tetromino {
  SPiece(TetrisBoard t) {
    board = t;
    row = 2;
    col = 4;
    comx = 1;
    comy = 1;
    state = 0;
    type = 0;
    COLOR = #0DFF16;
  }
  public int[][] arrayData() {
    if (state == 0) {
      return new int[][] {{0, 0, 0},
                          {0, 1, 1},
                          {1, 1, 0}};
    }
    else if (state == 1) {
      return new int[][] {{0, 1, 0},
                          {0, 1, 1},
                          {0, 0, 1}};
    }
    else if (state == 2) {
      return new int[][] {{0, 1, 1},
                          {1, 1, 0},
                          {0, 0, 0}};
    }
    else {
      return new int[][] {{1, 0, 0},
                          {1, 1, 0},
                          {0, 1, 0}};
    }
  }
}
