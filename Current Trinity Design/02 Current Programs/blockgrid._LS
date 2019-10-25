(vl-load-com)
(defun c:blockgrid()
	(setq count 0)
   	
  	(setq acApp (vlax-get-acad-object))
	  (setq acDocs (vla-get-documents acApp))
  	
	(setq files (GrabAllFiles ".dwg"))
  	(setq acApp (vlax-get-acad-object))
	  (setq acDocs (vla-get-documents acApp))
	  (setq mspace (vla-get-modelspace (vla-get-activedocument acApp)))
	  
	 
  	(foreach n files
	  
	  
	  (repeat 20
	    	(setq x 1071)
	  	(setq inspt1 (vlax-3d-point '(x 0 0)))
	    	(setq inspttxt (vlax-3d-point '(x 792 0)))
	  	(setq dwglib "C:\\Users\\TamirLieber\\Desktop\\block_library\\")
	  		(vla-insertblock mspace inspt1 n 1 1 1 0)
	  	(setq x (+ x 2142))
	    	(setq intercontxt (vla-addtext mspace (substr n 4) inspttxt 50))
	    
	  	(command "_qsave" "")
	  )
	  (setq count (+ count 1))
	)
	(vla-activate(vla-close acDocs :vlax-false))
  )
(defun GrabAllFiles (FileExt / tempPath FileList)
; [Path] is the path to search it, and all it's sub-directory
; [FileExt] is the extenstion (with the period) of the type of files to look for.
; Example (GrabAllFiles "c:\\" ".dwg")

	(setq Path "C:\\Users\\TamirLieber\\Desktop\\block_library\\"
	)
	(foreach file (vl-directory-files Path)
		(setq tempPath (strcat Path file))
		(if
			(not
				(or
					(= file ".")
					(= file "..")
				)
			)
			(if (vl-file-directory-p tempPath)
				(setq FileList (append FileList (GrabAllFiles tempPath FileExt)))
				(if (= (strcase FileExt) (strcase (vl-filename-extension tempPath)))
					(setq FileList (cons tempPath FileList))
				)
			)
		)
	)
	FileList
)