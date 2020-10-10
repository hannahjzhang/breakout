class Bricks {
  private Brick[][] bricks;
  private float x;
  private float y;
  private float w;
  private float h;
  private int nrow;
  private int ncol;

  
  public Bricks(float x, float y, int nrow, int ncol){
    this.x = x;
    this.y = y;
    this.nrow = nrow;
    this.ncol = ncol;
    w = (float)width/ncol;
    //System.out.printf("%d, %d %f\n", width, ncol, h);
    h = 20;
    //System.out.printf("%d,%d, %f, %f\n", nrow, ncol, w, h);
    bricks = new Brick[nrow][ncol];
    float ty = y - h/2;
    for (int i=0; i<nrow; i++){
      float tx = x - width/2 + w/2;
      for(int j=0; j<ncol; j++){
        //System.out.printf("%d %d\n", i, j);
        //System.out.printf("%f\n", tx);
        bricks[i][j] = new Brick(tx, ty, w, h, 1, color(#000000) );
        //bricks[i][j].show();
        tx += w;
      }
      ty -= h;
    }
  }
  public void draw(){
    //System.out.println("bricks draw");
    for(int i=0; i<nrow; i++){
      for(int j=0; j<ncol; j++){
        bricks[i][j].draw();
      }
    }
  }
  public void checkBall(Ball ball) {
    System.out.printf("CheckingBall %f vs %f\n", ball.getY(), y);
    int col = (int)((ball.getX() + width/2) / w);
    System.out.printf("Hit %d", col);
    float bally = ball.getY() - ball.getRadius();
    for(int i=0; i<nrow; i++) {
      if (bally <= y - i*h) {
        if (bricks[i][col].getState() > 0 ) {
          bricks[i][col].setState(0);
          ball.invertY();
        }
      }
    }
    
  }
}
