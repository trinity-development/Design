(load "getcellsfunction")

  (defun c:testnow()
  		(setq
		  Fpartner 
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"CALCULATIONS" 
				"B16"
			)
		  racking
			(getCellsFunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"B25"
			)
		 )
 (if
	  (and; FOR UNIRAC
	       (= racking "OTHER")
	       (or
		    (= state "NY")
		    (= state "NJ")
		    (= state "MD")
		    (= state "PA")
		)
	       
	   )
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,solarMainDisconnect_Dyn"))))
		(repeat (setq i (sslength s))
		(if  (= "solarMainDisconnect_Dyn"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
		(LM:SetVisibilityState g "Breaker")
  
		)
		)
		)
	  (PRINC)
	)
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