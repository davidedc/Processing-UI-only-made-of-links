
interface WidgetInterface { 
  
  boolean isItVisible = true;
  boolean mouseIsOver = false;
  boolean needsRedraw = true;
  int positionX  = 0;
  int positionY  = 0;
  int sizeX  = 0;
  int sizeY  = 0;
  int boxw = 0;
  int boxh = 0;
  int ID = 0;

  public void drawIt();
  public void mouseHasBeenMoved();
  public void mouseHasBeenPressed();
  public boolean mouseIsOver();
  public void makeVisible();
  public void makeInvisible();
  public boolean isEnabled();
  public void greyOut();
  public void unGreyOut();
  public boolean isGreyedOut();
  public boolean toggleVisibility();
  public boolean toggleGreyOut();
   
}
