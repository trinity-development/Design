(defun c:Met-Ed()
  (vl-load-com)
  
  (command "-layout" "Template" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\LAYOUT TEMPLATES\\11X17 TEMPLATE - STANDARD.dwt" "SITE PLAN");BRING IN SITE PLAN PAGE
  (command "-layout" "Rename" "Layout1-SITE PLAN" "SITE PLAN");RENAME SITE PLAN PAGE

  (setq tabs
	(vla-get-Layouts
		(vla-get-Activedocument (vlax-get-acad-object))
	)
  );GET LAYOUT TABS NUMBER VALUES

  (setq position1
	 (vla-get-TabOrder (vla-item tabs "SITE PLAN"))
	position2
	 (vla-get-TabOrder (vla-item tabs "LAYOUT"))
  )

  (if 
	(> position2 position1) ;;Then
    		(progn
			(setq position2 (1+ position2))
		  	(vla-put-TabOrder (vla-item tabs "SITE PLAN") position2)
		)
  )
)
  