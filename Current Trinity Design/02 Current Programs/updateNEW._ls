(load "getcellsfunction")
(load "dwgProp")
(defun c:NEWupdate()
	(setq 

	  
		template 
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"SMALL TABLES" 
				"D88"
			)
		deleteString
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"SMALL TABLES" 
				"D89"
			)
		servAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B3"
			)	
		discoAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B2"
			)	
		overcurrentProtection
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B1"
			)	
		inv1
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B6"
			)	
		inv2
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B7"
			)	
		inv3
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B8"
			)	
		inv4
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B9"
			)	
		inv5
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B10"
			)	
		micro1
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B11"
			)	
		micro2
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B12"
			)	
		micro3
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B13"
			)	
		micro4
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B14"
			)	
		micro5
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B15"
			)	
		subpanelAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B5"
			)
		racking
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"B25"
			)
		state
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"E14"
			)
		moduleType
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"B2"
			)
		inverterType
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
				"FORM"
				"B6"
			)
		microType
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
				"FORM"
				"F6"
			)
	);setq
	(_dwgru-dwgprops-set-custom-prop "01 serviceAmperage" servAmp nil)
	(_dwgru-dwgprops-set-custom-prop "02 discoAmperage" discoAmp nil)
	(_dwgru-dwgprops-set-custom-prop "03 overcurruntProtection" overcurrentProtection nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv1" inv1 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv2" inv2 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv3" inv3 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv4" inv4 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv5" inv5 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro1" micro1 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro2" micro2 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro3" micro3 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro4" micro4 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro5" micro5 nil)
	(_dwgru-dwgprops-set-custom-prop "05 subpanelAmperage" subpanelAmp nil)
	
	(COND;RACKING
	  
	  ((= racking "ECOLIBRIUM");FOR ECOLIBRIUM
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
		(repeat (setq i (sslength s))
		(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "ECOLIBRIUM")
  
		)
		)
		)
	   );ECOLIBRIUM
	  
	  ((and; FOR UNIRAC
	       (= racking "OTHER")
	       (or
		    (= state "NY")
		    (= state "NJ")
		    (= state "MD")
		    (= state "PA")
		)
	       
	   )
	   
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
		(repeat (setq i (sslength s))
		(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "UNIRAC")
  
		)
		)
		)
	   );UNIRAC
	  
	  ((and; FOR SNAP N RACK
	   	(= racking "OTHER")
	   	(or
		  	(= state "CT")
			(= state "MA")
			(= state "RI")
		)
	   )
	   
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
			(repeat (setq i (sslength s))
			(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "SNAP N RACK")
  
			)
			)
			)
		);SNAP N RACK
	  
	  (t (alert "racking problem"));ELSE YOU HAVE A PROBLEM
	  
  	);COND RACKING

  	(cond;MODULES

	  (;FOR HANWHA
	   (or
	   	(= moduleType "HANWHA 300 (HLS72P6-PB-1-300)")
	   	(= moduleType "HANWHA 295 (Q.PEAK-BLK G4.1 295)")
		(= moduleType "HANWHA 290 (Q.PEAK-BLK G4.1 290)")
		(= moduleType "HANWHA 285 (Q.PEAK-BLK G4.1 285)")
	   )
	   (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "HANWAH Q. PEAK")
  
			)
			)
			)
	  );HANWHA

	  (;FOR TRINA 290
	     	(= moduleType "TRINA 290 (TSM-290 DD05A.05)")
	   		(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
				(repeat (setq i (sslength s))
				(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
				(LM:SetVisibilityState g "TRINA 290 DD (ALL MAX)")
  
				)
				)
			)
	  );TRINA 290

	  (;FOR TRINA 295
	   (= moduleType "TRINA 295 (TSM-295 DD05A.05)")
	   (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "TRINA 295 (HONEY PLUS)")
  
			)
			)
			)
	  );TRINA 295

	  (;FOR RECOM 290
	   (= moduleType "RECOM 290 (RCM-290-6MB)")
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "RECOM")
  
			)
			)
			)
	   );RECOM 290

	  (;FOR JINKO
	   (or
	     (= moduleType "JINKO 280 (JKM280M-60B)")
	     (= moduleType "JINKO 285 (JKM285M-60B)")
	     (= moduleType "JINKO 290 (JKM290M-60B)")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "JINCO")
  
			)
			)
			)
	  );JINKO
	  
	);cond MODULES


  	(cond;INVERTERS START

	  (;FOR SOLAR EDGE HD WAVE
	   (or
	     (= inverterType "SE3000H-US")
	     (= inverterType "SE3800H-US")
	     (= inverterType "SE5000H-US")
	     (= inverterType "SE6000H-US")
	     (= inverterType "SE7600H-US")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "SOLAR EDGE (HD WAVE)")
  
			)
			)
			)
	 );SOLAR EDGE HD WAVE

	 (;FOR SOLAR EDGE STANDARD
	  (or
	    (= inverterType "SE3000A-US")
	    (= inverterType "SE3800A-US")
	    (= inverterType "SE5000A-US")
	    (= inverterType "SE6000A-US")
	    (= inverterType "SE7600A-US")
	    (= inverterType "SE10000A-US")
	    (= inverterType "SE11400A-US")
	  )
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "SOLAR EDGE (STANDARD)")
  
			)
			)
			)
	);SOLAR EDGE STANDARD

	(;FOR MICROINVERTERS
	 (or
	   (= microType "IQ6 MICROINVERTERS")
	   (= microType "IQ6PLUS MICROINVERTERS")
	 )
	 	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "ENPHASE MICRO")
  
			)
			)
			)
	);MICROINVERTERS

	);cond INVERTERS END
	;(command "datalinkupdate" "u" "k")
	(princ)
	
)
(defun LM:SetVisibilityState ( blk val / vis )
    (if
        (and
            (setq vis "Visibility1")
            (member (strcase val) (mapcar 'strcase (LM:getdynpropallowedvalues blk vis)))
        )
        (LM:setdynpropvalue blk vis val)
    )
)
(defun LM:setdynpropvalue ( blk prp val )
    (setq prp (strcase prp))
    (vl-some
       '(lambda ( x )
            (if (= prp (strcase (vla-get-propertyname x)))
                (progn
                    (vla-put-value x (vlax-make-variant val (vlax-variant-type (vla-get-value x))))
                    (cond (val) (t))
                )
            )
        )
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)
(defun LM:getdynpropallowedvalues ( blk prp )
    (setq prp (strcase prp))
    (vl-some '(lambda ( x ) (if (= prp (strcase (vla-get-propertyname x))) (vlax-get x 'allowedvalues)))
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)