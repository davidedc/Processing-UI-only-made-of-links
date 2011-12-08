// it became apparent at some point that widgets might need to contain
// other widgets, so the scheme of things gets hierarchical instead of
// being flat

// you should add a way for forcing the redraw of the widgets even
// if they don't change. This is because people might want to
// change the background (is so doing, the widgets would get painted over,
// as there is no support for layers in Processing),
// so then the only way to draw them again so to force a redraw, rather than
// waiting for them to change and automatically repaint themselves

