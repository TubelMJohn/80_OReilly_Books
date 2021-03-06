// This example is from the book _Java AWT Reference_ by John Zukowski.
// Written by John Zukowski.  Copyright (c) 1997 O'Reilly & Associates.
// You may study, use, modify, and distribute this example for any purpose.
// This example is provided WITHOUT WARRANTY either expressed or
import sun.awt.VerticalBagLayout;
import java.awt.*;
import java.applet.Applet;
public class vertbag extends Applet {
   public void init () {
        String []fonts;
        setLayout (new VerticalBagLayout (10));
	fonts = Toolkit.getDefaultToolkit().getFontList();
	for (int i = 0; i < fonts.length; i++) {
            Button b = new Button (fonts[i]);
            b.setFont (new Font (fonts[i], Font.BOLD, (i*3)+10));
            add (b);
	}
        resize (preferredSize());
   }

}
