(defun cleanSketch()
	(setq curEcho (getvar "cmdecho"))
	(setvar "cmdecho" 0)
	(defun searchList(val list1)
		(setq 
			len(length list1)
		)
		(-
			len
			(length(member val list1))
		)
	)



	(defun roofMarkers()
		(setq
			curAtt (getvar "attdia")
			curLay (getvar "clayer")
			curSnap (getvar "osmode")
			curEcho (getvar "cmdecho")
			blk "RoofNums"
			count 0
			roofNums nil
			roofPoints nil
			roof (setq a(ssget "x" '((8 . "TX_Face_names")(0 . "MTEXT")) ))
		)
		
		(setvar "cmdecho" 0)
		(setvar "attdia" 0)
		
		(while
			(< count (sslength roof))
			(progn
				(setq roofNums (append roofNums (list(atoi(substr (cdr(assoc 1(entget(ssname roof count)))) 6 2)))))
				(setq roofPoints (append roofPoints (list(cdr(assoc 10(entget(ssname roof count)))))))
				(setq count (+ count 1))
			)
		)
		
		(setq count 0)
		
		;(setvar "clayer" "Defpoints")
		(setvar "osmode" 0)
		
		(while
			(< count (sslength roof))
			(progn
				(setq 
					count (+ 1 count)
					ref (searchList (apply 'min roofnums) roofnums)
					attNum count
					attPoint (nth ref roofPoints)
				)
				(setq roofNums (subst 99 (apply 'min roofnums) roofnums))
				(command "insert" blk attPoint "" "" "" attNum)
			)
		)
		
		(setvar "clayer" curLay)
		(setvar "osmode" curSnap)
		(setvar "cmdecho" curEcho)
		(setvar "attdia" curAtt)
		
	)




	(setq path (strcat (getvar "dwgprefix") "sketch.dwg"))
	(if
		(findfile path)
		(progn
			(command "-insert" path "6320,14815" "" "" "")
			(command "explode" "last")
			(roofMarkers)
			
			
			
			
			
			
			; CUSTOMIZE LAYERS TO DELETE HERE
			
			(if(tblsearch "layer" "google_earth_snapshot")(command "-laydel" "name" "google_earth_snapshot" "" "yes"))
			(if(tblsearch "layer" "google_earth_terrain")(command "-laydel" "name" "google_earth_terrain" "" "yes"))
			(if(tblsearch "layer" "tx_array_names")(command "-laydel" "name" "tx_array_names" "" "yes"))
			(if(tblsearch "layer" "tx_face_names")(command "-laydel" "name" "tx_face_names" "" "yes"))
			(if(tblsearch "layer" "tx_instance_percentages")(command "-laydel" "name" "tx_instance_percentages" "" "yes"))
			
			
			
			
			
			
			(command "zoom" "extents")
			
			
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((0 . "polyline"))))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((0 . "circle"))))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((0 . "arc"))))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((0 . "line") (8 . "0"))))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "x" '((2 . "Group_1"))))
			(if(not(= sel nil))(command "erase" sel ""))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((0 . "polyline"))))
			(if(not(= sel nil))(command "erase" sel ""))
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((8 . "1"))))
			(command "chprop" sel "" "color" "green" "")	
			
			(setq sel (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) '((8 . "2"))))
			(command "chprop" sel "" "color" "Magenta" "")
	
		)
	)
	(setvar "cmdecho" curEcho)
	(princ)
)




































(defun setProps()
	(vl-load-com)
	(defun getCellsFunction(fileName sheetName cellName / myXL myBook mySheet myRange cellValue)
		(setq myXL(vlax-get-or-create-object "Excel.Application"))
		(vla-put-visible myXL :vlax-false)
		(vlax-put-property myXL 'DisplayAlerts :vlax-false)
		(setq myBook (vl-catch-all-apply 'vla-open (list (vlax-get-property myXL "WorkBooks") fileName)))
		(setq mySheet (vl-catch-all-apply 'vlax-get-property (list (vlax-get-property myBook "Sheets") "Item" sheetName)))
		(vlax-invoke-method mySheet "Activate")
		(setq myRange (vlax-get-property (vlax-get-property mySheet 'Cells) "Range" cellName))
		(setq cellValue(vlax-variant-value (vlax-get-property myRange 'Value2)))
		(vl-catch-all-apply 'vlax-invoke-method (list myBook "Close"))
		(vl-catch-all-apply 'vlax-invoke-method (list myXL "Quit"))
		(if (not (vlax-object-released-p myRange))(progn(vlax-release-object myRange)(setq myRange nil)))
		(if (not (vlax-object-released-p mySheet))(progn(vlax-release-object mySheet)(setq mySheet nil)))
		(if (not (vlax-object-released-p myBook))(progn(vlax-release-object myBook)(setq myBook nil)))
		(if (not (vlax-object-released-p myXL))(progn(vlax-release-object myXL)(setq myXL nil)))    
		(if(= 'safearray (type cellValue))
		  (progn
			(setq tempCellValue(vlax-safearray->list cellValue))
			(setq cellValue(list))
			(if(= (length tempCellValue) 1)
			  (progn
				(foreach a tempCellValue
				  (if(= (type a) 'LIST)
					(progn
					  (foreach b a
						(if(= (type b) 'LIST)
						  (setq cellValue(append cellValue (list (vlax-variant-value (car b)))))
						  (setq cellValue(append cellValue (list (vlax-variant-value b))))
						)
					  )
					)
					(setq cellValue(append cellValue (list (vlax-variant-value a))))
				  )
				)
			  )
			  (progn
				(foreach a tempCellValue
				  (setq tmpList(list))
				  (foreach b a
					(setq tmp(vlax-variant-value b))
					(setq tmpList(append tmpList (list tmp)))
				  )
				  (setq cellValue(append cellValue tmpList))
				)
			  )
			)
		  )
		)
		cellValue
	  )
	(defun _dwgru-dwgprops-set-custom-prop (key value Doc / si) 
	;;, Create in the properties of the figure (team _dwgprops bookmark OTHER) 
	;;; Property with key and value value 
	;;; If the property was not, it is created, otherwise the changes 
	;;; Key - a string property name (tab OTHER) 
	;;; Value - a string  - value of property 
	;;; Uses the library 
	;;; _dwgru-Dwgprops-get-custom-prop 
	;;; Doc - a pointer to the document, nil - the current 
	;;; Returns - nil 
	;;; Example 
	;;; (_dwgru-dwgprops-set-custom-prop "dwgru" "dwgru-dwgprops-set-custom-prop" nil) 

	   (or Doc 
	   (setq Doc (vla-Get-ActiveDocument (vlax-Get-Acad-Object))) 
		 ) 
	   (setq si (vla-Get-SummaryInfo Doc)) 
	   (if (_dwgru-dwgprops-get-custom-prop key Doc) 
		 (vla-SetCustomByKey si key value) 
		 (vla-AddCustomInfo si key value) 
	   ) 
	) 

	
	(setq setRange(getCellsFunction (strcat (getvar "dwgprefix") "Prelim Calculator.xlsm") "Report" "W31:W35"))			
	(_dwgru-dwgprops-set-custom-prop "systemSize" (nth 3 setRange) nil)
	(_dwgru-dwgprops-set-custom-prop "moduleCount" (nth 1 setRange) nil)
	(_dwgru-dwgprops-set-custom-prop "moduleWatts" (nth 0 setRange) nil)
	(_dwgru-dwgprops-set-custom-prop "maxSystemSize" (nth 4 setRange) nil)
	(_dwgru-dwgprops-set-custom-prop "maxModuleCount" (nth 2 setRange) nil)
			
	(command "regen")
	(princ)	
)























;(command "autopublish" "location" "C:\\Users\\MattBirckbichler\\Desktop\\New Predesign Stuff")
(defun c:spin( / *error*)
	(defun *error* (msg)
		(setvar "osmode" oldsnap)
		(setvar "cmdecho" oldecho)
	)

	(command "undo" "begin")
	(setq house (ssget "c" '(5709.42 15090.9 0.0) '(7898.73 14084.5 0.0) ))
	(command "zoom" "object" house "")
	(setq 
		oldsnap(getvar "osmode")
		oldecho(getvar "cmdecho")
	
		pnt1 (getpoint "\nSelect First Point: ")
		pnt2 (getpoint "\nSelect Second Point: ")
		compass (ssget "x" '((8 . "NORTH ARROW")))	
		compassBase (cdr(assoc 10 (entget(ssname compass 0))))
		compassHome '(5620.39 14757.1 0.0)
	)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	(progn
		(command "rotate" house compass "" pnt1 "r" pnt1 pnt2 pause)
		(setq compassBase (cdr(assoc 10 (entget(ssname compass 0)))))
		(command "move" compass "" compassBase compassHome)		
	)	
	(progn
		(setq 
			roofBlocks (ssget "x" '((2 . "RoofNums")))
			count 0
		)
		(load "radianDegree")
		(while (< count (sslength roofBlocks))
			(progn
				(setq 
					blk (ssname roofBlocks count)
					blkList (entget blk)
					blkBasePoint (cdr(assoc 10 blklist))
					blkRadian (cdr(assoc 50 blklist))
					blkDegree (* (rtd blkRadian) -1)
					count (+ count 1)
				)
				(command "rotate" blk "" blkBasePoint blkDegree)
			)
		)
	)
	
	
	
	(setvar "osmode" oldsnap)
	(setvar "cmdecho" oldecho)
	(command "undo" "end")
)




(defun c:trimRoof()
	(setq selection (ssget))
	(if (= (getvar "clayer") "0")
		(command "-layer" "off" "0" "yes" "")
		(command "-layer" "off" "0" "")
	)
	(command "-vports" "2" "v")
	(setvar "cvport" 3)
	(command "zoom" "object" selection "")
	(setvar "cvport" 2)
	(command "-view" "_SEISO")
	(command "zoom" "object" selection "")
)
(defun c:trimEnd()
	(command "-layer" "on" "0" "")
	(command "-vports" "single")
)








;
(if
	(= (getvar "useri1") 5)
	(if
		(findfile
			(strcat (getvar "dwgprefix") "sketch.dwg")
		)
		(progn
			(setProps)
			(cleansketch)
			(vl-load-com)
			(vl-file-delete (strcat (getvar "dwgprefix") "sketch.dwg"))
			(setvar "useri1" 0)
		)
	)
)