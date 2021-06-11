import java.util.Arrays;
TetrisBoard board = new TetrisBoard();
void setup() { 
  size(800,800);
  background(0);
  board.updatePieces();
}
void draw() {
  board.displayBoard();
  board.displayPiece();
  board.displayPreview();
  board.clear();
}

void keyPressed() {
  if (keyCode == LEFT) {
    board.currentPiece.moveLeft();
  }
  if (keyCode == RIGHT) {
    board.currentPiece.moveRight(); 
  }
  if (keyCode == 32) {
    board.currentPiece.placeNow();
    board.updateBoard();
    board.updatePieces();
  }
  if (keyCode == UP) {
    board.currentPiece.rotateClockwise();
  }
  if (keyCode == DOWN) {
    board.currentPiece.moveDown();
  }
}
