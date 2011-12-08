interface GuiHandler {
  void listBoxElementClicked(int ID, int number);
  void componentMouseIn(int ID);
  void componentMouseOut(int ID);
  void componentMouseOver(int ID);
  void componentMousePressed(int ID);
  void componentClicked(int ID);
  int getNewId();
}

