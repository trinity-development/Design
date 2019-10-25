(defun c:panelmax (/ *error*)

	(defun *error* (msg)

		(command)
		(command)

    		(princ "errrrror: ")
   		(princ msg)

		(command "undo" "back")
		(if
			(entget plentname)
    			(entdel plentname)
		)
    		(setvar "osmode" oldsnap)
    		(setvar "cmdecho" oldecho)
		(setvar "clayer" oldlayer)
    		(if
			(tblsearch "layer" "temp1")
			(command "-laydel" "name" "temp1" "" "yes")
		)
		(if
			(tblsearch "layer" "temp2")
			(command "-laydel" "name" "temp2" "" "yes")
		)
		(if
			(tblsearch "layer" "arr-hatch")
			(command "-laydel" "name" "arr-hatch" "" "yes")
		)
		(command "-layer" "on" "1,2" "")
		(command "-layer" "unlock" "PANELS" "")
    		(princ)
  	);*error*


	

	(setq oldlayer (getvar "clayer"))
	(setq oldsnap (getvar "osmode"))
  	(setq oldecho (getvar "cmdecho"))
	(setvar "cmdecho" 0)
  	(setq oldsnap(getvar "osmode"))
  	(setq oldecho(getvar "cmdecho"))
  	(setvar "cmdecho" 0)
	(command "-layer" "lock" "PANELS" "")
  	(prompt "\nSelect Entire House: ")
	(command "undo" "mark")
  	(setq house (ssget))
	(command "-layer" "unlock" "1,2" "")
  	(command "copy" house "" (list 0 0)(list 0 0) )
  	(command "-layer" "make" "Temp2" "")
  	(command "._move" "p" "" "0,0,1e99" "")
  	(command "._move" "p" "" "0,0,-1e99" "")
  	(command "change" "p" "" "p" "la" "Temp2" "")
	(command "-layer" "unlock" "PANELS" "")
  	(setq myFilter
		(list 
			(cons 8 "Temp2")
		);list
  	);setq	
  	(setq flathouse
		(ssget "X" myFilter)
  	);setq
  	(command "change" flathouse "" "p" "c" "184" "")
  	(command "-layer" "make" "Temp1" "s" "0" "")
  	(command "-layer" "off" "temp2" "")
	(command "-layer" "lock" "1,2" "")

	


	(while
		(setq 
			pnt1 (getpoint"\nSelect Highest Point of Roof (or press ENTER if complete):")
		);
		(setq
			pnt2 (getpoint"\nSelect Lowest Left Point:")
			pnt3 (getpoint"\nSelect Lowest Right Point:")
		);
		(setvar "osmode" 0)
	  	(command "-layer" "on" "temp2" "")
	  	(setq roof
		       (getpoint"\nSelect Internal Point: ")
		);setq

		(command "-layer" "unlock" "1,2" "")
	  	(command "-boundary" "a" "i" "n" "" "" roof "")
		(setq
			plentname (entlast)
			plent (entget plentname)
			plv
				(cdr
					(assoc 90 plent)
				);cdr
			var1
				(member
					(assoc 10 plent)
					plent
				);member

		);setq

		(command "-layer" "off" "temp2" "")			
		(setq 
			ang1 (angle pnt2 pnt3)
			ang2 (angle pnt3 pnt2)
			ang3 (+ ang1 1.57079633)
			ang4 (+ ang2 1.57079633)
			perp1 (polar pnt2 ang1 10000)
			perp2 (polar pnt2 ang2 10000)
			perp3 (polar 
				(list (car pnt1)(cadr pnt1)(caddr pnt2)) 
				ang3 
				10000
			      );
			perp4 (polar 
				(list (car pnt1)(cadr pnt1)(caddr pnt2)) 
				ang4 
				10000
			      );
			pnt4 (inters perp1 perp2 perp3 perp4 nil)
			ang1 (angle pnt1 pnt4)
			dist 
				(distance
					pnt4
					pnt1
				);
			factor1
				(/ 
					dist
					(distance
						(list(car pnt1)(cadr pnt1)0)
						(list(car pnt4)(cadr pnt4)0)
					);distance
				);/
		);setq


		(setq pt1(cdr(assoc 10 plent)))
		(setq pt2(cdr(nth 5 var1)))
		(setq pt3(cdr(nth 10 var1)))
		(if(> plv 3)(setq pt4(cdr(nth 15 var1))))	
		(if(> plv 4)(setq pt5(cdr(nth 20 var1))))	
		(if(> plv 5)(setq pt6(cdr(nth 25 var1))))	
		(if(> plv 6)(setq pt7(cdr(nth 30 var1))))	
		(if(> plv 7)(setq pt8(cdr(nth 35 var1))))	
		(if(> plv 8)(setq pt9(cdr(nth 40 var1))))	
		(if(> plv 9)(setq pt10(cdr(nth 45 var1))))	
		(if(> plv 10)(setq pt11(cdr(nth 50 var1))))	
		(if(> plv 11)(setq pt12(cdr(nth 55 var1))))	
		(if(> plv 12)(setq pt13(cdr(nth 60 var1))))	
		(if(> plv 13)(setq pt14(cdr(nth 65 var1))))	
		(if(> plv 14)(setq pt15(cdr(nth 70 var1))))	
		(if(> plv 15)(setq pt16(cdr(nth 75 var1))))	
		(if(> plv 16)(setq pt17(cdr(nth 80 var1))))	
		(if(> plv 17)(setq pt18(cdr(nth 85 var1))))	
		(if(> plv 18)(setq pt19(cdr(nth 90 var1))))	
		(if(> plv 19)(setq pt20(cdr(nth 95 var1))))	
		(if(> plv 20)(setq pt21(cdr(nth 100 var1))))	
		(if(> plv 21)(setq pt22(cdr(nth 105 var1))))	
		(if(> plv 22)(setq pt23(cdr(nth 110 var1))))	
		(if(> plv 23)(setq pt24(cdr(nth 115 var1))))	
		(if(> plv 24)(setq pt25(cdr(nth 120 var1))))	
		(if(> plv 25)(setq pt26(cdr(nth 125 var1))))






(COND

((> plv 25)




	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	(if (inters (polar pt22 (angle (polar pt22 ang1 1) pt22 ) 1 ) (polar pt22 ang1 1) perp1 perp2) (setq fpt22 pt22) (setq fpt22 (polar pt22 (angle pnt4 pnt1)(- (* (distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)factor1)(distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)))))
	(if (inters (polar pt23 (angle (polar pt23 ang1 1) pt23 ) 1 ) (polar pt23 ang1 1) perp1 perp2) (setq fpt23 pt23) (setq fpt23 (polar pt23 (angle pnt4 pnt1)(- (* (distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)factor1)(distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)))))
	(if (inters (polar pt24 (angle (polar pt24 ang1 1) pt24 ) 1 ) (polar pt24 ang1 1) perp1 perp2) (setq fpt24 pt24) (setq fpt24 (polar pt24 (angle pnt4 pnt1)(- (* (distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)factor1)(distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)))))
	(if (inters (polar pt25 (angle (polar pt25 ang1 1) pt25 ) 1 ) (polar pt25 ang1 1) perp1 perp2) (setq fpt25 pt25) (setq fpt25 (polar pt25 (angle pnt4pnt1)(- (* (distance (inters (polar pt25 ang1 10000) pt25 perp1 perp2 nil)pt25)factor1)(distance (inters (polar pt25 ang1 10000) pt25 perp1 perp2 nil)pt25)))))
	(if (inters (polar pt26 (angle (polar pt26 ang1 1) pt26 ) 1 ) (polar pt26 ang1 1) perp1 perp2) (setq fpt26 pt26) (setq fpt26 (polar pt26 (angle pnt4pnt1)(- (* (distance (inters (polar pt26 ang1 10000) pt26 perp1 perp2 nil)pt26)factor1)(distance (inters (polar pt26 ang1 10000) pt26 perp1 perp2 nil)pt26)))))




)


((> plv 24)

	
	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	(if (inters (polar pt22 (angle (polar pt22 ang1 1) pt22 ) 1 ) (polar pt22 ang1 1) perp1 perp2) (setq fpt22 pt22) (setq fpt22 (polar pt22 (angle pnt4 pnt1)(- (* (distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)factor1)(distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)))))
	(if (inters (polar pt23 (angle (polar pt23 ang1 1) pt23 ) 1 ) (polar pt23 ang1 1) perp1 perp2) (setq fpt23 pt23) (setq fpt23 (polar pt23 (angle pnt4 pnt1)(- (* (distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)factor1)(distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)))))
	(if (inters (polar pt24 (angle (polar pt24 ang1 1) pt24 ) 1 ) (polar pt24 ang1 1) perp1 perp2) (setq fpt24 pt24) (setq fpt24 (polar pt24 (angle pnt4 pnt1)(- (* (distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)factor1)(distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)))))
	(if (inters (polar pt25 (angle (polar pt25 ang1 1) pt25 ) 1 ) (polar pt25 ang1 1) perp1 perp2) (setq fpt25 pt25) (setq fpt25 (polar pt25 (angle pnt4 pnt1)(- (* (distance (inters (polar pt25 ang1 10000) pt25 perp1 perp2 nil)pt25)factor1)(distance (inters (polar pt25 ang1 10000) pt25 perp1 perp2 nil)pt25)))))

)


((> plv 23)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	(if (inters (polar pt22 (angle (polar pt22 ang1 1) pt22 ) 1 ) (polar pt22 ang1 1) perp1 perp2) (setq fpt22 pt22) (setq fpt22 (polar pt22 (angle pnt4 pnt1)(- (* (distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)factor1)(distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)))))
	(if (inters (polar pt23 (angle (polar pt23 ang1 1) pt23 ) 1 ) (polar pt23 ang1 1) perp1 perp2) (setq fpt23 pt23) (setq fpt23 (polar pt23 (angle pnt4 pnt1)(- (* (distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)factor1)(distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)))))
	(if (inters (polar pt24 (angle (polar pt24 ang1 1) pt24 ) 1 ) (polar pt24 ang1 1) perp1 perp2) (setq fpt24 pt24) (setq fpt24 (polar pt24 (angle pnt4 pnt1)(- (* (distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)factor1)(distance (inters (polar pt24 ang1 10000) pt24 perp1 perp2 nil)pt24)))))
	
	

)


((> plv 22)

	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	(if (inters (polar pt22 (angle (polar pt22 ang1 1) pt22 ) 1 ) (polar pt22 ang1 1) perp1 perp2) (setq fpt22 pt22) (setq fpt22 (polar pt22 (angle pnt4 pnt1)(- (* (distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)factor1)(distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)))))
	(if (inters (polar pt23 (angle (polar pt23 ang1 1) pt23 ) 1 ) (polar pt23 ang1 1) perp1 perp2) (setq fpt23 pt23) (setq fpt23 (polar pt23 (angle pnt4 pnt1)(- (* (distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)factor1)(distance (inters (polar pt23 ang1 10000) pt23 perp1 perp2 nil)pt23)))))



)


((> plv 21)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	(if (inters (polar pt22 (angle (polar pt22 ang1 1) pt22 ) 1 ) (polar pt22 ang1 1) perp1 perp2) (setq fpt22 pt22) (setq fpt22 (polar pt22 (angle pnt4 pnt1)(- (* (distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)factor1)(distance (inters (polar pt22 ang1 10000) pt22 perp1 perp2 nil)pt22)))))




)


((> plv 20)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))
	(if (inters (polar pt21 (angle (polar pt21 ang1 1) pt21 ) 1 ) (polar pt21 ang1 1) perp1 perp2) (setq fpt21 pt21) (setq fpt21 (polar pt21 (angle pnt4 pnt1)(- (* (distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)factor1)(distance (inters (polar pt21 ang1 10000) pt21 perp1 perp2 nil)pt21)))))
	


)


((> plv 19)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))
	(if (inters (polar pt20 (angle (polar pt20 ang1 1) pt20 ) 1 ) (polar pt20 ang1 1) perp1 perp2) (setq fpt20 pt20) (setq fpt20 (polar pt20 (angle pnt4 pnt1)(- (* (distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)factor1)(distance (inters (polar pt20 ang1 10000) pt20 perp1 perp2 nil)pt20)))))




)


((> plv 18)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	(if (inters (polar pt19 (angle (polar pt19 ang1 1) pt19 ) 1 ) (polar pt19 ang1 1) perp1 perp2) (setq fpt19 pt19) (setq fpt19 (polar pt19 (angle pnt4 pnt1)(- (* (distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)factor1)(distance (inters (polar pt19 ang1 10000) pt19 perp1 perp2 nil)pt19)))))



)


((> plv 17)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	(if (inters (polar pt18 (angle (polar pt18 ang1 1) pt18 ) 1 ) (polar pt18 ang1 1) perp1 perp2) (setq fpt18 pt18) (setq fpt18 (polar pt18 (angle pnt4 pnt1)(- (* (distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)factor1)(distance (inters (polar pt18 ang1 10000) pt18 perp1 perp2 nil)pt18)))))
	


)


((> plv 16)

	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	(if (inters (polar pt17 (angle (polar pt17 ang1 1) pt17 ) 1 ) (polar pt17 ang1 1) perp1 perp2) (setq fpt17 pt17) (setq fpt17 (polar pt17 (angle pnt4 pnt1)(- (* (distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)factor1)(distance (inters (polar pt17 ang1 10000) pt17 perp1 perp2 nil)pt17)))))
	


)


((> plv 15)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))
	(if (inters (polar pt16 (angle (polar pt16 ang1 1) pt16 ) 1 ) (polar pt16 ang1 1) perp1 perp2) (setq fpt16 pt16) (setq fpt16 (polar pt16 (angle pnt4 pnt1)(- (* (distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)factor1)(distance (inters (polar pt16 ang1 10000) pt16 perp1 perp2 nil)pt16)))))
	

)


((> plv 14)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))
	(if (inters (polar pt15 (angle (polar pt15 ang1 1) pt15 ) 1 ) (polar pt15 ang1 1) perp1 perp2) (setq fpt15 pt15) (setq fpt15 (polar pt15 (angle pnt4 pnt1)(- (* (distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)factor1)(distance (inters (polar pt15 ang1 10000) pt15 perp1 perp2 nil)pt15)))))

	


)


((> plv 13)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))
	(if (inters (polar pt14 (angle (polar pt14 ang1 1) pt14 ) 1 ) (polar pt14 ang1 1) perp1 perp2) (setq fpt14 pt14) (setq fpt14 (polar pt14 (angle pnt4 pnt1)(- (* (distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)factor1)(distance (inters (polar pt14 ang1 10000) pt14 perp1 perp2 nil)pt14)))))


)


((> plv 12)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))
	(if (inters (polar pt13 (angle (polar pt13 ang1 1) pt13 ) 1 ) (polar pt13 ang1 1) perp1 perp2) (setq fpt13 pt13) (setq fpt13 (polar pt13 (angle pnt4 pnt1)(- (* (distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)factor1)(distance (inters (polar pt13 ang1 10000) pt13 perp1 perp2 nil)pt13)))))

		
	

)


((> plv 11)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))
	(if (inters (polar pt12 (angle (polar pt12 ang1 1) pt12 ) 1 ) (polar pt12 ang1 1) perp1 perp2) (setq fpt12 pt12) (setq fpt12 (polar pt12 (angle pnt4 pnt1)(- (* (distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)factor1)(distance (inters (polar pt12 ang1 10000) pt12 perp1 perp2 nil)pt12)))))

	
	
)


((> plv 10)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))
	(if (inters (polar pt11 (angle (polar pt11 ang1 1) pt11 ) 1 ) (polar pt11 ang1 1) perp1 perp2) (setq fpt11 pt11) (setq fpt11 (polar pt11 (angle pnt4 pnt1)(- (* (distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)factor1)(distance (inters (polar pt11 ang1 10000) pt11 perp1 perp2 nil)pt11)))))




)


((> plv 9)

	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))
	(if (inters (polar pt10 (angle (polar pt10 ang1 1) pt10 ) 1 ) (polar pt10 ang1 1) perp1 perp2) (setq fpt10 pt10) (setq fpt10 (polar pt10 (angle pnt4 pnt1)(- (* (distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)factor1)(distance (inters (polar pt10 ang1 10000) pt10 perp1 perp2 nil)pt10)))))



)


((> plv 8)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))
	(if (inters (polar pt9 (angle (polar pt9 ang1 1) pt9 ) 1 ) (polar pt9 ang1 1) perp1 perp2) (setq fpt9 pt9) (setq fpt9 (polar pt9 (angle pnt4 pnt1)(- (* (distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)factor1)(distance (inters (polar pt9 ang1 10000) pt9 perp1 perp2 nil)pt9)))))



)


((> plv 7)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))
	(if (inters (polar pt8 (angle (polar pt8 ang1 1) pt8 ) 1 ) (polar pt8 ang1 1) perp1 perp2) (setq fpt8 pt8) (setq fpt8 (polar pt8 (angle pnt4 pnt1)(- (* (distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)factor1)(distance (inters (polar pt8 ang1 10000) pt8 perp1 perp2 nil)pt8)))))



)


((> plv 6)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))
	(if (inters (polar pt7 (angle (polar pt7 ang1 1) pt7 ) 1 ) (polar pt7 ang1 1) perp1 perp2) (setq fpt7 pt7) (setq fpt7 (polar pt7 (angle pnt4 pnt1)(- (* (distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)factor1)(distance (inters (polar pt7 ang1 10000) pt7 perp1 perp2 nil)pt7)))))

		


)


((> plv 5)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))
	(if (inters (polar pt6 (angle (polar pt6 ang1 1) pt6 ) 1 ) (polar pt6 ang1 1) perp1 perp2) (setq fpt6 pt6) (setq fpt6 (polar pt6 (angle pnt4 pnt1)(- (* (distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)factor1)(distance (inters (polar pt6 ang1 10000) pt6 perp1 perp2 nil)pt6)))))



)


((> plv 4)

	
	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
	(if (inters (polar pt5 (angle (polar pt5 ang1 1) pt5 ) 1 ) (polar pt5 ang1 1) perp1 perp2) (setq fpt5 pt5) (setq fpt5 (polar pt5 (angle pnt4 pnt1)(- (* (distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)factor1)(distance (inters (polar pt5 ang1 10000) pt5 perp1 perp2 nil)pt5)))))

	


)


((> plv 3)

	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))
	(if (inters (polar pt4 (angle (polar pt4 ang1 1) pt4 ) 1 ) (polar pt4 ang1 1) perp1 perp2) (setq fpt4 pt4) (setq fpt4 (polar pt4 (angle pnt4 pnt1)(- (* (distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)factor1)(distance (inters (polar pt4 ang1 10000) pt4 perp1 perp2 nil)pt4)))))
)


((> plv 2)

	
	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))
	(if (inters (polar pt3 (angle (polar pt3 ang1 1) pt3 ) 1 ) (polar pt3 ang1 1) perp1 perp2) (setq fpt3 pt3) (setq fpt3 (polar pt3 (angle pnt4 pnt1)(- (* (distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)factor1)(distance (inters (polar pt3 ang1 10000) pt3 perp1 perp2 nil)pt3)))))




)


((> plv 1)


	(if (inters (polar pt1 (angle (polar pt1 ang1 1) pt1 ) 1 ) (polar pt1 ang1 1) perp1 perp2) (setq fpt1 (list (car pt1)(cadr pt1) 0)) (setq fpt1 (polar pt1 (angle pnt4 pnt1)(- (* (distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)factor1)(distance (inters (polar pt1 ang1 10000) pt1 perp1 perp2 nil)pt1)))))
	(if (inters (polar pt2 (angle (polar pt2 ang1 1) pt2 ) 1 ) (polar pt2 ang1 1) perp1 perp2) (setq fpt2 pt2) (setq fpt2 (polar pt2 (angle pnt4 pnt1)(- (* (distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)factor1)(distance (inters (polar pt2 ang1 10000) pt2 perp1 perp2 nil)pt2)))))

	
	
)
)
















	(entdel plentname)
	

		(if(= plv 3)(command "pline" fpt1 fpt2 fpt3 fpt1 ""))
		(if(= plv 4)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt1 ""))	
		(if(= plv 5)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt1 ""))	
		(if(= plv 6)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt1 ""))	
		(if(= plv 7)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt1 ""))	
		(if(= plv 8)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt1 ""))	
		(if(= plv 9)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt1 ""))	
		(if(= plv 10)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt1 ""))	
		(if(= plv 11)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt1 ""))	
		(if(= plv 12)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt1 ""))	
		(if(= plv 13)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt1 ""))	
		(if(= plv 14)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt1 ""))	
		(if(= plv 15)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt1 ""))	
		(if(= plv 16)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt1 ""))	
		(if(= plv 17)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt1 ""))	
		(if(= plv 18)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt1 ""))	
		(if(= plv 19)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt1 ""))	
		(if(= plv 20)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt1 ""))	
		(if(= plv 21)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt1 ""))	
		(if(= plv 22)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt1 ""))	
		(if(= plv 23)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt1 ""))	
		(if(= plv 24)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt1 ""))	
		(if(= plv 25)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt25 fpt1 ""))	
		(if(= plv 26)(command "pline" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt25 fpt26 fpt1 ""))	

	(setq factorline (entlast))
































(defun err (s)
  (if (= s "Function cancelled")
    (princ "\nADARRAY - cancelled: ")
    (progn (princ "\nADARRAY - Error: ")
	   (princ s)
	   (terpri)
    ) ;_ progn
  ) ;_ end of if
  (resetting)
  (princ "AD exited\n")
  (*error* "AD")
) ;_ end of err
(defun setv (systvar newval)
  (setq x (read (strcat systvar "1")))
  (set x (getvar systvar))
  (setvar systvar newval)
) ;_ end of setv
(defun setting ()
  (setq oerr *error*)
  (setq *error* err)
  (setv "CMDECHO" 0)
  (setv "BLIPMODE" 0)
  (setv "OSMODE" 0)
  (setv "CLAYER" (getvar "CLAYER"))
) ;_ end of setting
(defun rsetv (systvar)
  (setq x (read (strcat systvar "1")))
  (setvar systvar (eval x))
) ;_ end of rsetv
(defun resetting ()
  (rsetv "CMDECHO")
  (rsetv "BLIPMODE")
  (rsetv "OSMODE")
  (rsetv "CLAYER")
  (setq *error* oerr)
) ;_ end of resetting







(defun adarray ()
  (vl-load-com)
  (setq	*thisdrawing* (vla-get-activedocument
			(vlax-get-acad-object)
		      ) ;_ end of vla-get-activedocument
	*modelspace*  (vla-get-ModelSpace *thisdrawing*)
  ) ;_ end of setq
  (setq	bnameindex nil)
  (setq doit 4)
  (setq ad_id nil)

    
    (setq *bname* "panel")
    (setq *rowdist* 5.437433)
    (setq *coldist* 3.4166333)
    (setq *point0* roof)
    (do-array)

) ;_ end-of adarray

























































(defun do-array ()
  (setq lyr "arr-hatch")
  (vl-cmdf "Layer" "M" lyr "C" "green" "" "")

  (command "-layer" "off" "1,2,Panels" "")

  (vl-cmdf "-Hatch" *point0* "P" "U" (* 180.0 (/ (angle perp2 perp1) pi)) *rowdist* "N" "")
  
  (setq eHatch (entlast))
  (command "_hatchsetorigin" eHatch "" (polar pnt4 ang3 5.4999333))

  (vl-cmdf "Explode" eHatch)

  (setq	ss     (ssget "X"
		      (list '(0 . "LINE")
			    (cons 8 lyr)
		      ) ;_ end of list
	       ) ;_ end of ssget
	num    (sslength ss)
	i      -1
  ) ;_ end of setq

  (rsetv "CLAYER")







	(setq 
		per5
			(polar
				perp1
				(angle perp4 perp3)
				(distance pnt1 pnt4)
			)
		perp5
			(list (car per5)(cadr per5)0)
		per6
			(polar
				perp2
				(angle perp4 perp3)
				(distance pnt1 pnt4)
			)
		perp6
			(list (car per6)(cadr per6)0)
		midpoint
				(polar
					(cdr (assoc 10 (entget (ssname ss (- num 1)))))
					(angle perp2 perp1)
					(/
						(distance
							(cdr (assoc 10 (entget (ssname ss (- num 1)))))
							(cdr (assoc 11 (entget (ssname ss (- num 1)))))
						)
						2
					)
				)
		intersectPoint
			(inters
				perp5
				perp6
				midpoint
				(polar
					midPoint
					(angle perp4 perp3)
					20000
				)
			)
		landPoint1
			(cdr (assoc 10 (entget (ssname ss (- num 1)))))
		landPoint2
			(cdr (assoc 11 (entget (ssname ss (- num 1)))))
		hatchPoint
			(polar
				midPoint
				(angle perp4 perp3)
				1.6770666
			)
	)







  (repeat num
    (setq en (ssname ss (setq i (1+ i))))




	(setq insertPoint 
		(polar
			(cdr (assoc 10 (entget en)))
			(angle perp2 perp1)
			0.0833333
		)
	)

	(setq amount
		
		(fix
			(/
				(distance
					(cdr (assoc 10 (entget en)))	
					(cdr (assoc 11 (entget en)))
				)
				3.333
			)
		)
				
	)

	
	(repeat amount
		(command "-insert" "panel" insertPoint "1" "1" (* 180 (/ (angle perp2 perp1) pi)))
		(setq insertPoint 
			(polar insertPoint (angle perp2 perp1) *coldist*)
		)
		
	)
    (entdel en)



  ) ;_ end of repeat



	(if
		(>
			(distance midpoint intersectpoint)
			3.3541333
		)

		(progn
			


			(vl-cmdf "Layer" "s" lyr  "")

			(command "line" landPoint1 landPoint2 "")
			(setq landLine (entlast))
			(vl-cmdf "-Hatch" hatchPoint "P" "U" (* 180.0 (/ (angle perp2 perp1) pi)) 3.3541333 "N" "")
			(setq eHatch (entlast))
			(command "_hatchsetorigin" eHatch "" midPoint)
			(vl-cmdf "Explode" eHatch)
			(setq landHatch (entlast))
			(entdel landLine)

			(rsetv "CLAYER")
			
			(setq insertPoint 
				(polar
					(cdr (assoc 10 (entget landHatch)))
					(angle perp2 perp1)
					0.0833333
				)
			)

			(setq amount
		
				(fix
					(/
						(distance
							(cdr (assoc 10 (entget landHatch)))	
							(cdr (assoc 11 (entget landHatch)))
						)
						5.4166
					)
				)
			)

			(repeat amount
				(command "-insert" "panelLand" insertPoint "1" "1" (* 180 (/ (angle perp2 perp1) pi)))
				(setq insertPoint 
					(polar insertPoint (angle perp2 perp1) 5.4999333)
				)
		
			)	

			(entdel landHatch)
	
			




		);progn


	)













) ;_ end of do-array



















































(defun ad ()
  (setting)
  (adarray)
  (resetting)
  (princ)
) ;_ end of c:ad
		    		








	(command "-layer" "s" "temp1" "")
	
	(ad)

	(entdel factorline)


  	(setq myFilter
		(list 
			(cons 8 "Temp1")
		);list
  	);setq	
  	(setq panels
		(ssget "X" myFilter)
	)

	(command "chprop" panels "" "la" "0" "")


	

	
		(if(= plv 3)(command "erase" "f" fpt1 fpt2 fpt3 fpt1 "" ""))
		(if(= plv 4)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt1 "" ""))	
		(if(= plv 5)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt1 "" ""))	
		(if(= plv 6)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt1 "" ""))	
		(if(= plv 7)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt1 "" ""))	
		(if(= plv 8)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt1 "" ""))	
		(if(= plv 9)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt1 "" ""))	
		(if(= plv 10)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt1 "" ""))	
		(if(= plv 11)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt1 "" ""))	
		(if(= plv 12)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt1 "" ""))	
		(if(= plv 13)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt1 "" ""))	
		(if(= plv 14)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt1 "" ""))	
		(if(= plv 15)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt1 "" ""))	
		(if(= plv 16)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt1 "" ""))	
		(if(= plv 17)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt1 "" ""))	
		(if(= plv 18)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt1 "" ""))	
		(if(= plv 19)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt1 "" ""))	
		(if(= plv 20)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt1 "" ""))	
		(if(= plv 21)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt1 "" ""))	
		(if(= plv 22)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt1 "" ""))	
		(if(= plv 23)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt1 "" ""))	
		(if(= plv 24)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt1 "" ""))	
		(if(= plv 25)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt25 fpt1 "" ""))	
		(if(= plv 26)(command "erase" "f" fpt1 fpt2 fpt3 fpt4 fpt5 fpt6 fpt7 fpt8 fpt9 fpt10 fpt11 fpt12 fpt13 fpt14 fpt15 fpt16 fpt17 fpt18 fpt19 fpt20 fpt21 fpt22 fpt23 fpt24 fpt25 fpt26 fpt1 "" ""))



	(command "-layer" "on" "1,2,Panels" "")

	(command "chprop" panels "" "la" "Panels" "")

	(command "move" panels "" (list (car pnt2)(cadr pnt2)0) pnt2)
	
	(setq newpoint (list (car pnt1)(cadr pnt1)(caddr perp1)))
	(command "align" panels "" pnt2 pnt2 pnt3 pnt3 newpoint pnt1)
















	(setvar "osmode" oldsnap)
	(command "-layer" "lock" "1,2" "")

	);while


	
	(setvar "clayer" oldlayer)
	(if
		(entget plentname)
    		(entdel plentname)
	)
    	(setvar "osmode" oldsnap)
    	(setvar "cmdecho" oldecho)
    	(if
		(tblsearch "layer" "temp1")
		(command "-laydel" "name" "temp1" "" "yes")
	)
	(if
		(tblsearch "layer" "temp2")
		(command "-laydel" "name" "temp2" "" "yes")
	)
	(if
		(tblsearch "layer" "arr-hatch")
		(command "-laydel" "name" "arr-hatch" "" "yes")
	)
	(command "-layer" "lock" "1,2" "")
	(princ)

	

);panelmax

















(defun c:fixos ()
	(setvar "osmode" 2279)
)



















(defun c:buildarray ()
	(setq clayrr(getvar "clayer"))
	
	(if
		(tblsearch "layer" "panels")
		(command "-layer" "s" "panels" "")
		(progn
			(command "-layer" "n" "panels" "s" "panels" "")
		)
	)
		
		
	(setq
		highPt(getpoint"\nSelect High Point: ")
		lowPt1(getpoint"\nSelect Left Low point: ")
		lowPt2(getpoint"\nSelect Right Low point: ")
	)
	
	(portArray 
		(getpoint"\nSelect (Portrait) Point: ")
		highPt
		lowPt1
		lowPt2
	)

	(landArray 
		(getpoint"\nSelect (Landscape) Point: ")
		highPt
		lowPt1
		lowPt2
	)	
	

		


	(princ)
)

(defun portArray(arrayOrigin highPt lowPt1 lowPt2)
	(setq 
		oldsnap (getvar "osmode")
		oldecho (getvar "cmdecho")
	)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq 
		arrayPt1 highPt
		pArray(ssadd)
		aPt1
			(polar highPt 4.71238898 21.7289) 
		aPt2
			(polar aPt1 0 16.9999)
	)
		
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  5.4374333)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  10.874866)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)

	(setq arrayPt1 
		(polar highPt 4.71238898  16.312299)
	)
	(repeat 5
		(command "-insert" "panel" arrayPt1 "1" "1" "0")
		(ssadd (entlast) pArray)
		(setq arrayPt1 
			(polar arrayPt1 0 3.4166333)
		)
	)
	
	(command "align" pArray "" aPt1 lowPt1 aPt2 lowPt2 highPt highPt)
	(command "move" pArray "" lowPt1 arrayOrigin)


	(setvar "osmode" oldsnap)
	(setvar "cmdecho" oldecho)


	(princ)
)

(defun landArray(arrayOrigin highPt lowPoint1 lowPoint)
	(setq 
		oldsnap (getvar "osmode")
		oldecho (getvar "cmdecho")
	)
	(setvar "osmode" 0)
	(setvar "cmdecho" 0)
	
	(setq 
		arrayPt1 highPt
		lArray(ssadd)
		aPt1
			(polar highPt 4.71238898 10.0416) 
		aPt2
			(polar aPt1 0 21.9164)
	)
		
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  3.3541333)
	)
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)
	(setq arrayPt1 
		(polar highPt 4.71238898  6.7082666)
	)
	(repeat 4
		(command "-insert" "panelLand" arrayPt1 "1" "1" "0")
		(ssadd (entlast) lArray)
		(setq arrayPt1 
			(polar arrayPt1 0 5.4999333)
		)
	)

	(command "align" lArray "" aPt1 lowPt1 aPt2 lowPt2 highPt highPt)
	(command "move" lArray "" lowPt1 arrayOrigin)

	(setvar "osmode" oldsnap)
	(setvar "cmdecho" oldecho)


	(princ)
)



















(defun blockCounter (blkname)
  (vl-load-com)
  (if (and 
           (setq found (tblsearch "BLOCK" blkname))
           (setq objs (ssadd)
                 ss   (ssget "_x" '((0 . "INSERT")))
           )
      )
    (progn
      (repeat
        (setq i (sslength ss))
         (setq name (vla-get-effectivename
                      (vlax-ename->vla-object
                        (setq blk (ssname ss (setq i (1- i))))
                      )
                    )
         )
         (if (eq (strcase blkname) (strcase name))
           (ssadd blk objs)
         )
      )
      (if objs
        (sssetfirst nil objs)
      )
    )
    (cond ((not blkname)
           (princ "\n Missed name of block ***")
          )
          ((not found)
           (princ "\n Block not found in drawing !!!")
          )
          (t
           (princ "\n couldn't find any block !!! ")
          )
    )

  )
  (princ)
)




(defun c:count()
	(setq count 0)
	(blockCounter "panel")
	(setq count (sslength objs))
	(blockCounter "panelLand")
	(setq count (+ count (sslength objs)))
	(command)
	(princ)
)








(defun c:prepublish()
	(orient)
	(setq count 0)
	(blockCounter "panel")
	(setq count (sslength objs))
	(blockCounter "panelLand")
	(setq count (+ count (sslength objs)))
	(setq kw (/ (* count 260.0) 1000))
	(command)

	(princ)

	(command "autopublish" "")
)




(defun orient()
		
	(command "ctab" "model")
	
	(setq 
		south (getreal "\nOrientation of roof pointing down: ")
	);
	



	(setq
		west
			(cond
				(
					(= 360 (+ south 90))
					0
				)
				(
					(> (+ south 90) 360)
					(- south 270)
				)
				(
					(< (+ south 90) 360)
					(+ south 90)
				)
			);cond
				
		north
			(cond
				(
					(= 360 (+ south 180))
					0
				)
				(
					(> (+ south 180) 360)
					(- south 180)
				)
				(
					(< (+ south 180) 360)
					(+ south 180)
				)
			);cond
		east
			(cond
				(
					(= 0 (- south 90))
					0
				)
				(
					(> (- south 90) 0)
					(- south 90)
				)
				(
					(< (- south 90) 0)
					(+ south 270)
				)
			);cond
	);setq
	
	(_dwgru-dwgprops-set-custom-prop "south" south nil)
	(_dwgru-dwgprops-set-custom-prop "west" west nil)
	(_dwgru-dwgprops-set-custom-prop "north" north nil)
	(_dwgru-dwgprops-set-custom-prop "east" east nil)

	

	(setq arrow (ssget "_x" '((0 . "INSERT")(2 . "a"))))
	(command "rotate" arrow "" (list 242.267 151.824 0.0) (+ south 90))



	(princ)
)