# APCSFinalProject

https://docs.google.com/document/d/1tz96C7Mc_rMk2NuH2R_6veGA5nvGpUVcCNv5Ao9cPCM/edit?usp=sharing

Development Log:
Day 0: N/A
Day 1: Working on handwriting a rough draft UML diagram for now to complete prototype; might export to a digitalized version later.
Day 2-6: Worked more on Prototype, but ~slow work flow otherwise (will change moving forward)
Day 7: Commited changes including creating TetrisBoard class and base Tetromino class. Got board display to work.
Day 8: Commited many changes including filling out all arrayData() methods of Tetromino subclasses, as well as many instance variables. Got totally random piece generation to work, as well as displaying and placing pieces, and clearing lines.
Day 9-12: N/A
Day 13-14: Thinking about ways to implement a version of rotate that will not rotate a piece out of bounds.
Day 15-16: N/A
Day 17: Got 7-bag piece generation working, also got preview and piece-holding working.
Day 18: Got rotate to offset when it would cause problems (at least most of the time, hopefully?) and created menu and victory/defeat screens.

Compile/Run Instructions:
Open the Tetris.pde file in Processing and press Ctrl + R to run. Controls are specified after running but are also listed here:
1, 2, 3, 4, or 5 to select a gamemode.
LEFT/RIGHT/DOWN arrows to move piece.
UP arrow to rotate piece 90 degrees clock.
SPACEBAR to place piece immediately.
C to hold piece.