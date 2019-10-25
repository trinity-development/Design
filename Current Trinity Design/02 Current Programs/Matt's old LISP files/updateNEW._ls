(load "getcellsfunction")
(load "dwgProp")
(defun c:update()
	(setq 

	  	moduleType
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc tempate.xlsx")
				"FORM"
				"B2"
			)
		state
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc tempate.xlsx")
				"FORM"
				"E12"
			)
		racking
		 	(getcellsfunction
			  	(strcat (getvar 'dwgprefix) "acad calc tempate.xlsx")
				"FORM"
				"B21"
			)
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
	
	(if (= racking "ECOLIBRIUM")
	  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFRANCED)"))))
(repeat (setq i (sslength s))
(if  (= "001 DYNAMIC RACKING BLOCK (REFRANCED)"  (strcase (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
(LM:SetVisibilityState g "ECOLIBRIUM")
  
)
)
)
	  )
  	
	(command "datalinkupdate" "u" "k")
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