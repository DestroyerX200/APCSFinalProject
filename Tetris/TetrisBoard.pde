import java.util.*;
public class TetrisBoard {
  private int[][] grid = new int[20][10];
  private Queue<List<Tetromino>> pieces;
  public Tetromino currentPiece;
  private Tetromino heldPiece;
  private List<Tetromino> nextPieces;
  public int score, currentRow, currentCol;

  TetrisBoard() { 
  }
  public void displayBoard() {
    for (int r = 0; r < 20; r++) {
      for (int c = 0; c < grid[0].length; c++) {
        fillSquare(r, c, 0);  
      }
    }
    stroke(255);
    noFill();
    rect(250, 0, 300, 600);
  }
  public void displayPiece() {
    int[][] pieceData = currentPiece.arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          float row = currentRow - currentPiece.comx + r;
          println(row);
          float col = currentCol - currentPiece.comy + c;
          fillSquare(row, col, currentPiece.COLOR);
        }
      }
    }
  }
  public void fillSquare(float row, float col, int c) {
    if (c == 0) {
      stroke(255, 255, 255, 40);
    }
    fill(c);
    rect(250+30*col, 30*row, 30, 30);
  }
  public void setCurrentPiece(Tetromino t) {
    currentPiece = t;
    currentRow = 6;
    currentCol = 4;
  }
}
