
;-----------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;
;------------------------GETS VISIBILITY STATES FROM DYNAMIC BLOCKS AND PLACES THAT INFO--------------------------;
;-------------------------IN EXCEL FOR THE CURRENT REVISION TAG IN THE "REVISION LIST" SHEET----------------------;
;-------------------------COMPARES CURRENT REVISION STATES TO PREVIOUS SATES SENT TO TOWNSHIP---------------------;
;-----------------------------------------------------------------------------------------------------------------;
;------MADE BY TAMIR LIEBER---------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;

(load "getCellsFunction")
(vl-load-com)
(defun c:appscheck()

(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  ;----------------REVISION LIST SHEET CHOICE-----------------------------;
  (setq revalphalist '(
		        "B"; P1
		       	"F"; P2
		       	"J"; P3
		       	"N"; P4
		       	"R"; P5
		       	"V"; R1
		       	"Z"; R2
		       	"AD"; R3
		       	"AH"; R4
		       	"AL"; R5
		       	"AP"; A1
		       	"AT"; A2
		       	"AX"; A3
		       	"BB"; A4
		       	"BF"; A5
		      )
	numlist1 '("1" "2" "3" "4" "5")
	revlist '("P" "R" "A")
  )
;----------------------------------------------------------------------;
;-------------------------GET RACKING VISIBILITY STATE-----------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
		(repeat (setq i (sslength s))
			(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Racking2 (LM:getvisibilitystate g ))
  				(vla-setcustombykey drawing "currEquipment" Racking2)
			    	(command "-vbarun" "Module2.updateapps")
			  )
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET MODULE VISIBILITY STATE------------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
		(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Module2 (LM:getvisibilitystate g ))
  				(vla-setcustombykey drawing "currEquipment" Module2)
			    	(command  "-vbarun" "Module2.updateapps")
			  )
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET INVERTER VISIBILITY STATE----------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
		(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Inverter2 (LM:getvisibilitystate g ))
			    	;(alert Inverter1)
  				(vla-setcustombykey drawing "currEquipment" Inverter2)
			    	(command  "-vbarun" "Module2.updateapps")
			  )
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET INTERCONNECTION VISIBILITY STATE---------;
;----------------------------------------------------------------------;
(command "zoom" "extents" "")
(setq Interconnection2 "")
(if 
      (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,INTERCONNECTION_DYN"))));CHECK 3LINE WINDOW
  (progn
    (setq Interconnection2 "")
		(repeat (setq i (sslength s))
		  (if  (= "INTERCONNECTION_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
  				(setq Interconnection2 (LM:getvisibilitystate g ))
			  )
	
		  )
		)
    (if (= Interconnection2 "")
      (progn
	(command "zoom" "previous" "")
		(alert "Please create a block for Interconnection")
		(setq inter (getstring "Please describe Interconnection without spaces\n"))
		;(if (setq s (ssget "x" (list (cons 0 "insert")(cons 2 "INTERCONNECTION_DYN_NEW"))))
;;;		  (progn
;;;		    (command "explode" s "")
;;;			(setq blknm "INTERCONNECTION_DYN_NEW")
;;;			(setq selectionset (ssget))
;;;			(setq insertionpoint (list 6530.3125 17097.25 0))
;;;		    	(command "-purge" "Blocks" blknm "No")
;;;			(command "_.-Block" blknm insertionpoint selectionset "");make the new block with the name as the roof number
;;;			(command "_.-insert" blknm insertionpoint "" "" "")
;;;			(setq Interconnection2 inter)
;;;		  )
;;;		  (progn
;;;		    (setq blknm "INTERCONNECTION_DYN_NEW")
;;;			(setq selectionset (ssget))
;;;			(setq insertionpoint (list 6530.3125 17097.25 0))
;;;		    	
;;;			(command "_.-Block" blknm insertionpoint selectionset "");make the new block with the name as the roof number
;;;			(command "_.-insert" blknm insertionpoint "" "" "")
;;;			(setq Interconnection2 inter)
;;;		  )
		
	)
  
  )
    )
)

(vla-setcustombykey drawing "currEquipment" Interconnection2)
(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET DISCONNECT VISIBILITY STATE--------------;
;----------------------------------------------------------------------;
(command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))))
  (progn
    (setq Disconnect2 "")
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
  				(setq Disconnect2 (LM:getvisibilitystate g ))
			  )
			)
		)
    	(if (= Disconnect2 "")
      		(progn
				(setq Disconnect2 " ")		
		)
        )
    )
)
(command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Disconnect2)
(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET PRODUCTION METER VISIBILITY STATE--------;
;----------------------------------------------------------------------;
  (command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))))
  (progn
    (setq Production2 "")
		(repeat (setq i (sslength s))
			(if  (= "PRODUCTIONMETER_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Production2 (LM:getvisibilitystate g ))
			  )
			)
		)
    (if (= Production2 "")
      		(progn
				(setq Production2 " ")	
		)
        )
  )
)
  (command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Production2)
			    	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET UNFUSED VISIBILITY STATE-----------------;
;----------------------------------------------------------------------;
  (command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,NONFUSEDDISCONNECT_DYN"))))
  (progn
    (setq Unfused2 "")
		(repeat (setq i (sslength s))
			(if  (= "NONFUSEDDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Unfused2 (LM:getvisibilitystate g ))	
			  )
			)
		)
    (if (= Unfused2 "")
      		(progn
				(setq Unfused2 " ")	
		)
        )
 )
)
  (command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Unfused2)
			    	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET FUSED AMPERAGE---------------------------;
;----------------------------------------------------------------------;
  (progn
    (setq OCPD2 "")
    (vla-getcustombykey drawing "03 overcurruntProtection" 'OCPD)
    (setq OCPD2 OCPD)
    (if (= OCPD2 "")
      		(progn
			(setq OCPD2 " ")	
		)
        )
 )
(vla-setcustombykey drawing "currEquipment" OCPD2)
  (command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;--------------------------------SYSTEMSIZEDC--------------------------;
;----------------------------------------------------------------------;
(setq systemsizeDC2
	(getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"CALCULATIONS"
		"B34"
	)
)
      (vla-setcustombykey drawing "currEquipment" systemsizeDC2)
	(command  "-vbarun" "Module2.updateapps")

;----------------------------------------------------------------------;
;--------------------------------SYSTEMSIZEAC--------------------------;
;----------------------------------------------------------------------;
(setq systemsizeAC2
       (+ (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"M32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"N32"
	  )
      	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"O32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"P32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"Q32"
	  )
	)
)
  (vla-setcustombykey drawing "currEquipment" systemsizeAC2)
	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;--------------------------------TOTAL MODULES-------------------------;
;----------------------------------------------------------------------;
(setq totalmodules2
       (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"CALCULATIONS"
		"B12"
	)
)
  (vla-setcustombykey drawing "currEquipment" totalmodules2)
	(command  "-vbarun" "Module2.updateapps")

;----------------------------------------------------------------------;
;--------------------------------DONE----------------------------------;
;----------------------------------------------------------------------;
	(progn
	  (command  "-vbarun" "Module2.newrev")
  	)
(setq	revnum; get last revision number from the FORM page in Excel
    		(getcellsfunction
	 		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
	 		"FORM"
	 		"C29"
		)
  )
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
(setq Racking1 (getcellsfunction;get RACKING number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat  currRev (itoa 46))
		)
	Module1 (getcellsfunction;get module number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat  currRev (itoa 47))
		)
	Inverter1 (getcellsfunction;get INVERTER number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 48))
		)
	Interconnection1 (getcellsfunction;get INTERCONNECTION for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 49))
		)
 	Disconnect1 (getcellsfunction;get DISCONNECT for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 50))
		)
	Production1 (getcellsfunction;get PRODUCTION for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 51))
		)
	Unfused1 (getcellsfunction;get UNFUSED for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 52))
		)
	OCPD1 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 53))
		)
        systemsizeDC1 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 54))
		)
        systemsizeAC1 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 55))
		)
        totalmodules1 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat currRev (itoa 56))
		)
)
		)
	      )
	    )
  )
  (setq buildingtxt " ")
  (setq electricaltxt " ")
;----------------------------------------------------------------------;
;-------------------------CHECK RACKING CHANGE-------------------------;
;----------------------------------------------------------------------;
  (if (/= Racking1 Racking2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_RACKING"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_RACKING"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq buildingtxt (strcat buildingtxt "\n-Change racking from " Racking1 " to " Racking2))
	
	)
      )
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK MODULE CHANGE--------------------------;
;----------------------------------------------------------------------;
  (if (/= Module1 Module2)
    (progn
      (alert (strcat "Module change from " Module1 " to " Module2))
      (setq electricaltxt (strcat electricaltxt "\n-Module change from " Module1 " to " Module2))
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK INVERTER CHANGE------------------------;
;----------------------------------------------------------------------;
(if (/= Inverter1 Inverter2)
    (progn
      (alert (strcat "Inverter change from " Inverter1 " to " Inverter2))
      (setq electricaltxt (strcat electricaltxt "\n-Inverter change from " Inverter1 " to " Inverter2))
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK INTERCONNECTION CHANGE-----------------;
;----------------------------------------------------------------------;
(cond ((and
      (or
	(= Interconnection1 "Breaker")
	(= Interconnection1 "Main Breaker Subpanel")
	(= Interconnection1 "Main Lug Subpanel")
      )
      (or
	(= Interconnection2 "Line Taps")
	(= Interconnection2 "Service Disconnect")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_METHOD_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_METHOD_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change method of interconnection from breaker to line tap"))

	)
      )
    )
  )

  ( (and
      (or
	(= Interconnection1 "Line Taps")
	(= Interconnection1 "Service Disconnect")
      )
      (or
	(= Interconnection2 "Breaker")
	(= Interconnection2 "Main Breaker Subpanel")
	(= Interconnection2 "Main Lug Subpanel")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_METHOD_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_METHOD_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change method of interconnection from line tap to breaker"))
	)
      )
    )
  )
      (t (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_METHOD_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	
	(alert "Check Interconnection Method")
	
	)
      )
    )
       )
      )

(cond ((and
      (or
	(= Interconnection1 "Line Taps")
	(= Interconnection1 "Breaker")
      )
      (or
	
	(= Interconnection2 "Service Disconnect")
	(= Interconnection2 "Main Breaker Subpanel")
	(= Interconnection2 "Main Lug Subpanel")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_POINT_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_POINT_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change point of interconnection from main service panel to " Interconnection2))
	)
      )
    )
  )
( (and
      (or
	(= Interconnection1 "Service Disconnect")
      )
      (or
	(= Interconnection2 "Main Breaker Subpanel")
	(= Interconnection2 "Main Lug Subpanel")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_POINT_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_POINT_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change point of interconnection from " Interconnection1 " to " Interconnection2))
	)
      )
    )
  )
( (and
      (or
	(= Interconnection1 "Main Breaker Subpanel")
	(= Interconnection1 "Main Lug Subpanel")
      )
      (or
	(= Interconnection2 "Line Taps")
	(= Interconnection2 "Breaker")

      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_POINT_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_POINT_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change point of interconnection from " Interconnection1 " to main service panel"))
	)
      )
    )
  )
( (and
      (or
	(= Interconnection1 "Main Breaker Subpanel")
	(= Interconnection1 "Main Lug Subpanel")
      )
      (= Interconnection2 "Service Disconnect") 
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_POINT_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_CHANGE_POINT_OF_INTERCONNECTION"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));IF THE BLOCK IS NAMED "_CHANGE_METHOF_OF_INTERCONNECTION"
			(LM:SetVisibilityState g "CHECKED");CHANGE VISIBILITY TO "CHECKED"
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-change point of interconnection from " Interconnection2 " to " Interconnection2))
	)
      )
    )
  )
      (t (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_CHANGE_POINT_OF_INTERCONNECTION"))));LOOK THROUGH ALL BLOCKS IN THE DRAWING AND CHECK IF THEY HAVE THE NAME "_CHANGE_METHOD_OF_INTERCONNECTION"
	(progn
	
	(alert "Check Point of Interconnection")
	
	)
      )
    )
   )
      )
;----------------------------------------------------------------------;
;-------------------------CHECK DISCONNECT CHANGE----------------------;
;----------------------------------------------------------------------;
(if (and
      (or
	(= Disconnect1 "No Disconnect")
      )
      (or
	(= Disconnect2 "Fused")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_AMP_FUSED_DISCONNECT"))))
	(repeat (setq i (sslength s))
		(if  (= "_ADD_AMP_FUSED_DISCONNECT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
(if (and
      (or
	(= Disconnect1 "Fused")
      )
      (or
	(= Disconnect2 "No Disconnect")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REMOVE_FUSED_DISCONNECT"))))
	(repeat (setq i (sslength s))
		(if  (= "_REMOVE_FUSED_DISCONNECT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
(if (and
      (or
	(= Disconnect1 "Fused")
	(= Disconnect1 "No Disconnect")
      )
      (or
	(= Disconnect2 "Breaker")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_BREAKER_ENCLOSURE"))))
	(repeat (setq i (sslength s))
		(if  (= "_ADD_BREAKER_ENCLOSURE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK PRODUCTION METER CHANGE----------------;
;----------------------------------------------------------------------;
(if (and
      (or
	(= Production1 "P Meter")
      )
      (or
	(= Production2 "No P Meter")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REMOVE_PRODUCTION_METER"))))
	(repeat (setq i (sslength s))
		(if  (= "_REMOVE_PRODUCTION_METER"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
(if (and
      (or
	(= Production1 "No P Meter")
      )
      (or
	(= Production2 "P Meter")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_PRODUCTION_METER"))))
	(repeat (setq i (sslength s))
		(if  (= "_ADD_PRODUCTION_METER"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK UNFUSED CHANGE-------------------------;
;----------------------------------------------------------------------;
(if (and
      (or
	
	(= Unfused1 "NOT NEEDED")
      )
      (or
	(= Unfused2 "NEEDED")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_UNFUSED_DISCONNECT"))))
	(repeat (setq i (sslength s))
		(if  (= "_ADD_UNFUSED_DISCONNECT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )

(if (and
      (or
	(= Unfused1 "IF NEEDED")
	(= Unfused1 "NEEDED")
      )
      (or
	(= Unfused2 "NOT NEEDED")
      )
    )
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REMOVE_UNFUSED_DISCONNECT"))))
	(repeat (setq i (sslength s))
		(if  (= "_REMOVE_UNFUSED_DISCONNECT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
      )
    )
  )
;----------------------------------------------------------------------;
;-------------------------CHECK OCPD AMPERAGE CHANGE------------------;
;----------------------------------------------------------------------;
  (if
    
      (> OCPD1 (atoi OCPD2))
      
    
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_DECREASE_FUSE_SIZE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_DECREASE_FUSE_SIZE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-decrease OCPD from " (itoa (fix OCPD1)) "A" " to " OCPD2 "A"))
	)
      )
    )
  )
(if 
      (< OCPD1 (atoi OCPD2))
      
    
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_INCREASE_FUSE_SIZE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_INCREASE_FUSE_SIZE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-increase OCPD from " (itoa (fix OCPD1)) "A" " to " OCPD2 "A"))
	)
      )
    )
  )

;----------------------------------------------------------------------;
;-------------------------CHECK SYSTEM SIZE DC-------------------------;
;----------------------------------------------------------------------;
  (if (> systemsizeDC1  systemsizeDC2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_SYSTEM_SIZE_DECREASE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_SYSTEM_SIZE_DECREASE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-DC system size decrease from " (itoa (fix systemsizeDC1) ) "W" " to " (itoa (fix systemsizeDC2)) "W"))
	)
      )
     )
   )
  (if (< systemsizeDC1 systemsizeDC2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_SYSTEM_SIZE_INCREASE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_SYSTEM_SIZE_INCREASE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-DC system size increase from " (itoa(fix systemsizeDC1)) "W" " to " (itoa (fix systemsizeDC2)) "W"))
	)
      )
     )
    )
;----------------------------------------------------------------------;
;-------------------------CHECK SYSTEM SIZE AC-------------------------;
;----------------------------------------------------------------------;
   (if (> systemsizeAC1 systemsizeAC2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_INVERTER_SIZE_DECREASE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_INVERTER_SIZE_DECREASE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-AC system size decrease from " (itoa (fix systemsizeAC1)) "W" " to " (itoa (fix systemsizeAC2)) "W"))
	)
      )
     )
   )
  (if (< systemsizeAC1 systemsizeAC2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_INVERTER_SIZE_INCREASE"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_INVERTER_SIZE_INCREASE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq electricaltxt (strcat electricaltxt "\n-AC system size increase from " (itoa (fix systemsizeAC1)) "W" " to " (itoa (fix systemsizeAC2)) "W"))
	)
      )
     )
    )

;----------------------------------------------------------------------;
;-------------------------CHECK TOTAL MODULES--------------------------;
;----------------------------------------------------------------------;
   (if (> totalmodules1 totalmodules2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REMOVE_PANELS"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_REMOVE_PANELS"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq buildingtxt (strcat buildingtxt "\n-removed " (itoa (fix (abs (- totalmodules1 totalmodules2)))) " modules from system"))
	)
      )
     )
   )
  (if (< totalmodules1 totalmodules2)
    (progn
      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_ADD_PANELS"))))
	(progn
	(repeat (setq i (sslength s))
		(if  (= "_ADD_PANELS"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "CHECKED")
		)
	)
	(setq buildingtxt (strcat buildingtxt "\n-added " (itoa (fix (abs (- totalmodules1 totalmodules2)))) " modules to system"))
	)
      )
     )
    )
 (setq buildingtxt2 (snapcount))
  (if
    (and
	(/= buildingtxt2 " ")
	(= totalmodules1 totalmodules2)
    )
    	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_RELOCATING_PANELS"))))
		(progn
		(repeat (setq i (sslength s))
			(if  (= "_RELOCATING_PANELS"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
				(LM:SetVisibilityState g "CHECKED")
			)
		)
		)
      	)
  )
  (progn
    (setq modelspace (vla-get-modelspace(vla-get-activedocument(vlax-get-acad-object))))
    (setq pt (vlax-3d-point 1190.875 22370.875 0));point to place roof schedule

    (setq buildingtxt (strcase (strcat buildingtxt buildingtxt2)))
    (setq buildingtxtobj (vla-addmtext modelspace pt 400 buildingtxt));add roof schedule text to model space
    (vla-put-height buildingtxtobj 12);change height
    (vla-put-layer buildingtxtobj "0");change layer
    (vla-put-color buildingtxtobj acByLayer);change color
    )
  (progn
    (setq modelspace (vla-get-modelspace(vla-get-activedocument(vlax-get-acad-object))))
    (setq pt (vlax-3d-point 1190.875 22143.875 0));point to place roof schedule

    (setq electricaltxt (strcase electricaltxt))
    (setq electricaltxtobj (vla-addmtext modelspace pt 400 electricaltxt));add roof schedule text to model space
    (vla-put-height electricaltxtobj 12);change height
    (vla-put-layer electricaltxtobj "0");change layer
    (vla-put-color electricaltxtobj acByLayer);change color
    )
);defun

  
  (defun LM:getvisibilitystate ( blk )
    (LM:getdynpropvalue blk "Visibility1")
)
(defun LM:getdynpropvalue ( blk prp )
    (setq prp (strcase prp))
    (vl-some '(lambda ( x ) (if (= prp (strcase (vla-get-propertyname x))) (vlax-get x 'value)))
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)

  ;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;------------------------------COMPARES THE REVISION SNAPSHOT ROOF DATA TO THE CURRENT ROOF DATA-----------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;
;-----------MADE BY TAMIR----------------------------------------------------------------------------------------------------;
;----------------------------------------------------------------------------------------------------------------------------;


(defun snapcount()
  (setq arrlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40")
	roofArray '()
	buildingtxt1 " "
  )
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (foreach n arrlist
   ; (alert n)
    (setq keycount1 0)
    (setq revtypebinary 0)
  	(while;do until
	   (and;both
	    (< keycount1 (vla-numcustominfo drawing));go through the whole DWGPROPS until the last key
	    (= revtypebinary 0);the pitch binary variable is not equal to 0
	   )
	
	  (vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount1
	      'tempkeyname1
	      'tempkeyvalue1
	    )
	  	
	  	(if (= tempkeyname1 (strcat "Roof" n))
		  
		  (progn
		    	
		  	(setq roofArray(cons (strcat "Roof" n) roofArray))
		    	(setq keycount1 0)
		    	(setq revtypebinary 1)
		  )
		  (setq keycount1 (+ keycount1 1))
		)
	  )
    	
    )

;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN MODULE COMPARISON--------------------------------------------------;
;------------------------------------------------------------------------------------------------------;
    (foreach k roofArray
      (setq revbinary 0)
      (setq keycount2 0)
      (while
	(and
	  (< keycount2 (vla-numcustominfo drawing))
	  (= revbinary 0)
	)
	(vla-getcustombyindex;get current numbered index from DWGPROPS
	      drawing
	      keycount2
	      'tempkeyname2
	      'tempkeyvalue2
	    )
		;(alert "hello")
		(if (= (+ keycount2 1) (vla-numcustominfo drawing));if this is the last key
	    	(if (= "MRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "S") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ )
					  (if (> (atoi modrevsnap) (atoi modsales))
					    (progn
					    	(setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    	;(alert (strcat "(( "(itoa diff) "more modules on " k "))"))
					        (setq buildingtxt1 (strcat buildingtxt1 "\n-removed " (itoa diff) " modules from " k))
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					    (progn
					      (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					      ;(alert (strcat "(( "(itoa diff) "less modules on " k "))"))
					      (setq buildingtxt1 (strcat buildingtxt1 "\n-added " (itoa diff) " modules to " k))
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					   )
					  )
				  (setq revbinary 1)
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(setq revbinary 1)
	      			)
	     		);end if
		  	(setq revbinary 1)
	      	);end if
		;if this is not the last key
		(if (= "MRS" (substr tempkeyname2 (- (strlen tempkeyname2) 2)));if the current key is a Salesforce orientation
	    		(if (= tempkeyname2 (strcat k "MRS"));if the current DWGPROPS key is equal to the current orientation variable
	      			(progn;execute
	      				(vla-getcustombykey drawing tempkeyname2 'modrevsnap);delete current DWGPROPS key
  					(vla-getcustombykey drawing (strcat k "S") 'modsales)
			  		(if (= modrevsnap modsales)
					  (princ )
					  (if (> (atoi modrevsnap) (atoi modsales))
					    (progn
					    	(setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					    	;(alert (strcat "(( "(itoa diff) "more modules on " k "))"))
					        (setq buildingtxt1 (strcat buildingtxt1 "\n-removed " (itoa diff) " modules from " k))
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					    (progn
					      (setq diff(abs(-(atoi modrevsnap) (atoi modsales))))
					      ;(alert (strcat "(( "(itoa diff) "less modules on " k "))"))
					      (setq buildingtxt1 (strcat buildingtxt1 "\n-added " (itoa diff) " modules to " k))
					      (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,_REVISED_LAYOUT"))))
						(progn
						(repeat (setq i (sslength s))
							(if  (= "_REVISED_LAYOUT"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
								(LM:SetVisibilityState g "CHECKED")
							)
						)
						)
      					      )
					    )
					   )
					  )
					
				  (setq revbinary 1)
	      			)
	      			
	     		);end if
	      	);end if
	       )
		(setq keycount2 (+ keycount2 1))
	);end while
      );end foreach
  
;------------------------------------------------------------------------------------------------------;
;-----------------------------END MODULE COMPARISON----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

buildingtxt1
  )