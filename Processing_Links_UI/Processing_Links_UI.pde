// i want to find out exactly how big is the box that contains
// some text, for two reasons:
//   1) I want to put some underline under it,
//      so that it looks like a link
//   2) I can detext exactly when the mouse is over it so
//      that I can handle mouseovers and clicks

// unfortunately there is no pre-cooked processing function to do
// that

// the way to do that is to calculate how the text wraps around
// a box of a specified width (wrapping tries to not break words if
// possible) so that we can figure out how the text is exactly
// placed under 

// begin:
//   take the characters up to the first space
//   see if that piece fits in the remaining space of the line
//   if not
//     mark the "wrap" flag
//   take as many next letters FROM THE NEXT WORD (not any further)
//      as they fit in the line
//   place the piece of the word and place it
//   move the marker of "available line" further
//   (wrap it and go down a line if you end up at the end of the line
// goto begin:

// there is a caret that scans the thing
// if the next word fits in the line, place it
// if not
// go down a line
// if it doesn't fit, place the part of it that fits

// start with the algorithm that places blindly

Label firstTextLink, secondTextLink, thirdTextLink, fourthTextLink;
ListBox firstListBox;

// GuiContainer ideally should be a static class, but
// for some reason Processing wouldn't let me create
// any objects from within a static class, so I had
// to resort to just make GuiContainer as a normal class
CallBacksHandler callBacksHandler = new CallBacksHandler();
GuiContainer guiContainer = new GuiContainer(callBacksHandler);

void setup(){
  size(400,300);
  background(255);
  frameRate(10);
  firstTextLink = guiContainer.addTextLink("this is some random text", 5, 10, 60);
  secondTextLink = guiContainer.addTextLink("this is text2", 5, 70, 60);
  thirdTextLink = guiContainer.addTextLink(firstTextLink.ID + " miao " + secondTextLink.ID, 5, 140, 60);
  fourthTextLink = guiContainer.addTextLink(" empty ", 5, 210, 60);
  
  String[] a = { "inconsistent ", "spacing" };
  firstListBox = guiContainer.addListBox(a, 5, 280, 60);

}

void draw() {
  // note that the widgets attempt to draw themselves only if they changed
  // from the last time they were drawn. This means that if you paint over
  // the widgets (for example if you want to change the background color, as
  // Processing doesn't have layers), they'll re-appear only if they change
  guiContainer.drawWidgets();  
}

/////////////////////////////////////////
// notifying the gui components of events
/////////////////////////////////////////

void mouseMoved() {
  guiContainer.mouseHasBeenMoved();
}

void mousePressed() {
  guiContainer.mouseHasBeenPressed();
}



class CallBacksHandler extends GuiCallbacksHandler{

  //////////////////////////////////
  // calling the callback functions
  //////////////////////////////////
  
  void listBoxElementClicked(int ID, int number) {
    thirdTextLink.changeText("listbox element clicked: id " + ID + " number "+ number);
  }
  
  void componentMouseIn(int ID) {
    thirdTextLink.changeText("in "+ ID);
  }
  
  void componentMouseOut(int ID) {
    thirdTextLink.changeText("out "+ ID);
  }
  
  void componentMouseOver(int ID) {
    fourthTextLink.changeText("over "+ ID);
  }
  
  void componentMousePressed(int ID) {
    fourthTextLink.changeText("Pressed "+ ID);
    if (ID == fourthTextLink.ID || ID == firstTextLink.ID){
      //firstTextLink.makeInvisible();
      firstTextLink.toggleVisibility();
    }
    if (ID == thirdTextLink.ID){
      //firstTextLink.makeInvisible();
      secondTextLink.toggleGreyOut();
    }
  
  }
  

}
