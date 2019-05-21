(defun c:getcellstest()
      (load "getCellsFunction")
      (setq newvar (vl-catch-all-apply 'getcellsfunction  (list;get information from 
					(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
					"CALCULATIONS" 
					"E120:E160"
					)
		    		)
       )	
  )