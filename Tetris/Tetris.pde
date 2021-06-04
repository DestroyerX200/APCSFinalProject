import java.util.Arrays;
void setup() { 
  size(800,800);
  background(0);
}
TetrisBoard board = new TetrisBoard();
Tetromino piece1 = new IPiece(board);
void draw() {
  board.setCurrentPiece(piece1);
  board.displayBoard();
  board.displayPiece();
}

void keyPressed() {
  println(keyCode);
  if (keyCode == LEFT) {
    piece1.moveLeft();
  }
  if (keyCode == RIGHT) {
    piece1.moveRight(); 
  }
  if (keyCode == 32) {
    piece1.placeNow();
  }
  if (keyCode == UP) {
    piece1.rotateClockwise();
  }
}
