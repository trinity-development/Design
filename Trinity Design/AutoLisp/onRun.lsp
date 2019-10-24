(load "dwgProp")
(vl-load-com)
(if 
	(and 
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - STANDARD\\01 CAD Drawings\\")
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - GROUND MOUNT\\01 CAD Drawings\\")
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NJ RED FOLDER\\01 CAD Drawings\\")
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY  LONG ISLAND\\01 CAD Drawings\\")
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY FIVE BOROUGHS\\01 CAD Drawings\\")
		;(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY ISLIP\\01 CAD Drawings\\")

		(/= (getvar "dwgprefix") "C:\\Users\\MattBirckbichler\\Desktop\\MY TEMPLATES\\")
		(/= (getvar "dwgprefix") "C:\\Users\\MattBirckbichler\\Desktop\\MY TEMPLATES\\NY\\")
		(/= (getvar "dwgprefix") "C:\\Users\\Tamirlieber\\Desktop\\TEMPLATES\\FULL SETS\\")
		(/= (getvar "dwgprefix") "C:\\Users\\Jasonstolze\\Desktop\\TEMPLATES\\FULL SETS\\")

		(/= (getvar "userr1") 1.0)
		(= (getvar "userr2") 1.0)
	)	
	(progn
		(setvar "userr1" 1.0)
	  	(_dwgru-dwgprops-set-custom-prop "currRoof" "0" nil)
  		(_dwgru-dwgprops-set-custom-prop "currpitch" "0" nil)
		(_dwgru-dwgprops-set-custom-prop "currorientation" "0" nil)
		(_dwgru-dwgprops-set-custom-prop "maxroof" "0" nil)
  		(_dwgru-dwgprops-set-custom-prop "currEquipment" "0" nil)
  		(_dwgru-dwgprops-set-custom-prop "mainDisconnect" "0" nil)
	  	(c:protoQB)
	  	(c:3line)
		(c:makeroofs)
	  	(c:revlist)
		(c:UPDATEBLOCKS)
	  	(c:getroofs)
		
		
	)
)