(defun c:makeroofs()
  (setq
    	numlist (vlax-make-safearray vlax-vbstring
	      		'(0 . 39)
	    	)
  )
  (vlax-safearray-fill
    	numlist '("1" "2" "3" "4" "5" "6" "7" "8" "9" "10" "11" "12" "13" "14" "15" "16" "17" "18" "19" "20"
	  	  "21" "22" "23" "24" "25" "26" "27" "28" "29" "30" "31" "32" "33" "34" "35" "36" "37" "38" "39" "40")
  )
  (dictremove (namedobjdict) "currentRoofModules")
  (dictremove (namedobjdict) "currentRoofPitch")
  (dictremove (namedobjdict) "currentRoofOrientation")
  (dictremove (namedobjdict) "revisionRoofModules")
  (dictremove (namedobjdict) "revisionRoofPitch")
  (dictremove (namedobjdict) "revisionRoofOrientation")
  (setq;current snapshot roof dictionaries
    	currentModuleSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  
  	currentPitchSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  
  	currentOrientationSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  );current dictionary end
  
  (setq;revision snapshot roof dictionaries
  	revisionModuleSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  
  	revisionPitchSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
	revisionOrientationSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  );revison dictionary end
  
  (setq;make current roof dictionaries
    	currentModuleDictionary
	 (dictadd
	   (namedobjdict)
	   "currentRoofModules"
	   currentModuleSnapshot
	 )
	
  	currentPitchDictionary
	 (dictadd
	   (namedobjdict)
	   "currentRoofPitch"
	   currentPitchSnapshot
	 )
  
  	currentOrientationDictionary
	 (dictadd
	   (namedobjdict)
	   "currentRoofOrientation"
	   currentOrientationSnapshot
	 )
  );end make current roof dictionaries

  (setq;make snapshot roof dictionaries
    	revisionModuleDictionary
	 (dictadd
	   (namedobjdict)
	   "revisionRoofModules"
	   revisionModuleSnapshot
	 )
	
  	revisionPitchDictionary
	 (dictadd
	   (namedobjdict)
	   "revisionRoofPitch"
	   revisionPitchSnapshot
	 )
  
  	revisionOrientationDictionary
	 (dictadd
	   (namedobjdict)
	   "revisionRoofOrientation"
	   revisionOrientationSnapshot
	 )
  );end make snapshot roof dictionaries

  (setq
	roofArrays '("currentRoofModules" "currentRoofPitch" "currentRoofOrientation" "revisionRoofModules" "revisionRoofPitch" "revisionRoofOrientation")
  )

  (foreach n roofArrays
    	(setq i 0)
  	(while
	  	(< i (+ (vlax-safearray-get-u-bound numlist 1) 1));from 1 to 40 (upperbound)
	  		(cond
			  	(;currentroofModules
				 	(= n "currentRoofModules");MAKE 40 EMPTY ROOF KEY VALUE PAIRS FOR CURRENT ROOF MODULES
				 		(vlax-ldata-delete;delete the roof key value pair exists
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "S");EXAMPLE: Delete Roof1S
						)
				 		(vlax-ldata-put;create the roof key value pair
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "S");EXAMPLE; Create Roof1S
							"NA"
						)
				)
				(;currentroofPitch
				 	(= n "currentRoofPitch");MAKE 40 EMPTY ROOF KEY VALUE PAIRS FOR CURRENT ROOF PITCHES
				 		
				 		(vlax-ldata-delete
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "PS")
						)
				 		(vlax-ldata-put
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "PS")
							"NA"
						)
				)
				(;currentroofOrientation
				 	(= n "currentRoofOrientation");MAKE 40 EMPTY ROOF KEY VALUE PAIRS FOR CURRENT ROOF ORIENTATIONS
				 		
				 		(vlax-ldata-delete
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "OS")
						)
				 		(vlax-ldata-put
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "OS")
							"NA"
						)
				)
				(;revisionRoofModules
				 	(= n "revisionRoofModules");MAKE 40 EMPTY ROOF KEY VALUE PAIRS FOR REVISION ROOF MODULES
				 		
				 		(vlax-ldata-delete;if it exists, delete it
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "MRS"); EXAMPLE: Roof1MRS
						)
				 		(vlax-ldata-put;create a new key value pair
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "MRS"); EXAMPLE: Roof1MRS
							"NA"
						)
				)
				(;revisionRoofPitch
				 	(= n "revisionRoofPitch");MAKE 40 EMPTY ROOF KEY VALUE PAIRS FOR REVISION ROOF MODULES
				 		
				 		(vlax-ldata-delete
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "PRS")
						)
				 		(vlax-ldata-put
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "PRS")
							"NA"
						)
				)
				(;revisionRoofOrientation
				 	(= n "revisionRoofOrientation")
				 		
				 		(vlax-ldata-delete
						  	n
						  	(strcat	"Roof" (vlax-safearray-get-element numlist i) "ORS")
						)
				 		(vlax-ldata-put
						  	n
							(strcat "Roof" (vlax-safearray-get-element numlist i) "ORS")
							"NA"
						)
				)
			);end cond
	  		(setq i (+ i 1))
	  );end while
    );end foreach
  );defun