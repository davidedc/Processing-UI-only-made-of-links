public class Widget implements WidgetInterface{ 
  
  int numberOfChars = 10;
  boolean isItVisible = true;
  boolean mouseIsOver = false;
  boolean needsRedraw = true;
  int positionX  = 0;
  int positionY  = 0;
  int boxw;
  int boxh;
  int charHeight = 14;
  int ID = 0;
  int charWidth = 7;
  GuiHandler guiParent;
  
  public void drawIt(){}
  public void mouseHasBeenMoved(){}
  public void mouseHasBeenPressed(){}
  public boolean mouseIsOver(){return true;}
  public void makeVisible(){}
  public void makeInvisible(){}
  public boolean isEnabled(){return true;}
  public void greyOut(){}
  public void unGreyOut(){}
  public boolean isGreyedOut(){return true;}
  public boolean toggleVisibility(){return true;}
  public boolean toggleGreyOut(){return true;}
   
}
