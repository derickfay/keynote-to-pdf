-- Keynote 10 (Big Sur) version

tell application "System Events"
	tell application process "Keynote"
		set frontmost to true
		
		repeat until window 1 exists
		end repeat
		
		-- Hide Inspector if visible	
		if menu item "Hide Inspector" of menu 1 of menu bar item "View" of menu bar 1 exists then
			keystroke "i" using {command down, option down}
		end if
		
		-- Print; wait until the sheet is visible	
		click menu item "Print…" of menu 1 of menu bar item "File" of menu bar 1
		
		repeat until sheet 1 of window 1 exists
		end repeat
		
		set thePopUp to pop up button 2 of splitter group 1 of sheet 1 of window 1
		click thePopUp
		click menu item "6x" of menu 1 of thePopUp --replace if desired with your preferred preset
		
		if value of (radio button "Selection" of splitter group 1 of sheet 1 of window 1) is 0 then
			click (radio button "Selection" of splitter group 1 of sheet 1 of window 1)
		end if --set to print selected slides only -- you can use the same technique to adjust other checkboxes as desired
		
		click checkbox 2 of group 3 of splitter group 1 of sheet 1 of window 1
		-- 1 = Slide ; 2 = Grid ; 3 = Handout ; 4 = Outline
		click menu button "PDF" of splitter group 1 of sheet 1 of window 1
		click menu item "Save as PDF" of menu 1 of menu button "PDF" of splitter group 1 of sheet 1 of window 1
	end tell
end tell
