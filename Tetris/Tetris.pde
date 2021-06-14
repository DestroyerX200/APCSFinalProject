import java.util.Arrays;
TetrisBoard board = new TetrisBoard();
void setup() { 
  size(800, 800);
  background(0);
  board.nextPiece();
}
void draw() {
  board.displayBoard();
  board.displayCurrent();
  board.displayPreview();
  board.displayHeldPiece();
  board.clear();
  board.updateTime();
  board.displayTime();
  board.naturallyFall();
  if (second() % 2 == 0) {
    board.naturallyFall();
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    board.currentPiece.moveLeft();
  }
  if (keyCode == RIGHT) {
    board.currentPiece.moveRight();
  }
  if (keyCode == 32) { //spacebar
    board.currentPiece.placeNow();
    board.updateBoard();
    board.nextPiece();
  }
  if (keyCode == UP) {
    board.currentPiece.rotateClockwise();
  }
  if (keyCode == DOWN) {
    board.currentPiece.moveDown();
  }
  if (keyCode == 67) { // c
    board.holdPiece();
  }
}
