(load "dwgProp")

(load "log")
(setq user (getvar "loginname"))
(if
	(and
		(not (= user "MichaelArrieta"))
		(not (= user "mattbirckbichler"))
		(not (= user "jasonstolze"))
		(not (= user "DaveRucki"))
		(not (= user "JillianClarkin"))
		(not (= user "JosephGallagher"))
		(not (= user "KyleBreese"))
		(not (= user "josephgallagher"))
		(not (= user "DonMitchell"))
		(not (= user "donmitchell"))
	)
	(logThis "New User")
)

(defun c:3lineNEW()



	(setq echo(getvar "cmdecho"))
	(setvar "cmdecho" 0)

(setq d 
	 
	(atoi
		(substr 
			(rtos 
				(getvar "CDATE") 
				2 
				6
			) 
			1 
			8
		)
	)
)


	;(command "erase" '(7744.34 17401.1 0.0) '(7112.64 17192.9 0.0) "")
	
	(load "getCellsFunction")
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
		nonFused
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B4"
			)
		nonFusedPartNum
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"LARGE TABLE" 
				"B40"
			)	
		state
			(getcellsfunction  
				(strcat (getvar 'dwgprefix) "acad calc template.xlsx")			
				"FORM" 
				"E12"
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
	(_dwgru-dwgprops-set-custom-prop "06 nonFused" nonFused nil)
	(_dwgru-dwgprops-set-custom-prop "unfusedDiscoPartNum" nonFusedPartNum nil)


	(if 
	    (or
		( = state "NJ"), ( = state "NY-US")
	    )
		(Setq 
			templatePath 
				(strcat
					"Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES (NJ)\\" template
				)
		)
		(Setq 
			templatePath 
				(strcat
					"Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\" template
				)
		)
	)
	(if
		(findfile(strcat templatePath ".dwg"))
		(command "-insert" templatePath "6952.07,17495.8,0.0" "" "" "")
		(progn
			(setq noTemp 1)
			(alert "Template Does Not Exist")	
		)
	)
	

;	(cond
;		((equal template "NB1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NB1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NB2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NB2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NB3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NB3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NB4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NB4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NB5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NB5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBC1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBC2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBC21C" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBM1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBM2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBM3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBM4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NBM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NBM5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NL1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NL1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NL2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NL2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NL3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NL3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NL4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NL4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NL5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NL5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLC1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLC2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLC21C" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLM1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLM2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLM3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLM4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "NLM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\NLM5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB1AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB1AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB1CDC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB1CDC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB1CDCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB1CDCSS" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB1DC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB1DC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB1DCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB1DCSS" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB2AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB2AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TB3AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TB3AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL1AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL1AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL1CDC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL1CDC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL1CDCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL1CDCSS" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL1DC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL1DC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL1DCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL1DCSS" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL2AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL2AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "TL3AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\TL3AC" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UB1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UB1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UB2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UB2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UB3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UB3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UB4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UB4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UB5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UB5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBC1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBC2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBC21C" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBM1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBM2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBM3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBM4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UBM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UBM5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UL1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UL1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UL2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UL2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UL3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UL3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UL4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UL4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "UL5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\UL5" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULC1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULC2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULC21C" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULM1" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULM2" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULM3" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULM4" "6952.07,17495.8,0.0" "" "" ""))
;		((equal template "ULM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\ULM5" "6952.07,17495.8,0.0" "" "" ""))
;
;
;		(
;			(/= template "ULM5")
;			(setq noTemp 1)
;			(alert "Template Does Not Exist")	
;		)
;	)














;|	
	(cond
		
	;TRENCH/BREAKER
		((equal template "TB1AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\BREAKER\\1 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TB1DCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\BREAKER\\1 INVERTER DC TRENCH (SPLIT STRINGS)" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TB1DC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\BREAKER\\1 INVERTER DC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TB2AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\BREAKER\\2 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TB3AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\BREAKER\\3 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		 
	;TRENCH/LINE TAPS
		((equal template "TL1AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\LINE TAP\\1 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TL1DCSS")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\LINE TAP\\1 INVERTER DC TRENCH (SPLIT STRINGS)" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TL1DC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\LINE TAP\\1 INVERTER DC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TL2AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\LINE TAP\\2 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "TL3AC")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\Trench\\LINE TAP\\3 INVERTER AC TRENCH" "6952.07,17495.8,0.0" "" "" ""))
		
	;UTILITY/BREAKER/COMBINER
		((equal template "UBC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\2 INVERTERS 1 COMBINED" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		
	;UTILITY/BREAKER/MICROINVERTERS
		((equal template "UBM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\1 MICRO STRING" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\2 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\3 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\4 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UBM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\5 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
	
	;UTILITY/BREAKER
		((equal template "UB1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UB2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UB3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\3 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UB4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\4 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UB5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\BACKFEED BREAKER\\5 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))

	;UTILITY/LINE TAPS/COMBINER
		((equal template "ULC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\2 INVERTERS 1 COMBINED" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		
	;UTILITY/LINE TAPS/MICROINVERTERS
		((equal template "ULM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\1 MICRO STRING" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\2 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\3 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\4 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "ULM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\5 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
	
	;UTILITY/LINE TAPS
		((equal template "UL1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UL2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UL3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\3 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UL4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\4 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "UL5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\UTILITY DISCONNECT\\LINE TAPS\\5 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))

	;NO UTILITY/BREAKER/COMBINER
		((equal template "NBC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\2 INVERTERS 1 COMBINED" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\COMBINER BOX\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		
	;NO UTILITY/BREAKER/MICROINVERTERS
		((equal template "NBM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\1 MICRO STRING" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\2 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\3 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\4 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NBM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\MICRO INVERTERS\\5 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
	
	;NO UTILITY/BREAKER
		((equal template "NB1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NB2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NB3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\3 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NB4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\4 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NB5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\BACKFEED BREAKER\\5 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))

	;NO UTILITY/LINE TAPS/COMBINER
		((equal template "NLC1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLC21C")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\2 INVERTERS 1 COMBINED" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLC2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\COMBINER BOX\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		
	;NO UTILITY/LINE TAPS/MICROINVERTERS
		((equal template "NLM1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\1 MICRO STRING" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLM2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\2 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLM3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\3 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLM4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\4 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NLM5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\MICRO INVERTERS\\5 MICRO STRINGS" "6952.07,17495.8,0.0" "" "" ""))
	
	;NO UTILITY/LINE TAPS
		((equal template "NL1")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\1 INVERTER" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NL2")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\2 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NL3")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\3 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NL4")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\4 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))
		((equal template "NL5")(command "-insert" "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\NO UTILITY DISCONNECT\\LINE TAPS\\5 INVERTERS" "6952.07,17495.8,0.0" "" "" ""))

		(
			(/= template "NL5")
			(setq noTemp 1)
			(alert "Template Does Not Exist")	
		)

	);cond
|;




	(if
		(/= noTemp 1)
		(progn
			(setq lineTemp (entlast))
			(command "explode" lineTemp "")
		)
	)
	
	(if
		(= deleteString "1")
		(progn
			(delblk "string1")
			(delblk "string2")
			(delblk "string3")
		)
	)

	(setvar "cmdecho" echo)

	(princ)
)



















		;		(strcat "Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\" template)