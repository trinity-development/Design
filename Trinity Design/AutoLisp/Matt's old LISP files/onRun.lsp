(if 
	(and 
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - STANDARD\\01 CAD Drawings\\")
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - GROUND MOUNT\\01 CAD Drawings\\")
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NJ RED FOLDER\\01 CAD Drawings\\")
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY  LONG ISLAND\\01 CAD Drawings\\")
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY FIVE BOROUGHS\\01 CAD Drawings\\")
		(/= (getvar "dwgprefix") "Z:\\1. RESIDENTIAL JOBS\\001 Residential Jobs\\001-11x17 TEMPLATE - NY ISLIP\\01 CAD Drawings\\")

		(/= (getvar "dwgprefix") "C:\\Users\\MattBirckbichler\\Desktop\\MY TEMPLATES\\")
		(/= (getvar "dwgprefix") "C:\\Users\\MattBirckbichler\\Desktop\\MY TEMPLATES\\NY\\")
		
		(/= (getvar "dwgprefix") "C:\\Users\\Jasonstolze\\Desktop\\TEMPLATES\\FULL SETS\\")

		(/= (getvar "userr1") 1.0)
		(= (getvar "userr2") 1.0)
	)	
	(progn
		(c:3line)
		(setvar "userr1" 1.0)
	)
)