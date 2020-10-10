// In this tab, you must write code in:
//
// * intersectsPaddle(Paddle paddle)
// * move()

class Ball {
  private float radius;
  private float x;
  private float y;
  private PVector vector;
  private color fillColor;
  
  public Ball(float x, float y, float radius, PVector vector, color c) {
    this.x = x;
    this.y = y;
    this.vector = vector;
    this.radius = radius;
    this.fillColor = c;
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  public float getRadius() { return radius; }
  public PVector getVector() { return vector; }
  public void setVector(PVector vector) { this.vector = vector; }
  public void invertY() {vector.y = -vector.y;}
  
  public float distance(Ball other) {
    return (float) Math.sqrt(square(getX()-other.getX()) + square(getY()-other.getY()));
  }
  
  // Returns true if ball is touching a vertical wall
  public boolean intersectsVertical() {
    return (getX()+(width/2)+getRadius() >= width) ||
           (getX()+(width/2)-getRadius() <= 0);
  }
  
  // checks if the ball touches the bottom, later tells it to stop
  public boolean intersectsBottom() {
    return (getY()+(height/2)+getRadius() >= height); }
  
  // checks if the ball touches the top, later tells it to bounch
  public boolean intersectsTop() {
    return (getY()+(height/2)-getRadius() <= 0); }
  
  // Return true if the ball is touching the paddle
  public boolean intersectsPaddle(Paddle paddle) {
    float bally1 = getY() - getRadius();
    float bally2 = getY() + getRadius();
    float paddley1 = paddle.getY() - paddle.getHeight()/2;
    float paddley2 = paddle.getY() + paddle.getHeight()/2;
    float paddleleft = paddle.getX() - paddle.getWidth()/2;
    float paddleright = paddle.getX() + paddle.getWidth()/2;
    if (((paddle.getY() < 0 && bally1 <= paddley2) ||
         (paddle.getY() > 0 && bally2 >= paddley1)) &&
         (between(ball.getX(), paddleleft, paddleright)))
        {
        return true;
        }
      return false;
  }
  
  public void move() {
    // If the ball is not in play, it should not move
    // It is somewhat useful visually to have it stay by the wall it hits
    // when a point ends
    if (state != GAME_STATE.IN_PLAY) return;

    // If the ball is in play, then it needs to change direction if it hits
    // a paddle...
    if (intersectsPaddle(player)) {
      vector.y = -vector.y;
    }
    bricks1.checkBall(this);
    
    // ...or if it hits the top or bottom wall
    if (intersectsVertical())
    {
      vector.x = -1 * vector.x;
    }
    if (intersectsBottom())
    {
      vector.x = 0;
      vector.y = 0;
      text("GAME OVER", width/2, 350);
    }
    if (intersectsTop())
    {
      vector.y = -1 * vector.y;
    }
    
    // Update the coordinates of the ball
    x = getX() + vector.x;
    y = getY() + vector.y;
  }
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    ellipse(x + width/2, y + height/2, radius, radius);
  }
}
