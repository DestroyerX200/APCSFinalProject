import java.util.*;
public class TetrisBoard {
  int[][] grid = new int[10][20];
  Queue<List<Tetromino>> pieces;
  Tetromino heldPiece;
  List<Tetromino> nextPieces;
  int score;

  TetrisBoard() { 
  }
  public void displayBoard() {
    for (int r = 0; r < grid.length; r++) {
      for (int c = 0; c < grid[0].length; c++) {
        fillSquare(r, c, 0);  
      }
    }
    stroke(255);
    noFill();
    rect(250, 0, 300, 600);
  }
  public void fillSquare(float row, float col, int c) {
    if (c == 0) {
      stroke(255, 255, 255, 40);
    }
    fill(c);
    rect(250+30*row, 30*col, 30, 30);
  }
}
