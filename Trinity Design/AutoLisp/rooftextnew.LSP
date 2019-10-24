;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------GETS MAX NUMBER OF ROOFS AND MAKES A LIST OF--------------------;
;---------------NUMBER OF MODULES, PITCH AND ORIENTATION FOR------------------;
;--------------EACH ROOF, ALL OTHER ROOFS ARE "N/A"---------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(defun C:rftxtnew()
  (vl-load-com)
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (vla-getcustombykey drawing "maxroof" 'roofnum);get the max roof number from DWGPROPS
  (setq currRoofnum roofnum
  	rooftxt "\n";roof text variable is a carriage return
  )
  (setq winpt1 '(3465.625 17664.875 0))
  (setq winpt2 '(3639.375 16789.875 0))
  (setq rfwindow (ssget "W"  winpt1 winpt2))
  (command ".erase" rfwindow "")
	(if (<= (atoi currRoofnum) 20)
	  (progn
	  (setq key 1);key variable is equal to 1
  		(while	
		   (/= (- (atoi currRoofnum) key) -1);while the max roof number minus the current key number is not equal to -1
		  	(setq rfmodnum (strcat "Roof" (itoa key) "S"));make variable for current roof modules
			(setq rfpitchnum (strcat "Roof"  (itoa key) "PS"));make variable for current roof pitch
			(setq rforientationnum (strcat "Roof" (itoa key) "OS"));make variable for current roof orientation
		  	(setq roofmod (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" rfmodnum)));get current roof module numbers
			(setq roofpitch (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" rfpitchnum)));get current roof pitch numbers
			(setq rooforientation (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" rforientationnum)));get current roof orientation numbers
				;add all text together
				(setq rooftxt
				       (if (and
					     (/= roofmod "0")
					     (/= roofmod "NA")
					   )
				       		(strcat rooftxt;current roof schedule
					       		"\n" "{\\fCalibri|b1|i0|c0|p34;ROOF "   (itoa key) "}" ;name of roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   MODULES: " roofmod "}";number of modules for roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   PITCH: " roofpitch "}";pitch of roof
					      		"\n" "{\\fCalibri|b1|i0|c0|p34;   ORIENTATION: " rooforientation "}" ;orientation of roof
					      		"\n";enter
						)
					 	(strcat rooftxt;current roof schedule
					       		"\nROOF "   (itoa key) ;name of roof
					      		"\n   MODULES: " roofmod;number of modules for roof
					      		"\n   PITCH: " roofpitch "%%D";pitch of roof
					      		"\n   ORIENTATION: " rooforientation "%%D";orientation of roof
					      		"\n";enter
						)
					 )
					 
				)
		  	
		  (setq key (+ key 1));next roof
		);while
	  
  	(setq modelspace (vla-get-modelspace(vla-get-activedocument(vlax-get-acad-object))))
  	(setq pt (vlax-3d-point 3509 17588 0));point to place roof schedule
  	
  	
  	(setq rftextobj (vla-addmtext modelspace pt 150 rooftxt));add roof schedule text to model space
  	(vla-put-height rftextobj 5);change height
  	(vla-put-layer rftextobj "0");change layer
  	(vla-put-color rftextobj acByLayer);change color
  	(command "._justifytext" (entlast) "" "_BL");make base point bottom left
  	(setq inspt (cdr (assoc 10 (entget(entlast)))));get base point coordinates
	(setq bbpt (vlax-3d-point inspt))
	(setq rpt1(vlax-3d-point 3479.0625 16806.875 0))
	(vla-put-linespacingfactor (vlax-ename->vla-object (entlast)) 0.75);change line spacing
	(vla-move rftextobj bbpt rpt1)
       );progn
      );end if

     (if (> (atoi currRoofnum) 20)
	  (progn

	    (setq key 1);key variable is equal to 1
  		(while	
		   (/= key 21)
		  	(setq rfmodnum (strcat "Roof" (itoa key) "S"));make variable for current roof modules
			(setq rfpitchnum (strcat "Roof"  (itoa key) "PS"));make variable for current roof pitch
			(setq rforientationnum (strcat "Roof" (itoa key) "OS"));make variable for current roof orientation
		  	(setq roofmod (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" rfmodnum)));get current roof module numbers
			(setq roofpitch (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" rfpitchnum)));get current roof pitch numbers
			(setq rooforientation (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" rforientationnum)));get current roof orientation numbers
				;add all text together
				(setq rooftxt
				       (if (and
					     (/= roofmod "0")
					     (/= roofmod "NA")
					   )
				       		(strcat rooftxt;current roof schedule
					       		"\n" "{\\fCalibri|b1|i0|c0|p34;ROOF "   (itoa key) "}" ;name of roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   MODULES: " roofmod "}";number of modules for roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   PITCH: " roofpitch "}";pitch of roof
					      		"\n" "{\\fCalibri|b1|i0|c0|p34;   ORIENTATION: " rooforientation "}" ;orientation of roof
					      		"\n";enter
						)
					 	(strcat rooftxt;current roof schedule
					       		"\nROOF "   (itoa key) ;name of roof
					      		"\n   MODULES: " roofmod;number of modules for roof
					      		"\n   PITCH: " roofpitch "%%D";pitch of roof
					      		"\n   ORIENTATION: " rooforientation "%%D";orientation of roof
					      		"\n";enter
						)
					 )
				)
		  	
		  (setq key (+ key 1));next roof
		);while
	  
  	(setq modelspace (vla-get-modelspace(vla-get-activedocument(vlax-get-acad-object))))
  	(setq pt (vlax-3d-point 3509 17588 0));point to place roof schedule
  	
  	
  	(setq rftextobj (vla-addmtext modelspace pt 150 rooftxt));add roof schedule text to model space
  	(vla-put-height rftextobj 5);change height
  	(vla-put-layer rftextobj "0");change layer
  	(vla-put-color rftextobj acByLayer);change color
  	(command "._justifytext" (entlast) "" "_BL");make base point bottom left
  	(setq inspt2 (cdr (assoc 10 (entget(entlast)))));get base point coordinates
	(setq bbpt2 (vlax-3d-point inspt2))
	(setq rpt1(vlax-3d-point 3479.0625 16806.875 0))
	(vla-put-linespacingfactor (vlax-ename->vla-object (entlast)) 0.75);change line spacing
	(vla-move rftextobj bbpt2 rpt1);move text
	  (sssetfirst nil nil)
	  (setq rooftxt2 "\n")
		(while	
		   (/= (- (atoi currRoofnum) key) -1);while the max roof number minus the current key number is not equal to -1
		  	(setq rfmodnum (strcat "Roof" (itoa key) "S"));make variable for current roof modules
			(setq rfpitchnum (strcat "Roof"  (itoa key) "PS"));make variable for current roof pitch
			(setq rforientationnum (strcat "Roof" (itoa key) "OS"));make variable for current roof orientation
		  	(setq roofmod (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" rfmodnum)));get current roof module numbers
			(setq roofpitch (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" rfpitchnum)));get current roof pitch numbers
			(setq rooforientation (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" rforientationnum)));get current roof orientation numbers
				;add all text together
				(setq rooftxt2
				       (if (and
					     (/= roofmod "0")
					     (/= roofmod "NA")
					   )
				       		(strcat rooftxt2;current roof schedule
					       		"\n" "{\\fCalibri|b1|i0|c0|p34;ROOF "   (itoa key) "}" ;name of roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   MODULES: " roofmod "}";number of modules for roof
					      		"\n"   "{\\fCalibri|b1|i0|c0|p34;   PITCH: " roofpitch "}";pitch of roof
					      		"\n" "{\\fCalibri|b1|i0|c0|p34;   ORIENTATION: " rooforientation "}" ;orientation of roof
					      		"\n";enter
						)
					 	(strcat rooftxt2;current roof schedule
					       		"\nROOF "   (itoa key) ;name of roof
					      		"\n   MODULES: " roofmod;number of modules for roof
					      		"\n   PITCH: " roofpitch "%%D";pitch of roof
					      		"\n   ORIENTATION: " rooforientation "%%D";orientation of roof
					      		"\n";enter
						)
					)
				)
		  	
		  (setq key (+ key 1));next roof
		);while
	  (setq modelspace (vla-get-modelspace(vla-get-activedocument(vlax-get-acad-object))))
  	(setq pt (vlax-3d-point 3509 17588 0));point to place roof schedule
  	
  	
  	(setq rftextobj2 (vla-addmtext modelspace pt 150 rooftxt2));add roof schedule text to model space
  	(vla-put-height rftextobj2 5);change height
  	(vla-put-layer rftextobj2 "0");change layer
  	(vla-put-color rftextobj2 acByLayer);change color
  	(command "._justifytext" (entlast) "" "_BL");make base point bottom left
  	(setq inspt (cdr (assoc 10 (entget(entlast)))));get base point coordinates
	(setq bbpt (vlax-3d-point inspt))
	(setq rpt2(vlax-3d-point 3558.875 16806.875 0))
	(vla-put-linespacingfactor (vlax-ename->vla-object (entlast)) 0.75);change line spacing
	(vla-move rftextobj2 bbpt rpt2);move text
       );progn
      )
);defun