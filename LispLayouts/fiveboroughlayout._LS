(defun c:fiveBlayout()
	
(vl-load-com)

	
	

	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY FIVE BOROUGHS TEMPLATE.dwt" "COVER")
	(command "-layout" "Rename" "Layout1-COVER" "COVER")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY FIVE BOROUGHS TEMPLATE.dwt" "LAYOUT")
	(command "-layout" "Rename" "Layout2-LAYOUT" "" "")
  	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY FIVE BOROUGHS TEMPLATE.dwt" "ELEVATIONS")
	(command "-layout" "Rename" "Layout3-ELEVATIONS" "ELEVATIONS") 
	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY FIVE BOROUGHS TEMPLATE.dwt" "ELEV DETAILS")
	(command "-layout" "Rename" "Layout4-ELEV DETAILS" "ELEV DETAILS") 
	(command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\NY FIVE BOROUGHS TEMPLATE.dwt" "3LINE")
	(command "-layout" "Rename" "Layout5-3LINE" "3LINE") 



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
		(vla-get-TabOrder (vla-item tabs "ELEVATIONS")
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
	(vla-put-TabOrder (vla-item tabs "ELEVATIONS") pos3)

	(setq pos5
		(vla-get-TabOrder (vla-item tabs "ELEV DETAILS")
		)
  	      pos4
	       	(vla-get-TabOrder (vla-item tabs "ELEVATIONS")
	     	)
	)
  	(if 
		(> pos5 pos4) ;;Then
			(setq pos4 (1+ pos4)
		)
	)
	(vla-put-TabOrder (vla-item tabs "ELEV DETAILS") pos4)

	(setq pos6
		(vla-get-TabOrder (vla-item tabs "3LINE")
		)
  	      pos5
	       	(vla-get-TabOrder (vla-item tabs "ELEV DETAILS")
	     	)
	)
  	(if 
		(> pos6 pos5) ;;Then
			(setq pos5 (1+ pos5)
		)
	)
	(vla-put-TabOrder (vla-item tabs "3LINE") pos5)
  
	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\5B TEMPLATE" "-1315.375,13447.5625,0.0" "" "" "" 
		"_.explode" (entlast) "" 
	)
  	(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\5B LAYOUTS" "3901.375,13447.5625,0.0" "" "" "" 
		"_.explode" (entlast) "" 
	)
)