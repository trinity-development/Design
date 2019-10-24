;-----------------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;
;--------------------------GETS ROOF DATA FROM THE "REVISION LIST" SHEET AND--------------------------------------------;
;---------------------------PLACES IT IN DWGPROPS-----------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;
;----------MADE BY TAMIR------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------------;
(load "getCellsFunction")
(vl-load-com)

(defun c:getsnaproofsnew()
    (setq start (getvar "MILLISECS"))
  (setq
    	  revOrientationarr (vlax-make-safearray vlax-vbstring '(0 . 40));make excel row array
	  revPitcharr (vlax-make-safearray vlax-vbstring '(0 . 40))
	  revModulearr (vlax-make-safearray vlax-vbstring '(0 . 40))
	  arrlist (vlax-make-safearray vlax-vbstring '(0 . 40))
	  revRoofarr (vlax-make-safearray vlax-vbstring '(0 . 40))
  )
    	(vlax-safearray-fill arrlist '("3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43"));list for EXCEL variables
  (setq numlist1 '("1" "2" "3" "4" "5")
	arrlist '("3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40" "41" "42" "43")
	alphalist '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O")
	revlist '("P" "R" "A")
	roofArray '()
  )
  (setq	revnum; get last revision number from the FORM page in Excel
    		(getcellsfunction
	 		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
	 		"FORM"
	 		"C29"
		)
  )
  
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  ;"RSARoofModules"
  
  (setq revalphalist '(
		        ("A" "B" "C" "D"); P1
		       	("E" "F" "G" "H"); P2
		       	("I" "J" "K" "L"); P3
		       	("M" "N" "O" "P"); P4
		       	("Q" "R" "S" "T"); P5
		       	("U" "V" "W" "X"); R1
		       	("Y" "Z" "AA" "AB"); R2
		       	("AC" "AD" "AE" "AF"); R3
		       	("AG" "AH" "AI" "AJ"); R4
		       	("AK" "AL" "AM" "AN"); R5
		       	("AO" "AP" "AQ" "AR"); A1
		       	("AS" "AT" "AU" "AV"); A2
		       	("AW" "AX" "AY" "AZ"); A3
		       	("BA" "BB" "BC" "BD"); A4
		       	("BE" "BF" "BG" "BH"); A5
		       			 )
  )
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;--------------------------------------------------GET MODULE LAST REVISION START----------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
	;------------------------------------------------------------------------------------------------------------------------------------------------------;
  	(foreach n numlist1;go through 1-5
	  (foreach k revlist;go through P, R, A
	    (if (= revnum (strcat k n));if revision number from Excel is equal to current guessed revision number
	      
		(progn
		(cond
		  ((= k "P")
		  	(setq count 0));if it's a permit set, count is 0
		  ((= k "R")
		  	(setq count 5));if it's a revison, count is 5
		  ((= k "A")
		  	(setq count 10));if it's an as built, count is 10
		  (t )
		)
		  (setq currRev (nth (+ (- (atoi n) 1) count) revalphalist));get the nth element in the revision list array
			(vlax-safearray-fill revRoofarr (vl-catch-all-apply 'getcellsfunction;get module number for last revision sent to township
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (car currRev) "3:" (car currRev) "43")
		      			     )
			  )
			(vlax-safearray-fill revModulearr (vl-catch-all-apply 'getcellsfunction;get module number for last revision sent to township
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (cadr currRev) "3:" (cadr currRev) "43")
		      			     )
			  )
			(vlax-safearray-fill revPitcharr (vl-catch-all-apply 'getcellsfunction;get module number for last revision sent to township
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (caddr currRev) "3:" (caddr currRev) "43")
		      			     )
			  )
			(vlax-safearray-fill  revOrientationarr (vl-catch-all-apply 'getcellsfunction;get module number for last revision sent to township
		  				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 				"REVISION LIST"
						(strcat (caddr(cdr currRev)) "3:" (caddr(cdr currRev)) "43")
		      			     )
			  )
		(setq n 0)
		(while 
			(< n (vlax-safearray-get-u-bound revModulearr 1))
		  		(setq currentrevModuleCheck (vlax-safearray-get-element revModulearr n))
		  		(setq currentrevRoofCheck (vlax-safearray-get-element revRoofarr n))
		  		(if
				  (= (vl-catch-all-apply 'numberp (list (atoi currentrevModuleCheck))) T)
				  	(vlax-ldata-put "revisionRoofModules" currentrevRoofCheck currentrevModuleCheck)
				  	(princ)
				  )
		  	(setq n (+ 1 n))
		  )