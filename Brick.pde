// make a class called brick
// draws the bricks at the top that are hit and then dissapear

class Brick {
  private float x;
  private float y;
  private float w;
  private float h;
  private int state;
  private color fillColor;
  
  public Brick(float x, float y, float w, float h, int s, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.state = s;
    this.fillColor = c;
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() { return h; }
  public void setX(float x) { this.x = x; }
  public void setY(float y) { this.y = y; }
  public int getState() { return state; }
  public void setState(int s) { state = s; }
  
  public void draw() {
    if (state > 0)
    {
      fill(fillColor);
      stroke(#ff0000);
      // shift x coordinate slightly so that it appears correctly
      rect(x + width/2 - getWidth()/2, y + height/2, getWidth(), getHeight());
    }
  }
}
