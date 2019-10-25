
;-----------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;
;------------------------GETS VISIBILITY STATES FROM DYNAMIC BLOCKS AND PLACES THAT INFO--------------------------;
;-------------------------IN EXCEL FOR THE CURRENT REVISION TAG IN THE "REVISION LIST" SHEET----------------------;
;-----------------------------------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;
;------MADE BY TAMIR LIEBER---------------------------------------------------------------------------------------;
;-----------------------------------------------------------------------------------------------------------------;


(load "getcellsfunction")
(defun c:updateappsNEW()
(setq drawing (vla-get-summaryinfo (vla-get-activedocument (vlax-get-acad-object))))


;----------------------------------------------------------------------;
;-------------------------GET RACKING VISIBILITY STATE-----------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,001 DYNAMIC RACKING BLOCK (REFERANCED)"))));LOOK THROUGH THE DRAWING FOR DYNAMIC BLOCK
		(repeat (setq i (sslength s))
			(if  (= "001 DYNAMIC RACKING BLOCK (REFERANCED)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Racking1 (LM:getvisibilitystate g ))
  				(vla-setcustombykey drawing "currEquipment" Racking1)
			    	(command "-vbarun" "Module2.updateapps")
			  )
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET MODULE VISIBILITY STATE------------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,MODULE DATA SHEET (DYNAMIC)"))))
		(repeat (setq i (sslength s))
			(if  (= "MODULE DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))))
			  (progn
				(setq Module1 (LM:getvisibilitystate g ))
  				(vla-setcustombykey drawing "currEquipment" Module1)
			    	(command  "-vbarun" "Module2.updateapps")
			  )
			  
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET INVERTER VISIBILITY STATE----------------;
;----------------------------------------------------------------------;
(if (setq s (ssget "_X"  '((0 . "INSERT") (2 . "`*U*,INVERTER DATA SHEET (DYNAMIC)"))))
		(repeat (setq i (sslength s))
			(if  (= "INVERTER DATA SHEET (DYNAMIC)"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));
			  (progn
				(setq Inverter1 (LM:getvisibilitystate g ))
			    	;(alert Inverter1)
  				(vla-setcustombykey drawing "currEquipment" Inverter1)
			    	(command  "-vbarun" "Module2.updateapps")
			  )
			)
		)
)
;----------------------------------------------------------------------;
;-------------------------GET INTERCONNECTION VISIBILITY STATE---------;
;----------------------------------------------------------------------;
(command "zoom" "extents" "")
(if 
      (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,INTERCONNECTION_DYN"))));CHECK 3LINE WINDOW
      
    
  (progn
    (setq Interconnection1 "")
		(repeat (setq i (sslength s))
		  (if  (= "INTERCONNECTION_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE IF INTERCONNECTION BLOCK IS IN 3LINE WINDOW
			  (progn
  				(setq Interconnection1 (LM:getvisibilitystate g ))
			  )
		    	  
		  )
		)
    (command "zoom" "previous" "")
    
    (if (= Interconnection1 "")
      (progn
		(alert "Please name a block for Interconnection and then select it")
		(setq inter (getstring "Please describe Interconnection without spaces\n"))
		(if (setq s (ssget "x" (list (cons 0 "insert")(cons 2 "INTERCONNECTION_DYN_NEW"))));LOOK THROUGH THE WHOLE DRAWING
		  (progn
		    (command "explode" s "")
			(setq blknm "INTERCONNECTION_DYN_NEW")
			(setq selectionset (ssget))
			(setq insertionpoint (list 6530.3125 17097.25 0))
		    	(command "-purge" "Blocks" blknm "No")
			(command "_.-Block" blknm insertionpoint selectionset "");make the new block with the name as BLOCK
		    	(command "filedia" "0")
		    	(command "-wBlock" (strcat "C:\\Users\\TamirLieber\\Desktop\\block_library\\" inter ".dwg") blknm '(0 0 0))
		    	(command "filedia" "1")
			(command "_.-insert" blknm insertionpoint "" "" "")
			(setq Interconnection1 inter)
		  )
		  (progn
		    (setq blknm "INTERCONNECTION_DYN_NEW")
		    
			(setq Interconnection1 inter)
		      (progn
			(setq selectionset (ssget))
			(setq insertionpoint (list 6530.3125 17097.25 0))
		    	(command "-purge" "Blocks" blknm "No")
			(command "_.Block" blknm insertionpoint selectionset "");make the new block with the name as the roof number
			(command "filedia" "0")
		    	(command "-wBlock" (strcat "C:\\Users\\TamirLieber\\Desktop\\block_library\\" inter ".dwg") blknm '(0 0 0))
		    	(command "filedia" "1")
			(command "_.-insert" blknm insertionpoint "" "" "")
			(setq Interconnection1 inter)
		      )
		  
		)
		  )
	)
  )
  )
)

(vla-setcustombykey drawing "currEquipment" Interconnection1)
(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET DISCONNECT VISIBILITY STATE--------------;
;----------------------------------------------------------------------;
(command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,SOLARMAINDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
    (setq Disconnect1 "")
		(repeat (setq i (sslength s))
			(if  (= "SOLARMAINDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE DISCONNECT BLOCK
			  (progn
  				(setq Disconnect1 (LM:getvisibilitystate g))
			  )
			)
		)
    	(if (= Disconnect1 "")
      		(progn
			(setq Disconnect1 " ")   	
		)
        )
    )
)
(command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Disconnect1)
(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET PRODUCTION METER VISIBILITY STATE--------;
;----------------------------------------------------------------------;
  (command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,PRODUCTIONMETER_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
    (setq Production1 "")
		(repeat (setq i (sslength s))
			(if  (= "PRODUCTIONMETER_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE PRODUCTION METER BLOCK
			  (progn
				(setq Production1 (LM:getvisibilitystate g ))
			  )
			)
		)
    (if (= Production1 "")
      		(progn
			(setq Production1 " ")		
		)
        )
  )
)
  (command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Production1)
			    	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET UNFUSED VISIBILITY STATE-----------------;
;----------------------------------------------------------------------;
  (command "zoom" "extents" "")
(if (setq s (ssget "_W" '(6270.1875 17484) '(6952.0625 16894.625) '((0 . "INSERT") (2 . "`*U*,NONFUSEDDISCONNECT_DYN"))));LOOK AT THE 3LINE WINDOW
  (progn
    (setq Unfused1 "")
		(repeat (setq i (sslength s))
			(if  (= "NONFUSEDDISCONNECT_DYN"  (strcase  (vla-get-effectivename (setq g (vlax-ename->vla-object (ssname s (setq i (1- i))))))));CHECK TO SEE THE UNFUSED DISCONNECT BLOCK
			  (progn
				(setq Unfused1 (LM:getvisibilitystate g ))
			  )
			)
		)
    (if (= Unfused1 "")
      		(progn
			(setq Unfused1 " ")	
		)
        )
 )
)
  (command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" Unfused1)
(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;-------------------------GET FUSED AMPERAGE---------------------------;
;----------------------------------------------------------------------;
  (command "zoom" "extents" "")

  (progn
    (setq OCPD1 "")
    (vla-getcustombykey drawing "03 overcurruntProtection" 'OCPD);GET DISCONNECT AMPERAGE FROM DWGPROPS
    (setq OCPD1 OCPD)
    (if (= OCPD1 "")
      		(progn
			(setq OCPD1 " ")	
		)
        )
 )

  (command "zoom" "previous" "")
(vla-setcustombykey drawing "currEquipment" OCPD1)
(command  "-vbarun" "Module2.updateapps")

;----------------------------------------------------------------------;
;--------------------------------SYSTEMSIZEDC--------------------------;
;----------------------------------------------------------------------;
(setq systemsizeDC1
	(getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"CALCULATIONS"
		"B34"
	)
)
      (vla-setcustombykey drawing "currEquipment" systemsizeDC1)
	(command  "-vbarun" "Module2.updateapps")

;----------------------------------------------------------------------;
;--------------------------------SYSTEMSIZEAC--------------------------;
;----------------------------------------------------------------------;
(setq systemsizeAC1
       (+ (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"M32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"N32"
	  )
      	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"O32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"P32"
	  )
	  (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"SMALL TABLES"
		"Q32"
	  )
	)
)
  (vla-setcustombykey drawing "currEquipment" systemsizeAC1)
	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;--------------------------------TOTAL MODULES-------------------------;
;----------------------------------------------------------------------;
(setq totalmodules1
       (getcellsfunction;get module number for last revision sent to township
		(strcat (getvar 'dwgprefix) "acad calc template.xlsx")
		"CALCULATIONS"
		"B12"
	)
)
  (vla-setcustombykey drawing "currEquipment" totalmodules1)
	(command  "-vbarun" "Module2.updateapps")
;----------------------------------------------------------------------;
;--------------------------------DONE----------------------------------;
;----------------------------------------------------------------------;
	(progn
	  (command  "-vbarun" "Module2.newrev")
  	)




)


(defun LM:getvisibilitystate ( blk )
    (LM:getdynpropvalue blk "Visibility1")
)
(defun LM:getdynpropvalue ( blk prp )
    (setq prp (strcase prp))
    (vl-some '(lambda ( x ) (if (= prp (strcase (vla-get-propertyname x))) (vlax-get x 'value)))
        (vlax-invoke blk 'getdynamicblockproperties)
    )
)