(defun c:findfilenow()
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
  ;(alert Extension) ;Left for future testing / cleanup
)



;;;Rick's first ever attemp at Autolisp
;;;(defun c:findfilenow()
;;;  (if (findfile
;;;	(strcat (getvar 'dwgprefix) "ACAD CALC TEMPLATE.xlsx")
;;;      )
;;;
;;;    	(setq Extension ".xlsx")
;;;  )
;;;
;;;  (if (findfile
;;;	(strcat (getvar 'dwgprefix) "ACAD CALC TEMPLATE.xlsm")
;;;      )
;;;
;;;    	(setq Extension ".xlsm")
;;;  )
;;;  
;;;
;;;
;;;
;;;  
;;;  (alert Extension)
;;;)
;;;
;;;
;;;
;;;
;;;  
;;; 
;;;
