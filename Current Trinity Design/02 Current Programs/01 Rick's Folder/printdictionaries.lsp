;This function prints dictionaries
(vl-load-com)
(defun c:printdictionaries()
  (setq modelspaceroofdictionaries "")
  (setq currentroofdictionaries "")
  (setq revisionroofdictionaries "")
  (setq
    	roofnumberarr '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
			"21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40")

  )

  
  ;print module count
  (foreach number roofnumberarr
	(setq rfmodnum (strcat "Roof" number "S"))   ;set variable rfmodnum to "roof (number from array) S"
    	;(alert rfmodnum)
	(setq roofmod (vlax-ldata-get "currentRoofModules" rfmodnum))
    	;(alert roofmod)
    	(setq rforinum (strcat "Roof" number "OS"))   ;set variable rfmodnum to "roof (number from array) S"
	(setq roofori (vlax-ldata-get "currentRoofOrientation" rforinum))ro
	(setq rfpitchnum (strcat "Roof" number "PS"))   ;set variable rfmodnum to "roof (number from array) S"
	(setq roofpitch (vlax-ldata-get "currentRoofPitch" rfpitchnum))
	(setq currentroofdictionaries (strcat currentroofdictionaries rfmodnum ": " roofmod "     " rforinum ": " roofori "     " rfpitchnum ": " roofpitch "\n"))
  )
  (setq currentroofdictionaries (strcat "CURRENT ROOF DICTIONARIES" "\n\n" currentroofdictionaries))
  (alert currentroofdictionaries)
  ;(princ currentroofdictionaries)
)

;;;  
;;;  ;printrooforientation
;;;  (foreach number roofnumberarr
;;;	(setq rforinum (strcat "Roof" number "OS"))   ;set variable rfmodnum to "roof (number from array) S"
;;;	(setq roofori (vlax-ldata-get "currentRoofOrientation" rforinum))
;;;	(setq currentroofdictionaries (strcat currentroofdictionaries rforinum ": " roofori "\n"))
;;;	;(alert roofori)
;;;  )
;;;  (alert currentroofdictionaries)
;;;)