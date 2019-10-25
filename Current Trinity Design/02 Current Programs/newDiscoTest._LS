(defun c:Discotest (/ en eo dblist dbprop i o s)

  (if (setq s (ssget "_X" '((0 . "INSERT") (2 . "`*U*,solarMainDisconnect_Dyn"))))
(repeat (setq i (sslength s))
(if (= "solarMainDisconnect_Dyn" (strcase (vla-get-effectivename (setq eo (vlax-ename->vla-object (ssname s (setq i (1- i)))))) t))
  (alert eo)
  )))

  ;(setq en (entget "7fffb67c10")) ;Ask user to pick the block reference
  ;(setq eo (vlax-ename->vla-object 7ffffb67c10));Get the ActiveX object

  ;;Get the DB Props collection, converting it from a variant-safearray to a list
  ;;(setq dblist (vlax-safearray->list (vlax-variant-value (vla-GetDynamicBlockProperties eo))))

  ;; Could use this instead
  (setq dblist (vlax-invoke eo 'GetDynamicBlockProperties))

  (foreach dbprop dblist ;Step through each property in the collection
    (if (= (vla-get-PropertyName dbprop) "Visibility1") ;Check if the current has the name as you gave it inside Visibility1
      (if (= (vlax-get dbprop 'Value) "No Disconnect") ;Check if its current state is No Disconnect
        (vlax-put dbprop 'Value "Fused") ;Then change it to Fused
        (vlax-put dbprop 'Value "No Disconnect") ;Else change it to No Disconnect
      ) ;_ end of if
    ) ;_ end of if
  ) ;_ end of foreach
  
  
  
    
) ;_ end of defun
(defun getblk(get)
 
  (setq n 0 aDoc (vla-get-activedocument (vlax-get-acad-object)))
  (vlax-for layout  (vla-get-layouts aDoc)
    (vlax-for i  (vla-get-block layout)
      (if (and
            (eq (vla-get-ObjectName i) "AcDbBlockReference")
            (member (strcase (vla-get-effectivename  i))(mapcar 'strcase xt))
            (not (vl-catch-all-error-p (vl-catch-all-apply 'vlax-invoke (list i 'Delete)))))
            	(setq n (1+ n))
            )
      )
    ))