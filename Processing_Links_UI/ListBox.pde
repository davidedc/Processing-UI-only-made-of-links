// the list has a prev/next link at the bottom

// I'd like to set a global flag "redrawNeeded" that avoids repainting everything
// there should be a global dirty flag and a local dirty flag
// the global dirty flag is screen-wide, while the local dirty flag
// is only local to this component.

// So, if the mouse moves over this component,
// the local dirty flag is set, the component is only re-drawn once, and
// the local dirty flag is cleared

// also, the global dirty flag is set so that all components know that
// something bigger interfered and there is a need for a refresh.

// I'd like to enable and disable the links
// I'd like the links to appear and disappear nicely, with an animation
// I'd like to enable or disable the underline and for it to be subtle, and
// the mousover to change something (color)
// nicely

// I'd also like to have the option to have a nice frame and a background
// color, plus to change the font

// I'd also like to have a way to move the links by dragging them,
// and them to remember where they have been last put



public class ListBox extends Widget implements GuiHandler  { 
  
  String[] stringArray = {"",""};

  boolean beingDisabled = false;
  boolean flashing = false;
  Label labelsArray[]; 
  int progressiveY = 0;
  boolean greyedOut = false;
  
  public ListBox(GuiHandler guiParent, String[] stringArray, int numberOfChars, int positionX, int positionY){
    this.stringArray = stringArray;
    this.numberOfChars = numberOfChars;
    this.positionX = positionX;
    this.positionY = positionY;
    this.guiParent = guiParent;
    
    labelsArray = new Label[stringArray.length];
    
    for (int ctr=0; ctr < stringArray.length; ctr++){
     labelsArray[ctr] = new Label(this, stringArray[ctr], 5, positionX, positionY + progressiveY);
     labelsArray[ctr].ID = getNewId();
     progressiveY += labelsArray[ctr].boxh;
     //println(ctr + " : " + labelsArray[ctr].boxh);
    }
  }
  

  public int getNewId(){
    return guiParent.getNewId();
  }

  public void drawIt() {  
    for (int ctr=0; ctr < labelsArray.length; ctr++)
     labelsArray[ctr].drawIt();
  }
  
  public boolean isEnabled() {
    return this.isItVisible;
  }

  public void mouseHasBeenPressed() {
    if (!isItVisible || greyedOut) return;
    
    int over = mouseIsOverWichListElement();
    if (over != -1){
            listBoxElementClicked(ID, over);
            //flashing = true;
            //needsRedraw = true;            
    }
  }

  public void mouseHasBeenMoved() {
    for (int ctr=0; ctr < labelsArray.length; ctr++)
      labelsArray[ctr].mouseHasBeenMoved();
  }
  
  public boolean mouseIsOver() {
     for (int ctr=0; ctr < labelsArray.length; ctr++){
       if (labelsArray[ctr].mouseIsOver()) return true;
     }
     return false;
  }
  
  public void greyOut() {}
  public void unGreyOut() {}
  public boolean isGreyedOut() {return false;}
  public void makeVisible() {}
  public void makeInvisible() {}
 
  public boolean toggleVisibility(){return true;}
  public boolean toggleGreyOut(){return false;}

  
   public int mouseIsOverWichListElement() {        
     for (int ctr=0; ctr < labelsArray.length; ctr++){
       if (labelsArray[ctr].mouseIsOver()) return ctr;
     }
     return -1;
    }

  public void listBoxElementClicked(int ID, int number){guiParent.listBoxElementClicked( ID,  number);};
  public void componentMouseIn(int ID){guiParent.componentMouseIn( ID);};
  public void componentMouseOut(int ID){guiParent.componentMouseOut(ID);};
  public void componentMouseOver(int ID){guiParent.componentMouseOver( ID);};
  public void componentMousePressed(int ID){guiParent.componentMousePressed( ID);};
  public void componentClicked(int ID){guiParent.componentClicked( ID);};

 
}
