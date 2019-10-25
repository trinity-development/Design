(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))))
			(repeat (setq i (sslength s))
			(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Racking1 (LM:getvisibilitystate g ))
  				(alert Racking1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Module1 (LM:getvisibilitystate g ))
  				(alert Module1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
			(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Inverter1 (LM:getvisibilitystate g ))
  				(alert Inverter1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,INTERCONNECTION_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "INTERCONNECTION_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Interconnection1 (LM:getvisibilitystate g ))
  				(alert Interconnection1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Disconnect1 (LM:getvisibilitystate g ))
  				(alert Disconnect1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "PRODUCTIONMETER_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Production1 (LM:getvisibilitystate g ))
  				(alert Production1)
			    )
			)
			)
)

(if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,NONFUSEDDISCONNECT_DYN"))))
			(repeat (setq i (sslength s))
			(if  (= "NONFUSEDDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Unfused1 (LM:getvisibilitystate g ))
  				(alert Unfused1)
			    )
			)
			)
)






(defun LM:getvisibilitystate ( blk )
    (LM:getdynpropvalue blk "Visibility1")
)
(defun LM:getdynpropvalue ( blk prp )
    (setq prp (strcase prp))
    (vl-some '(lambda ( x ) (if (= prp (strcase (vla-get-propertyname x))) (vlax-get x 'value)))
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)