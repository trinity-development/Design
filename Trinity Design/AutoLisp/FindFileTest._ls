(defun c:findfilenow()
  (if (findfile
	(strcat (getvar 'dwgprefix) "ACAD CALC TEMPLATE.xlsm")
      )

    	(setq Extension ".xlsx")
    	;(setq Extention ".xlsx")
  )

  (alert Extension)
)
