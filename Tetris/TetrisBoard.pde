import java.util.*;
public class TetrisBoard {
  private int[][] grid = new int[20][10];
  private List<Tetromino> pieces;
  public Tetromino currentPiece;
  private int heldPiece;
  public int score;
  private int pieceNumber;
  private boolean canHoldPiece = true;
  private String MODE;
  public int time = millis();
  private int naturalFallTime = second();

  TetrisBoard() {
    pieceNumber = 0;
    pieces = new ArrayList<Tetromino>();
    addPieces();
    addPieces();
    heldPiece = -1;
  }
  
  
  
  public void addPieces() {
    for(Tetromino t: generateBag() ) {
      pieces.add(t);
    }
  }
  
  public Tetromino numToPiece(int num) {
    Tetromino[] types = new Tetromino[] {new IPiece(this), new JPiece(this), new LPiece(this), new OPiece(this), new SPiece(this), new TPiece(this), new ZPiece(this)};
    return types[num];
  }
  
  public int pieceToNum(Tetromino piece) {
    ArrayList<Integer> pieceColors = new ArrayList<Integer>(7);
    pieceColors.add(#1EF5F3); pieceColors.add(#1520E3);
    pieceColors.add(#FFAB0D); pieceColors.add(#FCFC19);
    pieceColors.add(#0DFF16); pieceColors.add(#B316ED);
    pieceColors.add(#FF0D2D);
    return pieceColors.indexOf(piece.COLOR);
  } 
  public List<Tetromino> generateBag() {
    List<Tetromino> bag = new ArrayList<Tetromino>(7);
    int[] numbers = {0,1,2,3,4,5,6};
    
    List<Integer> nums = new ArrayList<Integer>(numbers.length);
    for (int i : numbers) {
      nums.add(i);
    }
    Collections.shuffle(nums);
    for (Integer n: nums) {
      bag.add(numToPiece(n));
    }
    return bag;
  }
  
  public void nextPiece() {
    pieceNumber++;
    if (pieceNumber == 7) {
      pieceNumber = 0;
      addPieces();
    }
    currentPiece = pieces.remove(0);
  }
  public void displayBoard() {
    background(0);
    for (int r = 0; r < 20; r++) {
      for (int c = 0; c < grid[0].length; c++) {
        fillSquare(r, c, grid[r][c]);  
      }
    }
    stroke(255);
    noFill();
    rect(250, 0, 300, 600);
    displayNextPieces(4);
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
  
  public void displayPiece(Tetromino piece, int row, int col) {
    int[][] pieceData = piece.arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          float rowi = row - piece.comx + r;
          float coli = col - piece.comy + c;
          fillSquare(rowi, coli, piece.COLOR);
        }
      }
    }
  }
  
  public void displayNextPieces(int n) {
    for (int i = 0; i < n; i++) {
      Tetromino piece = pieces.get(i);
      displayPiece(piece, 2+3*i, 13);
    }
  }
  
  public void displayCurrent() {
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
  public void displayPreview() {
    color colour = currentPiece.COLOR;
    float red = red(colour);
    float green = green(colour);
    float blue = blue(colour);
    colour = color(red, green, blue, 50);
    int bottomRow = currentPiece.getBottomRow();
    int column = currentPiece.col;
    int[][] pieceData = currentPiece.arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          float row = bottomRow - currentPiece.comx + r;
          float col = currentPiece.col - currentPiece.comy + c;
          fillSquare(row, col, colour);
        }
      }
    }
  }
  public void holdPiece() {
    if (canHoldPiece) {
      if (heldPiece == -1) {
        heldPiece = pieceToNum(currentPiece);
        currentPiece = pieces.remove(0);
        canHoldPiece = false;
      }
      else {
        int temp = heldPiece;
        heldPiece = pieceToNum(currentPiece);
        currentPiece = numToPiece(temp);
        canHoldPiece = false;
      }
    }
  }
  private void displayHeldPiece() {
    if (heldPiece != -1) {
      displayPiece(numToPiece(heldPiece), 2, -4);
    }
  }
  public void updateTime() {
    time = millis();
  }
  public void displayTime() {
    textSize(68);
    fill(255);
    text( (float) time / 1000.0, 300, 700);
    noFill();
  }
}
