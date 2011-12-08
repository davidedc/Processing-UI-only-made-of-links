// I'm using this class because I don't want the handler in the "main" file to
// contain the method "getNewId", as that should be all transparent.

// so, I provide this class, and in the main I extend it, so the method is actually
// there, and the GuiHandler interface is satisfied, but yet the method "getNewId"
// is not visible in the "main" file

class GuiCallbacksHandler implements GuiHandler{
  void listBoxElementClicked(int ID, int number){};
  void componentMouseIn(int ID){};
  void componentMouseOut(int ID){};
  void componentMouseOver(int ID){};
  void componentMousePressed(int ID){};
  void componentClicked(int ID){};
  int getNewId(){return 0;};
}
