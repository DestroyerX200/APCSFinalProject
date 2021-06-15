import java.util.Arrays;
TetrisBoard board;
void setup() {
  size(800, 800);
  background(0);
  displayMenu();
}
void draw() {
  if (board != null) {
    board.display();
  }
}

void keyPressed() {
  if (board != null) {
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
  println(keyCode);
  if (keyCode == 49) {
    board = new TetrisBoard(10);
    board.nextPiece();
  }
  if (keyCode == 50) {
    board = new TetrisBoard(20);
    board.nextPiece();
  }
  if (keyCode == 51) {
    board = new TetrisBoard(40);
    board.nextPiece();
  }
  if (keyCode == 52) {
    board = new TetrisBoard(100);
    board.nextPiece();
  }
  if (keyCode == 53) {
    board = new TetrisBoard();
    board.nextPiece();
  }
  
  if (keyCode == 82) {
    board = null;
    displayMenu();
  }
}

void displayMenu() {
  background(0);
  textSize(30);
  fill(#8826C6);
  text("Controls:", 100, 100);
  fill(#1543E3);
  text("DOWN, LEFT, RIGHT arrow keys to move.", 100, 150);
  text("UP arrow key to rotate clockwise 90 degrees.", 100, 200);
  text("SPACE to place piece immediately.", 100, 250);
  text("C to hold piece.", 100, 300);
  fill(#8826C6);
  text("Options:", 100, 350);
  fill(#FF1212);
  text("1: 10 Line Clear", 100, 400);
  text("2: 20 Line Clear", 100, 450);
  text("3: 40 Line Clear", 100, 500);
  text("4: 100 Line Clear", 100, 550);
  text("5: Score", 100, 600);
  fill(#F6FF12);
  text("Press 1, 2, 3, 4, or 5 to begin!", 100, 650);
}
