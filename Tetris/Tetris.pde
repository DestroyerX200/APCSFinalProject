void setup() { 
  size(800,800);
  background(0);
}

TetrisBoard board = new TetrisBoard();
void draw() {
  board.displayBoard();
}

void keyPressed() {
}
