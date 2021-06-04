public class OPiece extends Tetromino {
  OPiece() {
    comx = 2;
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
