(vl-load-com)
(defun c:protoQB()
  (dictremove (namedobjdict) "RSARoofModules")
  (dictremove (namedobjdict) "RSARoofPitch")
  (dictremove (namedobjdict) "RSARoofOrientation")

  (setq;current snapshot roof dictionaries
    	RSAModuleSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  
  	RSAPitchSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  
  	RSAOrientationSnapshot
	 (entmakex
	   	   (list
			(cons 0 "DICTIONARY")
                        (cons 100 "AcDbDictionary")
		   )
	 )
  )

  (setq;make current roof dictionaries
    	currentModuleDictionary
	 (dictadd
	   (namedobjdict)
	   "RSARoofModules"
	   RSAModuleSnapshot
	 )
	
  	currentPitchDictionary
	 (dictadd
	   (namedobjdict)
	   "RSARoofPitch"
	   RSAPitchSnapshot
	 )
  
  	currentOrientationDictionary
	 (dictadd
	   (namedobjdict)
	   "RSARoofOrientation"
	   RSAOrientationSnapshot
	 )
  )
);end defun