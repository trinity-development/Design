(defun c:systemspecs()
  (setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))
  (defun mkdwgprop(key value / result)
    (vla-addcustominfo drawing key value)
  )
  (vl-catch-all-apply 'mkdwgprop (list "mainDisconnect" "0"))
  (command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE UNFUSED DISCONNECT BLOCK
			  (progn
				(if (or
				      (= (LM:getvisibilitystate g ) "Fused")
				      (= (LM:getvisibilitystate g ) "No Disconnect")
				    )
				  (vla-setcustombykey drawing "mainDisconnect" "Fused PV Disconnect")
				)
			  )
			)
		)
  )
)
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE UNFUSED DISCONNECT BLOCK
			  (progn
				(if 
				      (= (LM:getvisibilitystate g ) "Breaker")
				      
				    
				  (vla-setcustombykey drawing "mainDisconnect" "Breaker Enclosure")
				)
			  )
			)
		)
  )
)
(command "zoom" "previous" "")
(command "regen" "")
  )