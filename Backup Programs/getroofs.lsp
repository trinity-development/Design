;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------GETS ROOF PARAMETERS FROM EXCEL AND THEN PUTS-------------------;
;---------------THE NUMBER OF MODULES, PITCH AND ORIENTATION------------------;
;--------------INTO DWGPROPS WITH THE SYSTEM BUILDER VALUES-------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(load "getCellsFunction.lsp")
(defun c:getroofs ()
  (setq start (getvar "MILLISECS"))
  (setq
    Orientationarr (vlax-make-safearray vlax-vbstring '(0 . 40))        ;make excel row array
    Pitcharr (vlax-make-safearray vlax-vbstring '(0 . 40))
    Modulearr (vlax-make-safearray vlax-vbstring '(0 . 40))
    alphalist (vlax-make-safearray vlax-vbstring '(0 . 40))

    i 0
    arrayElement 0
  )
;;;	(vlax-safearray-fill cellarr '("120" "121" "122" "123" "124" "125" "126" "127" "128" "129" "130" "131" "132" "133" "134" "135" "136" "137" "138" "139" "140" "141" "142" "143" "144" "145"
;;;		    "146" "147" "148" "149" "150" "151" "152" "153" "154" "155" "156" "157" "158" "159" "160"));LIST OF ROWS TO TAKE IN EXCEL
  (vlax-safearray-fill alphalist '( "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "AA" "AB" "AC" "AD" "AE" "AF" "AG" "AH"
                                    "AI" "AJ" "AK" "AL" "AM" "AN" "AO"  ;list for EXCEL variables
                                  )
  )

  (vlax-safearray-fill Modulearr
                       (vl-catch-all-apply 'getcellsfunction (list;get information from 
                                                                       (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                                                       "CALCULATIONS"
                                                                       "E120:E160"
                                                             )
                       )
  )
  (vlax-safearray-fill Pitcharr
                       (vl-catch-all-apply 'getcellsfunction (list;get information from
                                                                       (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                                                       "CALCULATIONS"
                                                                       "F120:F160"
                                                             )
                       )
  )
  (vlax-safearray-fill Orientationarr
                       (vl-catch-all-apply 'getcellsfunction (list;get information from
                                                                       (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                                                       "CALCULATIONS"
                                                                       "G120:G160"
                                                             )
                       )
  )



  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))     ;MUST HAVE FOR PERFOMING DWGPROPS MANIPULATION
  (setq alphalist (vlax-make-safearray vlax-vbstring '(0 . 40)));make an array of 40 open values
  (vlax-safearray-fill alphalist '( "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "AA" "AB" "AC" "AD" "AE" "AF"
                                    "AG" "AH" "AI" "AJ" "AK" "AL" "AM" "AN" "AO"           ;list for Excel variables
                                  )
  )

  ;;;;;;;;;;;;;;;start orientation;;;;;;;;;;;;;;;;;;;;

  (setq n 0)
  (setq alphaElement 0)
  (setq orientationcount 0)
  (setq OrientationNumarr (vlax-make-safearray vlax-vbstring '(0 . 40)))
  (vlax-safearray-fill OrientationNumarr (vl-catch-all-apply 'getcellsfunction (list
                                                                                 (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                                                                 "CURRENT EXCEL ROOFS"
                                                                                 "N3:N43"  ;orientation number on that roof
                                                                               )
                                         )
  )
  (while
    	(and
           	(< n (vlax-safearray-get-u-bound Orientationarr 1));while the current index of the orientation array is less than the last index of the array
           	(/= alphaElement nil)
        )
    	(setq orientationbinary1 0)

    	(while;do while conditions are met
              	(= orientationbinary1 0)  ;the pitch binary variable is equal to 0
              	(setq currentOrientationCheck (vlax-safearray-get-element Orientationarr n));get the current element in the Calculations sheet array
              	(setq currentOrientationNum (vlax-safearray-get-element OrientationNumarr n));get the current element in the current excel roofs sheet array
              	;(alert currentOrientationCheck)
              	;(alert currentOrientationNum)

      		(if
        		(and
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" currentOrientationCheck)) currentOrientationNum);check to see if the 
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofOrientation" currentOrientationCheck)) nil);check if the current roof key value isn't empty
          			(= (vl-catch-all-apply 'numberp (list (atoi currentOrientationNum))) T);check if the orientation value is a number
        		)
        		(progn;execute
          			(vlax-ldata-put "currentRoofOrientation" currentOrientationCheck currentOrientationNum);place the key and value in the currentRoofOrientation 
          			(setq orientationbinary1 1)   ;move on to next Salesforce orientation
        		)  ;end progn
        		(progn
          			(setq orientationbinary1 1)
        		)
      		)   ;end if
    	)      ;end while
    	(setq orientationcount (+ orientationcount 1))  ;next cell in Excel Template for orientation number
    	(setq alphaElement currentOrientationCheck)
    	(setq n (+ n 1));move on to the next index in the dictionaries
  )  ;endwhile

  ;;;;;;;;;;;;;;;;;;;;;;;;;end Salesforce orientation to DWG PROPS;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;start Salesforce pitch to DWG Props;;;;;;;;;;;;

  (setq n 0)
  (setq alphaElement 0)
  (setq pitchcount 0)
  (setq PitchNumarr (vlax-make-safearray vlax-vbstring '(0 . 40)))
  (vlax-safearray-fill PitchNumarr (getcellsfunction
                                     (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                     "CURRENT EXCEL ROOFS"
                                     "M3:M43"  ;orientation number on that roof
                                   )
  )

  (while
    	(and
           	(< n (vlax-safearray-get-u-bound Pitcharr 1))
           	(/= alphaElement nil)
        )
    	(setq keycount1 0
          	pitchbinary1 0
    	)
    	(while;do while
              	(= pitchbinary1 0)  ;the pitch binary variable is not equal to 0
              	(setq currentPitchCheck (vlax-safearray-get-element Pitcharr n))
              	(setq currentPitchNum (vlax-safearray-get-element PitchNumarr n))

	;(alert currentPitchCheck)
	;(alert (vlax-ldata-get "currentRoofPitch" currentPitchCheck))

      		(if
        		(and
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" currentPitchCheck)) currentPitchNum)
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofPitch" currentPitchCheck)) nil)
          			(= (vl-catch-all-apply 'numberp (list (atoi currentPitchNum))) T)
        		)
        		(progn;execute
          			(vlax-ldata-put "currentRoofPitch" currentPitchCheck currentPitchNum)
          			(setq pitchbinary1 1)   ;move on to next Salesforce pitch
        		)
        		(progn
          			(setq pitchbinary1 1)
        		)
      		)  ;end if

    	)    ;end while
    	(setq pitchcount (+ pitchcount 1))  ;next cell in Excel Template for pitch number
    	(setq alphaElement currentPitchCheck)
    	(setq n (+ n 1))
  )  ;end while

  ;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE PITCH;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;BRING IN SALESFORCE ROOFS FROM EXCEL AND PLACE THEM IN DWGPROPS;;;;;;;;;;;;

  (setq n 0)
  (setq alphaElement 0)
  (setq modcount 0)
  (setq ModulesNumarr (vlax-make-safearray vlax-vbstring '(0 . 40)))
  (vlax-safearray-fill ModulesNumarr (vl-catch-all-apply 'getcellsfunction (list
                                                                             (strcat (getvar 'dwgprefix) "acad calc template.xlsx")
                                                                             "CURRENT EXCEL ROOFS"
                                                                             "L3:L43"  ;orientation number on that roof
                                                                           )
                                     )
  )
  (while;do while both conditions are met
    	(and
              	(< n (vlax-safearray-get-u-bound Modulearr 1))  ;the end of the alphalist array and
              	(/= alphaElement nil)
        )
    	(setq keycount 0
          	roofbinary 0
    	)
    	(while;do until
              	(= roofbinary 0)  ;the roof binary variable is not equal to 0
              	(setq currentModuleCheck (vlax-safearray-get-element Modulearr n))
              	(setq currentModuleNum (vlax-safearray-get-element ModulesNumarr n))
	  
      		(if
        		(and
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" currentModuleCheck)) currentModuleNum)
          			(/= (vl-catch-all-apply 'vlax-ldata-get (list "currentRoofModules" currentModuleCheck)) nil)
          			(= (vl-catch-all-apply 'numberp (list (atoi currentModuleNum))) T)
        		)
        		(progn;execute
          			(vlax-ldata-put "currentRoofModules" currentModuleCheck currentModuleNum)
          			(setq roofbinary 1)   ;move on to next Salesforce pitch
        		)
        		(progn
          			(setq roofbinary 1)
        		)
      		)  ;end if
    	)    ;end while
    	(setq modcount (+ modcount 1))  ;next cell in Excel Template for modules
    	(setq alphaElement currentModuleCheck)
    	(setq n (+ n 1))
  )  ;end while

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END BRING IN SALESFORCE ROOFS;;;;;;;;;;;;;;;;
  (princ (vlax-ldata-list "currentRoofModules"))
  (princ "\n")
  (princ (vlax-ldata-list "currentRoofPitch"))
  (princ "\n")
  (princ (vlax-ldata-list "currentRoofOrientation"))
  (princ "\n")
  (setq end (getvar "MILLISECS"))
  (princ (itoa (- end start)))
)