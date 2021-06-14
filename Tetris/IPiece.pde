public class IPiece extends Tetromino {
  IPiece(TetrisBoard t) {
    board = t;
    row = 0;
    col = 4;
    comx = 1;
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
    else if (state == 1) {
      return new int[][] {{0, 1, 0, 0},
                          {0, 1, 0, 0},
                          {0, 1, 0, 0},
                          {0, 1, 0, 0}};
    }
    else if (state == 2) {
      return new int[][] {{0, 0, 0, 0},
                          {0, 0, 0, 0},
                          {1, 1, 1, 1},
                          {0, 0, 0, 0}};
    }
    else {
      return new int[][] {{0, 0, 1, 0},
                          {0, 0, 1, 0},
                          {0, 0, 1, 0},
                          {0, 0, 1, 0}};
    }
  }
}
