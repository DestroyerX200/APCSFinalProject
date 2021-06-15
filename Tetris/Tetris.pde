import java.util.Arrays;
TetrisBoard board;
void setup() {
  size(800, 800);
  background(0);
  displayMenu();
  board.nextPiece();
}
//void draw() {
//  board.display();
//}

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
  //if (keyCode == 82) {
    
  //}
}

void displayMenu() {
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
