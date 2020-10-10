// THE BALL IS RANDOMLY SPAWNED
// If the position is not good, close the tab and try again

Ball ball;        
Paddle computer;
Player player;
Bricks bricks1;
enum GAME_STATE { IN_PLAY, NO_PLAY, BEFORE_GAME, GAME_OVER };
GAME_STATE state = GAME_STATE.BEFORE_GAME;  // Keeps track of state of game
PVector NO_MOVE = new PVector(0, 0);
final int POINTS_NEEDED_TO_WIN = 5;
PFont font;
PFont gameOverFont;

void setup() {
  size(1024, 768);
  ellipseMode(RADIUS);
  
  player = new Player(0, 300, 200, 10, NO_MOVE, color(#000000));
  
  // creates an array of bricks
  bricks1 = new Bricks(0, -height/2+200, 4, 8);

  // For scoring
  font = createFont("Courier", 72);
  gameOverFont = createFont("Courier", 256);
  textFont(font);
  textAlign(CENTER, CENTER);  // Specify center of where text should be printed
}

void draw() {
  background(#ffffff);
  // Translation removed because there is a fair amount of text that is easier
  // to draw if the origin is at top left
  //translate(width/2, height/2);
  
//  showScores();  
  moveObjects();
  drawObjects();
}

public void moveObjects() {
  // The ball shouldn't move unless it is in play
  if (state == GAME_STATE.IN_PLAY) ball.move();
  player.move();
}

    
public void drawObjects() {
  // Don't draw a ball until a game has started
  if (state != GAME_STATE.BEFORE_GAME) ball.draw();
  player.draw();
  // draw the brick array
  bricks1.draw();
}
