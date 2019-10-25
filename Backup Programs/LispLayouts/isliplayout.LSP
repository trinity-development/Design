(defun c:isliplayout()
	
(vl-load-com)

	
	

	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY ISLIP TEMPLATE.dwt" "COVER")
	;(command "-layout" "Rename" "Layout1-COVER" "COVER")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY ISLIP TEMPLATE.dwt" "LAYOUT")
	;(command "-layout" "Rename" "Layout2-LAYOUT" "LAYOUT" "")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY ISLIP TEMPLATE.dwt" "DETAIL")
	;(command "-layout" "Rename" "Layout3-DETAIL" "DETAIL") 
	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY ISLIP TEMPLATE.dwt" "3-LINE")
	;(command "-layout" "Rename" "Layout4-3-LINE" "")  



  (vl-load-com)
	(setq tabs
		(vla-get-Layouts
			(vla-get-Activedocument (vlax-get-acad-object)
			)
		)
	)
	(setq pos1 
		(vla-get-TabOrder (vla-item tabs "COVER")
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
	(vla-put-TabOrder (vla-item tabs "COVER") pos2)
  
	(setq pos3
		(vla-get-TabOrder (vla-item tabs "LAYOUT")
		)
  	      pos1
	       	(vla-get-TabOrder (vla-item tabs "COVER")
	     	)
	)
  	(if 
		(> pos3 pos1) ;;Then
			(setq pos1 (1+ pos1)
		)
	)
	(vla-put-TabOrder (vla-item tabs "LAYOUT") pos1)

  	(setq pos4
		(vla-get-TabOrder (vla-item tabs "DETAIL")
		)
  	      pos3
	       	(vla-get-TabOrder (vla-item tabs "LAYOUT")
	     	)
	)
  	(if 
		(> pos4 pos3) ;;Then
			(setq pos3 (1+ pos3)
		)
	)
	(vla-put-TabOrder (vla-item tabs "DETAIL") pos3)

	(setq pos5
		(vla-get-TabOrder (vla-item tabs "3-LINE")
		)
  	      pos4
	       	(vla-get-TabOrder (vla-item tabs "DETAIL")
	     	)
	)
  	(if 
		(> pos5 pos4) ;;Then
			(setq pos4 (1+ pos4)
		)
	)
	(vla-put-TabOrder (vla-item tabs "3-LINE") pos4)

	
  
	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\ISLIP LAYOUT" "2229.0625,15535.8125,0.0" "" "" "" 
		"_.explode" (entlast) "" 
	)
  	
)