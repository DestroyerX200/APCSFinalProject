public abstract class Tetromino {
  public TetrisBoard board;
  public int comx, comy, state, type;
  public int row, col;
  public int COLOR;
  
  public void rotateClockwise() {
    int topOffset = 0;
    int rightOffset = 0;
    int leftOffset = 0;
    int bottomOffset = 0;
    state++;
    state%=4;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (coli >= 10) {
            leftOffset--;
          }
          else if (coli < 0) {
            rightOffset++;
          }
          else if (rowi < 0) {
            topOffset++;
          }
          else if (board.grid[rowi][coli] != 0) {
            if (col < coli) {
              leftOffset--;
            }
            if (col > coli) {
              rightOffset++;
            }
            if (row <= rowi) {
              bottomOffset--;
            }
          }
        }
      }
    }
    //println("Left Offset: " + leftOffset);
    //println("Right Offset: " + rightOffset);
    //println("Top Offset: " + topOffset);
    //println("Bottom Offset: " + bottomOffset);
    
    if ( (leftOffset != 0 && bottomOffset != 0) || (rightOffset != 0 && bottomOffset != 0) ) {
      state--;
      if (state == -1) {
        state = 3;
      }
    }
    else {
      col += rightOffset + leftOffset;
      row += bottomOffset + topOffset;
      boolean isOkay = true;
      for(int r = 0; r < pieceData.length; r++) {
        for(int c = 0; c < pieceData[0].length; c++) {
          if (pieceData[r][c] != 0) {
            int rowi = row - comx + r;
            int coli = col - comy + c;
            if (coli < 0 || coli > 9) {
              isOkay = false;
            }
            if (rowi > 19) {
              isOkay = false;
            }
            if (board.grid[rowi][coli] != 0) {
              isOkay = false;
            }
          }
        }
      }
      if (!isOkay) {
        state--;
        if (state == -1) {
          state = 3;
        }
        col -= (rightOffset + leftOffset);
        row -= (bottomOffset + topOffset);
      }
    }
  }
  public void moveRight() {
    boolean canMoveRight = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (coli == board.grid[0].length-1 || board.grid[rowi][coli+1] != 0) {
            canMoveRight = false;
          }
        }
      }
    }
    if(canMoveRight) {
      col++;
    }
  }
  public void moveLeft() {
    boolean canMoveLeft = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (coli == 0 || board.grid[rowi][coli-1] != 0) {
            canMoveLeft = false;
          }
        }
      }
    }
    if(canMoveLeft) {
      col--;
    }
  }
  public void moveDown() {
    boolean canMoveDown = true;
    int[][] pieceData = arrayData();
    for(int r = 0; r < pieceData.length; r++) {
      for(int c = 0; c < pieceData[0].length; c++) {
        if (pieceData[r][c] != 0) {
          int rowi = row - comx + r;
          int coli = col - comy + c;
          if (rowi+1 == board.grid.length || board.grid[rowi+1][coli] != 0) {
            canMoveDown = false;
          }
        }
      }
    }
    if (canMoveDown) {
      row++;
    }
  }
  private int getBottomRow() {
    int[][] pieceData = arrayData();
    boolean canMoveDown = true;
    int bottomRow = row;
    while (canMoveDown) {
      for(int r = 0; r < pieceData.length; r++) {
        for(int c = 0; c < pieceData[0].length; c++) {
          if (pieceData[r][c] != 0) {
            int rowi = bottomRow - comx + r;
            int coli = col - comy + c;
            if (rowi+1 == board.grid.length || board.grid[rowi+1][coli] != 0) {
              canMoveDown = false;
            }
          }
        }
      }
      if (canMoveDown) {
        bottomRow++;
      }
    }
    return bottomRow;
  }
  public void placeNow() {
    row = getBottomRow();
    board.canHoldPiece = true;
  }
  public void fall() {
    if (row == getBottomRow()) {
      placeNow();
      board.updateBoard();
      board.nextPiece();
    }
    else {
      moveDown();
    }
  }
  public abstract int[][] arrayData();
}
