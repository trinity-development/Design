(load "getcellsfunction")
(defun c:3lineUpdate()
  (setq
    LinetapBreaker
	(getcellsfunction
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
			"FORM"
			"E13"
	)
    state
     	(getcellsfunction  
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
			"FORM" 
			"E14"
	)
    UDisco
     	(getcellsfunction  
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
			"SMALL TABLES" 
			"D79"
	)
  )
;INTERCONNECTION BLOCK
  (if (= LinetapBreaker "LINE TAPS")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INTERCONNECTION_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "INTERCONNECTION_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "Line Tap")
  
			)
			)
			)
    )
  (if (= LinetapBreaker "BREAKER")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INTERCONNECTION_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "INTERCONNECTION_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "Breaker")
  
			)
			)
			)
    )
  
;FUSED DISCONNECT BLOCK
  (if (= LinetapBreaker "LINE TAPS")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "Fused")
  
			)
			)
			)
    )
  (if (= LinetapBreaker "BREAKER")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "No Disconnect")
  
			)
			)
			)
    )
  
;PRODUCTION METER BLOCK
  (if (= state "MA")
	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))))
		(repeat (setq i (sslength s))
		(if  (= "PRODUCTIONMETER_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "P Meter Smart Program")
  
		)
		)
		)
    	(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))))
		(repeat (setq i (sslength s))
		(if  (= "PRODUCTIONMETER_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "No P Meter")
  
		)
		)
		)
  )

;UNFUSED DISCONNECT
  (if (= UDisco "UTILITY DISCONNECT")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,NONFUSEDDISCONNECT_DYN"))))
		(repeat (setq i (sslength s))
		(if  (= "NONFUSEDDISCONNECT_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "IF NEEDED")
  
		)
		)
		)
    )

  (if (= UDisco "NO UTILITY DISCONNECT")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,NONFUSEDDISCONNECT_DYN"))))
		(repeat (setq i (sslength s))
		(if  (= "NONFUSEDDISCONNECT_DYN"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "NOT NEEDED")
  
		)
		)
		)
    )
;PA GROUND WIRE
  (if (= state "PA")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PA_GROUND_WIRE"))))
			(repeat (setq i (sslength s))
			(if  (= "PA_GROUND_WIRE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "PA")
  
			)
			)
			)
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PA_GROUND_WIRE"))))
			(repeat (setq i (sslength s))
			(if  (= "PA_GROUND_WIRE"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			(LM:SetVisibilityState g "Standard")
  
			)
			)
			)
  )

;ELECTRIC PANEL CONDUIT DESCRIBER
  (if (UDisco "NO UTILITY DISCONNECT")
    (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,ALPHA_DESCRIBER"))))
		(repeat (setq i (sslength s))
		(if  (= "ALPHA_DESCRIBER"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "empty")
  
		)
		)
		)
    (princ )
   )
)