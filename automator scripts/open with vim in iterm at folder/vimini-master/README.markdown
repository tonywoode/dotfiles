Vimini 0.1
---
---


####Requirements:

*  The `vim` command should be on your system.

*  You should have [iTerm2](https://github.com/gnachman/iTerm2) installed.

---

####Installation:

*  Put the app in your Applications folder.

*  Double-click the workflow to install it or manually place it in `~/Library/Services`.

---

####Usage

######Choosing which profile to use:
Double click the app or launch it from the dock.

*The first time it is run, it will not yet have any iTerm profile set, so you will be presented with a list of profiles.  If you choose one, then that profile will be used when you open files with Vimini.*


######Opening files:

*  Put Vimini on your dock and then you can drag files onto it.  This is handy for extension-less files.


*  Installed the "Open with Vim in iTerm.workflow" service, then it will be available on the context-menu when you right-click a file which Finder considers to be a document.

*  Form a file-association between a file and Vimini.app via Finder's "Get Info" command.
    *  Select a file or files, right-click and choose "Get Info" from the context-menu.
    
    *  Change the value of "Open with…" to Vimini.app.
    
    *  You will probably also want to check the box marked "Always open with" at this point.
    
    *  To associate by file-extension, you may select "change all" at the "Get Info" panel, after having formed an association in the preceding manner.


---

######Notes:

If you delete the profile that Vimini is set to use, then you should choose another profile.

Profiles with spaces in their names will be ignored, because that is how the profile named "Hotkey Window" is being ignored.

---
*[github repository](https://github.com/dustractor/vimini)*
