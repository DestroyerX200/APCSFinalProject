import java.util.*;
public class TetrisBoard {
  private int[][] grid = new int[20][10];
  private Queue<List<Tetromino>> pieces;
  public Tetromino currentPiece;
  private Tetromino heldPiece;
  private List<Tetromino> nextPieces;
  public int score;

  TetrisBoard() {
    Random rng = new Random(1);
    nextPieces = new ArrayList<Tetromino>(1000);
    for (int i = 0; i < 1000; i++) {
      int type = abs(rng.nextInt() % 7);
      Tetromino piece = numToPiece(type);
      nextPieces.add(piece);
    }
  }
  public Tetromino numToPiece(int num) {
    Tetromino[] types = new Tetromino[] {new IPiece(this), new JPiece(this), new LPiece(this), new OPiece(this), new SPiece(this), new TPiece(this), new ZPiece(this)};
    return types[num];
  }
  public void updatePieces() {
    currentPiece = nextPieces.remove(0);
  }
  public void displayBoard() {
    for (int r = 0; r < 20; r++) {
      for (int c = 0; c < grid[0].length; c++) {
        fillSquare(r, c, grid[r][c]);  
      }
    }
    stroke(255);
    noFill();
    rect(250, 0, 300, 600);
  }
  public void updateBoard() {
    int[][] pieceData = currentPiece.arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = currentPiece.row - currentPiece.comx + r;
          int coli = currentPiece.col - currentPiece.comy + c;
          grid[rowi][coli] = currentPiece.COLOR;
        }
      }
    }
  }
  public void displayPiece() {
    int[][] pieceData = currentPiece.arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          float row = currentPiece.row - currentPiece.comx + r;
          float col = currentPiece.col - currentPiece.comy + c;
          fillSquare(row, col, currentPiece.COLOR);
        }
      }
    }
  }
  public void fillSquare(float row, float col, int c) {
    stroke(255, 255, 255, 40);
    fill(c);
    rect(250+30*col, 30*row, 30, 30);
  }
  public void setCurrentPiece(Tetromino t) {
    currentPiece = t;
  }
  private void clear(int row) {
    for (int r = row; r > 0; r--) {
      for (int c = 0; c < grid[0].length; c++) {
        grid[r][c] = grid[r-1][c];
      }
    }
    for (int c = 0; c < grid[0].length; c++) {
      grid[0][c] = 0;
    }
  }
  public void clear() {
    ArrayList<Integer> lines = new ArrayList(0);
    for (int r = 0; r < grid.length; r++) {
      boolean line = true;
      for (int c = 0; c < grid[0].length; c++) {
        if (grid[r][c] == 0) {
          line = false;
        }
      }
      if (line) {
        lines.add(r);
      }
    }
   while (lines.size() > 0) {
     clear(lines.remove(0));
   }
  }
}
