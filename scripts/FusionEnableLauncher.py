#!/usr/bin/env python

"""
FusionEnableLauncher.py
Author: Eitan Romanoff

Draws a simple two-button dialog that prompts the user if they want to enable
RPM fusion for the Fedora RIT Spin. Enabler script can be found at this link:
<link here>
"""

import pygtk
import subprocess
pygtk.require('2.0')
import gtk


class FusionEnableLauncher:

    """Launch the enabler script, then close this box."""
    def launch_enabler_script(self, widget, data=None):
        subprocess.call(['./enablerpmfusion.sh'], shell=True)
        self.destroy(widget, None)


    """delete event callback"""
    def delete_event(self, widget, event, data=None):
        return False


    """destroy event callback"""
    def destroy(self, widget, data=None):
        gtk.main_quit()


    """init function - draws the window and does setup"""
    def __init__(self):
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_title("Enable RPM Fusion?")
        self.window.set_resizable(False)

        # Create packing boxes. Outer level is vertical containing
        # Label upper, then horizontal box lower.
        self.box0 = gtk.VBox(False, 20)
        self.box1 = gtk.HBox(False, 5)

        # Add the veritcal box to the window
        self.window.add(self.box0)
    
        # hook up delete callback to event
        self.window.connect("delete_event", self.delete_event)
    
        # hook up destroy callback to event
        self.window.connect("destroy", self.destroy)
    
        # Sets the border width of the window.
        self.window.set_border_width(20)

        # Label for message
        self.label = gtk.Label()
        self.label.set_line_wrap(True)
        self.label.set_text("Would you like to enable non-free and/or patent encumbered repositories? Due to the legal implications of shipping non-free or patent encumbered technology, we cannot enable these packages by default. Long story short, if you want to do things like like listen to mp3, or watch youtube videos in your browser, you will probably need to enable these options. You may enable these options at any time by running the enablerpmfusion.sh script located on your desktop.")

        # Add the vertical elementals
        self.box0.pack_start(self.label, False, False, 0)
        self.box0.pack_start(self.box1, False, False, 0)
    
        # Creates two buttons - enable and cancel
        self.enable_button = gtk.Button("Enable Fusion")
        self.cancel_button = gtk.Button("Cancel")
    
        # Hook up enable button to callback on click event
        self.enable_button.connect("clicked", self.launch_enabler_script, None)
    
        # Hook up the cancel button to destroy callback on click event
        self.cancel_button.connect_object("clicked", gtk.Widget.destroy, self.window)
    
        # This packs the buttons into the horizontal box (container).
        self.box1.pack_start(self.cancel_button, True, True, 0)
        self.cancel_button.show()

        self.box1.pack_start(self.enable_button, True, True, 0)
        self.enable_button.show()

        # Make the items visible...
        self.label.show()
        self.box1.show()
        self.box0.show()
    
        # Make the window visible...
        self.window.show()

    
    def main(self):
        # All PyGTK applications must have a gtk.main(). Control ends here
        # and waits for an event to occur (like a key press or mouse event).
        gtk.main()


# If the program is run directly or passed as an argument to the python
# interpreter then create a HelloWorld instance and show it
if __name__ == "__main__":
    launcher = FusionEnableLauncher()
    launcher.main()
