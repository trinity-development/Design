(load "getcellsfunction")
(load "dwgProp")
(defun c:update()
  	(setq start (getvar "MILLISECS"))
	(setq 

		template 
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"SMALL TABLES" 
				"D88"
			)
		deleteString
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"SMALL TABLES" 
				"D89"
			)
		servAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B3"
			)	
		discoAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B2"
			)	
		overcurrentProtection
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B1"
			)	
		inv1
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B6"
			)	
		inv2
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B7"
			)	
		inv3
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B8"
			)	
		inv4
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B9"
			)	
		inv5
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B10"
			)	
		micro1
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B11"
			)	
		micro2
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B12"
			)	
		micro3
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B13"
			)	
		micro4
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B14"
			)	
		micro5
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B15"
			)	
		subpanelAmp
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B5"
			)	
	
	);setq
	(_dwgru-dwgprops-set-custom-prop "01 serviceAmperage" servAmp nil)
	(_dwgru-dwgprops-set-custom-prop "02 discoAmperage" discoAmp nil)
	(_dwgru-dwgprops-set-custom-prop "03 overcurruntProtection" overcurrentProtection nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv1" inv1 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv2" inv2 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv3" inv3 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv4" inv4 nil)
	(_dwgru-dwgprops-set-custom-prop "04 inv5" inv5 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro1" micro1 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro2" micro2 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro3" micro3 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro4" micro4 nil)
	(_dwgru-dwgprops-set-custom-prop "04 micro5" micro5 nil)
	(_dwgru-dwgprops-set-custom-prop "05 subpanelAmperage" subpanelAmp nil)

	(setq end (getvar "MILLISECS"))
  	(princ (itoa (- end start)))
	(command "datalinkupdate" "u" "k")
	(princ)

)