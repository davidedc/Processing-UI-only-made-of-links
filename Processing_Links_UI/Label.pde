// I'd like to create a container called "constrained label" that would contrain the label to a particular height
// as well. if the height is 1, then there should be a ..., and by clicking on that I'd be able to see the remains of
// the message in a pop-up window

// if the height is = 2 or 3, then I'd like to see the up/down arrow

// if the height is > 3, then I'd like to see also a bar keeping tab of where I am on the label

// it would be cool to have a function "soon after" and "below" that returns the
// position soon after, and below, of the current component.

// I'd like there to be an attribute called "isLink", because
// sometimes you don't need it to be clickable and you don't need it
// to cause mousepressed callbacks - i.e. it's just a label

// I'd like to add a title to the listbox (i.e. a separate textbox that gets drawn at
// the beginning

// also I would like a call to make a whole listbox invisible (that is made by just
// making invisible all of the textboxes)

// make a lists that contains a list of strings.
// The list has a previous/next, and there is a list callback
// that specifies the list ID and the element ID


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


public class Label extends Widget { 
  
  String linkText = "";
  boolean underlined = true;
  int underlinespacing = 2;
  boolean beingDisabled = false;
  boolean flashing = false;
  boolean greyedOut = false;
  boolean textBeingChanged = false;
  
  public Label(GuiHandler guiParent, String linkText, int numberOfChars, int positionX, int positionY){
    this.linkText = linkText;
    this.numberOfChars = numberOfChars;
    this.positionX = positionX;
    this.positionY = positionY;
    this.guiParent = guiParent;
    calculateBoxSize();
  }

  public void calculateBoxSize() {
    boxw = numberOfChars * charWidth;
    boxh = 3 + underlinespacing + int(1+(linkText.length()*charWidth)/(numberOfChars*charWidth))*charHeight;
  }
  

  public void drawIt() {  
      
    // if the control is being disabled, before eliminating it from the draw queue
    // we need to paint it white so that it completely disappears
    if (beingDisabled) {
       if (!flashing){
         drawBox(color(255,255,255));
         beingDisabled = false;
         isItVisible = false;
         return;
       }
    }

    // if for some reason someone is calling the "drawIt" method directly on
    // a disabled component, we stop the drawing right here
    if (!isItVisible) return;

      int letterWidthInPixel = 10;
      
      int textboxWidth = numberOfChars * letterWidthInPixel;
      

    if (!needsRedraw) return;
      
    if (textBeingChanged) {
         drawBox(color(255,255,255));
         calculateBoxSize();
         textBeingChanged = false;
    }


      PFont font;
      font = loadFont("LucidaConsole-12-Smooth.vlw"); 
      textFont(font); 
      
      String s;
      
      //text(s, 15, 20, 70, 70);
      
      int linenum = 0;
      int columnnum = 0;
      

    // if the control is being flashed
    if (flashing) {
      drawBox(color(20,20,20));
    }
    else{
      drawBox(color(240,240,240));
    }
      
      // draw text

      if (greyedOut)
        fill(125, 125, 125);
      else if (flashing)
        fill(240,240,240);
      else
        fill(0,0,0);
   


      for ( int i=0 ; i < linkText.length() ;i++){  
        text(linkText.charAt(i), positionX+(i*charWidth)%(numberOfChars*charWidth),positionY+int((i*charWidth)/(numberOfChars*charWidth))*charHeight);
        if (mouseIsOver) text("_", positionX+(i*charWidth)%(numberOfChars*charWidth),underlinespacing+positionY+int((i*charWidth)/(numberOfChars*charWidth))*charHeight);
      }
      


    if (flashing) {
      flashing = false;
      needsRedraw = true;
    }
    else{
      needsRedraw = false;
    }
       

  }

  public void drawBox(color boxColor) {
      // draw text background
      
      fill(boxColor);
      noStroke();
      rect(positionX-2,positionY-charHeight,boxw + 4,boxh);
  }
  
  public void mouseHasBeenMoved() {        
    // this is for the mouse stuff
    if (!isItVisible || greyedOut) return;
    if (mouseIsOver()){
        guiParent.componentMouseOver(ID);
        if (!mouseIsOver) {
            needsRedraw = true;
            guiParent.componentMouseIn(ID);
        }
        mouseIsOver = true;
    }
    else {
        if (mouseIsOver) {
           needsRedraw = true;
           guiParent.componentMouseOut(ID);
        }
        mouseIsOver = false;      
    }
  }

  public void mouseHasBeenPressed() {        
    if (!isItVisible || greyedOut) return;
    if (mouseIsOver()){
            guiParent.componentMousePressed(ID);
            flashing = true;
            needsRedraw = true;            
    }
  }


  public boolean mouseIsOver() {        
    if (!isItVisible || greyedOut) return false;
    // this is for the mouse stuff
    if (mouseX > positionX-2 && mouseX < positionX-2 + boxw + 4){
      if (mouseY > positionY-charHeight && mouseY < positionY-charHeight+boxh){
        return true;
      }
    }
    return false;
  }

  public void changeText(String s) {
    if (!isItVisible || greyedOut) return;
    linkText = s;
    textBeingChanged = true;   
    needsRedraw = true;   
  }

  public void makeVisible() {
    this.isItVisible = true;
    this.needsRedraw = true;
  }

  public void makeInvisible() {
    //this.isItVisible = false;
    beingDisabled = true;
  }
 
  public boolean toggleVisibility(){
      if (isItVisible) {
        makeInvisible();
        return false;
      }
      else {
        makeVisible();
        return true;
       }
  };
  
  public boolean toggleGreyOut(){

    if (isGreyedOut()) {
        unGreyOut();
        return false;
      }
      else {
        greyOut();
        return true;
       }
  };


  public boolean isEnabled() {
    return this.isItVisible;
  }

  public void greyOut() {
    this.greyedOut = true;
    this.needsRedraw = true;
  }

  public void unGreyOut() {
    //this.isItVisible = false;
    greyedOut = false;
    this.needsRedraw = true;
  }
  public boolean isGreyedOut() {
    return this.greyedOut;
  }
  
 
}
