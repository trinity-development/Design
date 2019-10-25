
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
(defun c:appschecknew()

(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
;;;  ;----------------REVISION LIST SHEET CHOICE-----------------------------;
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


;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;------------------------GET THE ORIGINAL INFO--------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
  (setvar "tilemode" 1)
  (command "zoom" "extents" "")
  (c:chromic5)
(COMMAND "UPDATEAPPSNOW")
(setq	revnum; get last revision number from the FORM page in Excel
    		(getcellsfunction
	 		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
	 		"FORM"
	 		"C29"
		)
  )
(setq	revtag; get last revision number from the FORM page in Excel
    		(getcellsfunction
	 		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
	 		"CALCULATIONS"
	 		"R9"
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
		)
	      )
	    )
  )

  (setq ElectricalList (vlax-make-safearray vlax-vbstring '(0 . 11)))
(setq ElectricalList (getcellsfunction;get RACKING number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat  currRev (itoa 46) ":" currRev (itoa 56))
		)
      )
(setq
  	Module1 (vlax-safearray-get-element ElectricalList 1)

	Inverter1 (vlax-safearray-get-element ElectricalList 2)

	Interconnection1 (vlax-safearray-get-element ElectricalList 3)

	Disconnect1 (vlax-safearray-get-element ElectricalList 4)

	Production1 (vlax-safearray-get-element ElectricalList 5)

	Unfused1 (vlax-safearray-get-element ElectricalList 6)
;;;	Module1 (getcellsfunction;get module number for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat  currRev (itoa 47))
;;;		)
;;;	Inverter1 (getcellsfunction;get INVERTER number for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 48))
;;;		)
;;;	Interconnection1 (getcellsfunction;get INTERCONNECTION for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 49))
;;;		)
;;; 	Disconnect1 (getcellsfunction;get DISCONNECT for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 50))
;;;		)
;;;	Production1 (getcellsfunction;get PRODUCTION for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 51))
;;;		)
;;;	Unfused1 (getcellsfunction;get UNFUSED for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 52))
;;;		)
;;;	OCPD1 (getcellsfunction;get FUSEDAMP for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 53))
;;;		)
;;;        systemsizeDC1 (getcellsfunction;get FUSEDAMP for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 54))
;;;		)
;;;        systemsizeAC1 (getcellsfunction;get FUSEDAMP for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 55))
;;;		)
;;;        totalmodules1 (getcellsfunction;get FUSEDAMP for last revision sent to township
;;;		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
;;;		 	"REVISION LIST"
;;;			(strcat currRev (itoa 56))
;;;		)


;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;------------------------GET THE CURRENT INFO---------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
;-----------------------------------------------------------------------;
  (foreach n numlist1;go through 1-5
	  (foreach k revlist;go through P, R, A
	    (if (= revtag (strcat k n));if revision number from Excel is equal to current guessed revision number
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
		(setq originalRev (nth (+ (- (atoi n) 1) count) revalphalist));get the nth element in the revision list array
		)
	      )
	    )
  )
  (setq Racking2 (getcellsfunction;get RACKING number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat  originalRev (itoa 46))
		)
	Module2 (getcellsfunction;get module number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat  originalRev (itoa 47))
		)
	Inverter2 (getcellsfunction;get INVERTER number for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 48))
		)
	Interconnection2 (getcellsfunction;get INTERCONNECTION for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 49))
		)
 	Disconnect2 (getcellsfunction;get DISCONNECT for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 50))
		)
	Production2 (getcellsfunction;get PRODUCTION for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 51))
		)
	Unfused2 (getcellsfunction;get UNFUSED for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 52))
		)
	OCPD2 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 53))
		)
        systemsizeDC2 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 54))
		)
        systemsizeAC2 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 55))
		)
        totalmodules2 (getcellsfunction;get FUSEDAMP for last revision sent to township
		  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		 	"REVISION LIST"
			(strcat originalRev (itoa 56))
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
	(= Interconnection2 "Tap Box")
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
	(= Interconnection1 "Tap Box")
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
	(setq electricaltxt (strcat electricaltxt "\n-change point of interconnection from " Interconnection1 " to " Interconnection2))
	)
      )
    )
  )
( (and
    (or
      (= Interconnection1 "Main Breaker Subpanel")
      (= Interconnection1 "Main Lug Subpanel")
      (= Interconnection1 "Service Disconnect")
      (= Interconnection1 "Line Taps")
      (= Interconnection1 "Breaker")
    )
    (= Interconnection2 "Tap Box")
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
;-------------------------CHECK OCPD AMPERAGE CHANGE-------------------;
;----------------------------------------------------------------------;
  (if
    
      (> OCPD1  OCPD2)
      
    
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
      (< OCPD1 OCPD2)
      
    
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
 (setq buildingtxt2 (snapcountnew))
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


(defun snapcountnew()
  (setq arrlist (vlax-make-safearray vlax-vbstring '(0 . 40))
	roofArray '()
	buildingtxt1 " "
  )
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))));MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (vlax-safearray-fill arrlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
		  "21" "22" "23" "24" "25" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40"))
;------------------------------------------------------------------------------------------------------;
;-----------------------------BEGIN MODULE COMPARISON--------------------------------------------------;
;------------------------------------------------------------------------------------------------------;
	(setq j 0)
      (while
	    (<= j (vlax-safearray-get-u-bound arrlist 1))
	  
		(setq currentContractModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" (strcat "Roof" (vlax-safearray-get-element arrlist j) "S"))))
		(setq revContractModuleNum (vl-catch-all-apply 'vlax-ldata-get (list "revisionRoofModules" (strcat "Roof" (vlax-safearray-get-element arrlist j) "MRS"))))
			(if
			  (and
			    (= (vl-catch-all-apply 'numberp (list (atoi currentContractModuleNum))) T)
			    (= (vl-catch-all-apply 'numberp (list (atoi revContractModuleNum))) T)
			  )
	      			(progn;execute
			  		(if (= (atoi currentContractModuleNum) (atoi revContractModuleNum))
					  (princ )
					  (if (> (atoi revContractModuleNum) (atoi currentContractModuleNum))
					    (progn
					    	(setq diff(abs(-(atoi revContractModuleNum) (atoi currentContractModuleNum))))
					    	;(alert (strcat "(( "(itoa diff) "more modules on " k "))"))
					        (setq buildingtxt1 (strcat buildingtxt1 "\n-removed " (itoa diff) " modules from " (strcat "Roof" " " (vlax-safearray-get-element arrlist j))))
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
					      (setq diff(abs(-(atoi revContractModuleNum) (atoi currentContractModuleNum))))
					      ;(alert (strcat "(( "(itoa diff) "less modules on " k "))"))
					      (setq buildingtxt1 (strcat buildingtxt1 "\n-added " (itoa diff) " modules to " (strcat "Roof" " " (vlax-safearray-get-element arrlist j))))
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
				  
	      			)
	      			(progn;if the current DWGPROPS key is not equal to the current orientation variable
	        			(princ)
	      			)
	     		);end if
		  	
			(setq j (+ j 1))
	      	);end if
  
;------------------------------------------------------------------------------------------------------;
;-----------------------------END MODULE COMPARISON----------------------------------------------------;
;------------------------------------------------------------------------------------------------------;

buildingtxt1
  )