(defun c:pgeorgelayout()
	
(vl-load-com)

	
	

	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\PRINCE GEORGE TEMPLATE.dwt" "COVER SHEET")
	(command "-layout" "Rename" "Layout1-COVER SHEET" "COVER SHEET")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\PRINCE GEORGE TEMPLATE.dwt" "PLOT PLAN")
	(command "-layout" "Rename" "Layout2-PLOT PLAN" "PLOT PLAN" "")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\PRINCE GEORGE TEMPLATE.dwt" "ROOF LAYOUT")
	(command "-layout" "Rename" "Layout3-ROOF LAYOUT" "ROOF LAYOUT") 
	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\PRINCE GEORGE TEMPLATE.dwt" "STRUCTURAL")
	(command "-layout" "Rename" "Layout4-STRUCTURAL" "STRUCTURAL") 
	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\PRINCE GEORGE TEMPLATE.dwt" "3-LINE")
	(command "-layout" "Rename" "Layout5-3-LINE" "3-LINE") 



  (vl-load-com)
	(setq tabs
		(vla-get-Layouts
			(vla-get-Activedocument (vlax-get-acad-object)
			)
		)
	)
	(setq pos1 
		(vla-get-TabOrder (vla-item tabs "COVER SHEET")
		)
	      pos2 
		(vla-get-TabOrder (vla-item tabs "Model")
		)
	      	
	)
  	(if 
		(> pos1 pos2) ;;Then
			(setq pos2 (1+ pos2)
		)
	)
	(vla-put-TabOrder (vla-item tabs "COVER SHEET") pos2)
  
	(setq pos3
		(vla-get-TabOrder (vla-item tabs "PLOT PLAN")
		)
  	      pos1
	       	(vla-get-TabOrder (vla-item tabs "COVER SHEET")
	     	)
	)
  	(if 
		(> pos3 pos1) ;;Then
			(setq pos1 (1+ pos1)
		)
	)
	(vla-put-TabOrder (vla-item tabs "PLOT PLAN") pos1)

  	(setq pos4
		(vla-get-TabOrder (vla-item tabs "ROOF LAYOUT")
		)
  	      pos3
	       	(vla-get-TabOrder (vla-item tabs "PLOT PLAN")
	     	)
	)
  	(if 
		(> pos4 pos3) ;;Then
			(setq pos3 (1+ pos3)
		)
	)
	(vla-put-TabOrder (vla-item tabs "ROOF LAYOUT") pos3)

	(setq pos5
		(vla-get-TabOrder (vla-item tabs "STRUCTURAL")
		)
  	      pos4
	       	(vla-get-TabOrder (vla-item tabs "ROOF LAYOUT")
	     	)
	)
  	(if 
		(> pos5 pos4) ;;Then
			(setq pos4 (1+ pos4)
		)
	)
	(vla-put-TabOrder (vla-item tabs "STRUCTURAL") pos4)

	(setq pos6
		(vla-get-TabOrder (vla-item tabs "3-LINE")
		)
  	      pos5
	       	(vla-get-TabOrder (vla-item tabs "STRUCTURAL")
	     	)
	)
  	(if 
		(> pos6 pos5) ;;Then
			(setq pos5 (1+ pos5)
		)
	)
	(vla-put-TabOrder (vla-item tabs "3-LINE") pos5)
  
	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\PRINCE GEORGE LAYOUT" "2229.0625,15535.8125,0.0" "" "" "" 
		"_.explode" (entlast) "" 
	)
  	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\PRINCE GEORGE STRUCTURAL" "5085.25,16522.5625,0.0" "" "" "" 
		"_.explode" (entlast) "" 
	)
)