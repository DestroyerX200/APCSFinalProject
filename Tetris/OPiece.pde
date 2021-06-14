public class OPiece extends Tetromino {
  OPiece(TetrisBoard t) {
    board = t;
    row = 2;
    col = 4;
    comx = 0;
    comy = 1;
    state = 0;
    type = 0;
    COLOR = #FCFC19;
  }
  public int[][] arrayData() {
    return new int[][] {{1,1},
                        {1,1}};
  }
}
