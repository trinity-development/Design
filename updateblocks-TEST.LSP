;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-------------GETS PARAMETERS FROM EXCEL AND CHANGES THE DYNAMIC BLOCKS-------;
;-------------TO SPECIFIC VISIBILITY STATES BASED ON EXCEL INPUTS-------------;
;-----------------------------------------------------------------------------;
;-----------------------------------------------------------------------------;
;-----MADE BY TAMIR LIEBER----------------------------------------------------;
;-----------------------------------------------------------------------------;

(load "getcellsfunction")
(defun c:UPDATEBLOCKSTEST()
  (setq start (getvar "MILLISECS"))
  
  ;Find extension Start
  	(setq Extension
	       (findfile
		(strcat (getvar 'dwgprefix) "ACAD CALC TEMPLATE.xlsm")
      	       )

	)
 (if (/= Extension nil);if extension is not equal to nil
	(if (= Extension (strcat (getvar 'dwgprefix) "ACAD CALC TEMPLATE.xlsm"))
	  (setq Extension ".xlsm")
	  (setq Extension ".xlsx")
	)
   (progn;false statement start
     (setq Extension ".xlsx")
   )
   
  )
;Find extension end
  
  (setq
    		Fpartner 
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"FORM" 
				"B18"
			)
		racking
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"FORM" 
				"B25"
			)
		state
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"FORM" 
				"E14"
			)
		moduleType
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"FORM" 
				"B2"
			)
		inverterType
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"B6"
			)
		microType
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"F6"
			)
		Circuit4
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"I10"
			)
		LinetapBreaker
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"E13"
			)
    		Permitset
     			(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"D31"
			)
    		Revision1
     			(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"D30"
			)
    		Revision2
     			(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"D29"
			)
    		Revision3
     			(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)
				"FORM"
				"D28"
			)
    		microinverters
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"CALCULATIONS" 
				"I43"
				)
		ahj
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc template" Extension)			
				"FORM" 
				"B28"
				)
	);setq
  (COND;RACKING
	  
	  ((= racking "ECOLIBRIUM");FOR ECOLIBRIUM
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
		(repeat (setq i (sslength s))
		(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		;(LM:SetVisibilityState g "ECOLIBRIUM")
  		(LM:SetVisibilityState g "UNIRAC SMF (RAILLESS)")
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
		    (= state "MA")
		    (= state "CT")
		    (= state "RI")
		    (= state "DE")
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
	  
;;;	  ((and; FOR SNAP N RACK
;;;	   	(= racking "OTHER")
;;;	   	(or
;;;		  	(= state "CT")
;;;			(= state "MA")
;;;			(= state "RI")
;;;		)
;;;	   )
;;;	   
;;;	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
;;;			(repeat (setq i (sslength s))
;;;			(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
;;;			(LM:SetVisibilityState g "SNAP N RACK")
;;;  
;;;			)
;;;			)
;;;			)
;;;		);SNAP N RACK
	  
	  (t (alert "racking problem"));ELSE YOU HAVE A PROBLEM
	  
  	);COND RACKING

  	(cond;production meter
	  (
	   (= state "MA")
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "PRODUCTIONMETER_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "P Meter Smart Program")
  
			)
			)
			)
	   )
	  )
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

	  (;FOR TRINA 300
	   (= moduleType "TRINA 300 (TSM-300 DD05A.05)")
	   (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "TRINIA 300W")
  
			)
			)
			)
	  );TRINA 300
	  
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

	  (;FOR HANWHA 300-320
	   (= moduleType "HANWHA 315 (Q.PEAK DUO BLK-G5 315)")
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "HANWHA Q. PEAK 300-320")
  
			)
			)
			)
	   );HANWHA 300-320
	  
	);cond MODULES


  	(cond;INVERTERS START

	  (;FOR SOLAR EDGE HD WAVE
	   (or
	     (= inverterType "SE3000H-US")
	     (= inverterType "SE3800H-US")
	     (= inverterType "SE5000H-US")
	     (= inverterType "SE6000H-US")
	     (= inverterType "SE7600H-US")
	     (= inverterType "SE10000H-US")
	     (= inverterType "SE11400H-US")
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

	(;FOR MICROINVERTERS 1-3 CIRCUITS
	 (and
	 	(or
	   		(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	 	)
		(= (numberp Circuit4) nil)
	 )
	 	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "ENPHASE MICRO (1-3 CKTS)")
  
			)
			)
			)
	);MICROINVERTERS 1-3 CIRCUITS

	(;FOR MICROINVERTERS 4+ CIRCUITS
	 (and
	   	(or
		  	(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	 	)
		(= (numberp Circuit4) t)
	 )
		(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "ENPHASE MICRO (4+ CKTS)")
  
			)
			)
			)
	 );MICROINVERTERS 4+ CIRCUITS

	 
	  
	);cond INVERTERS END

  	(cond ;LAYOUT EQUIPMENT START

	 (; MA SMART METER LINE TAPS
	  (and
	    (= state "MA")
	    (= LinetapBreaker "LINE TAPS")
	    (or
	      (/= microType "IQ6 MICROINVERTERS")
	      (/= microType "IQ6PLUS MICROINVERTERS")
	    )
	  )
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "STANDARD  -LT(MA)")
  
			)
			)
			)
	 )
	
	 (; MA SMART METER BREAKER
	  (and
	    (= state "MA")
	    (= LinetapBreaker "BREAKER")
	    (or
	      (/= microType "IQ6 MICROINVERTERS")
	      (/= microType "IQ6PLUS MICROINVERTERS")
	    )
	  )
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "STANDARD - BB(MA)")
  
			)
			)
			)
	 )
	 
	 (;MICRO LINETAP - UNFUSED
	   (and
	     (and
	       (or
		  	(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	       )
	       (or
		 	(= Fpartner "PPL Electric Utilities")
			(= Fpartner "Met-Ed FirstEnery Corp")
		 	(= state "CT")
			(= state "MA")
			(= state "MD")
			(= state "PA")
	       )
	     )
	       (= LinetapBreaker "LINE TAPS")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "MICRO - LT - UD")
  
			)
			)
			)
	  );MICRO LINETAP - UNFUSED
	 
	  (;MICRO BREAKER - UNFUSED
	   (and
	     (and
	       (or
		  	(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	       )
	       (or
		 	(= Fpartner "PPL Electric Utilities")
			(= Fpartner "Met-Ed FirstEnery Corp")
		 	(= state "CT")
			(= state "MA")
			(= state "MD")
			(= state "PA")
	       )
	     )
	       (= LinetapBreaker "BREAKER")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "MICRO - BB - UD")
  
			)
			)
			)
	 );MICRO BREAKER
	 
	  (;MICRO LINETAP
	   (and
	     (or
		  	(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	     )
	     (= LinetapBreaker "LINE TAPS")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "MICRO - LT")
  
			)
			)
			)
	  );MICRO LINETAP

	  (;MICRO BREAKER
	   (and
	     (or
		  	(= microType "IQ6 MICROINVERTERS")
	   		(= microType "IQ6PLUS MICROINVERTERS")
	     )
	     (= LinetapBreaker "BREAKER")
	   )
	   	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "MICRO - BB")
  
			)
			)
			)
	 );MICRO BREAKER
	
	 (;STANDARD LINE TAPS
	   (and
		  	(or
		  		(/= microType "IQ6 MICROINVERTERS")
	   			(/= microType "IQ6PLUS MICROINVERTERS")
	     		)
	     		(= LinetapBreaker "LINE TAPS")
	   )
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "STANDARD - LT")
  
			)
			)
			)
	 );STANDARD LINE TAP

	 (;STANDARD BREAKER
	     (and
		  	(or
		  		(/= microType "IQ6 MICROINVERTERS")
	   			(/= microType "IQ6PLUS MICROINVERTERS")
	     		)
	     		(= LinetapBreaker "BREAKER")
	     )
	  	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC EQUIPMENT BLOCK"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC EQUIPMENT BLOCK"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "STANDARD - BB")
  
			)
			)
			)
	  );STANDARD BREAKER

	  
	);LAYOUT EQUIPMENT END

  	(if
	  (and
	    (or
	      (= Fpartner "SUNRUN")
	      (= Fpartner "Sunrun")
	    )
	    (= microinverters "YES")
	  )

	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN(ENPHASE)"))))
			(repeat (setq i (sslength s))
			(if  (= "PRODUCTIONMETER_DYN(ENPHASE)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "P Meter")
  
			)
			)
			)
	  )

	;;;;;;;;3LINE CODE BLOCK;;;;;;;;;;;;;;;;
  	(if (or
	      (= state "MA")
	      (= state "CT")
	    )
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC CODE BLOCK 3 LINE"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC CODE BLOCK 3 LINE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "2017")
  
			)
			)
			)
	  )

  	(if
	  (= state "PA")
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,DYNAMIC CODE BLOCK 3 LINE"))))
			(repeat (setq i (sslength s))
			(if  (= "DYNAMIC CODE BLOCK 3 LINE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "2008")
  
			)
			)
			)
	  )


(setq end (getvar "MILLISECS"))
  (princ "\n")
  (princ " update blocks time ")
  (princ (itoa (- end start)))
  
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