public class GuiContainer implements GuiHandler { 

  int ID = 0;   
  public java.util.Hashtable guiChildElements = new java.util.Hashtable(); 
  GuiHandler guiCallbacksHandler;


  public GuiContainer (GuiHandler guiCallbacksHandler){ 
    this.guiCallbacksHandler = guiCallbacksHandler;
  }

  public ListBox addListBox(String[] stringArray, int numberOfChars, int positionX, int positionY){
    
    ListBox theListBox = new ListBox(this, stringArray, numberOfChars, positionX, positionY);
    guiChildElements.put(ID, theListBox);
    theListBox.ID = getNewId();
    return theListBox;
  }

  public int getNewId(){
    ID++;
    return ID-1;
  }


  public Label addTextLink(String linkText, int numberOfChars, int positionX, int positionY){
    Label theTextLink = new Label(this, linkText, numberOfChars, positionX, positionY);
    guiChildElements.put(ID, theTextLink);
    theTextLink.ID = getNewId();
    return theTextLink;
  }

  public void drawWidgets() {  
     Enumeration e = guiChildElements.elements();
     while (e.hasMoreElements()) {
      Widget x = (Widget)e.nextElement();
      if (x.isEnabled()) x.drawIt();      
     }
  }
  
  public void mouseHasBeenMoved() {  
     Enumeration e = guiChildElements.elements();
     while (e.hasMoreElements()) {
      Widget x = (Widget)e.nextElement();
      if (x.isEnabled() && !x.isGreyedOut()) x.mouseHasBeenMoved();
     }
  }

  public void mouseHasBeenPressed() {  
     Enumeration e = guiChildElements.elements();
     while (e.hasMoreElements()) {
      Widget x = (Widget)e.nextElement();
      if (x.isEnabled() && !x.isGreyedOut()) x.mouseHasBeenPressed();
     }
  }

  public void listBoxElementClicked(int ID, int number){guiCallbacksHandler.listBoxElementClicked( ID,  number);};
  public void componentMouseIn(int ID){guiCallbacksHandler.componentMouseIn( ID);};
  public void componentMouseOut(int ID){guiCallbacksHandler.componentMouseOut(ID);};
  public void componentMouseOver(int ID){guiCallbacksHandler.componentMouseOver( ID);};
  public void componentMousePressed(int ID){guiCallbacksHandler.componentMousePressed( ID);};
  public void componentClicked(int ID){guiCallbacksHandler.componentClicked( ID);};


}
