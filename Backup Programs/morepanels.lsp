(defun c:panels()
	(setq insertpanels (getpoint "\nCLICK WHERE YOU WANT YOUR PANELS"))
	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\PANELS" insertpanels "" "" "" 
		"_.explode" (entlast) "" 
	)

)