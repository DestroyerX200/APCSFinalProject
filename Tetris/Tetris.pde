import java.util.Arrays;
void setup() { 
  size(800,800);
  background(0);
}
TetrisBoard board = new TetrisBoard();
Tetromino piece1 = new IPiece();
void draw() {
  board.setCurrentPiece(piece1);
  board.displayBoard();
  board.displayPiece();
}

void keyPressed() {
  println(keyCode);
  if (keyCode == LEFT) {
    board.currentPiece.moveLeft();
  }
  if (keyCode == RIGHT) {
    board.currentPiece.moveRight(); 
  }
}
