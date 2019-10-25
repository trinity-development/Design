(defun c:redif2()
(IF (TBLSEARCH "BLOCK" 
"productionMeter_Dyn")

     (COMMAND "INSERT" 
"productionMeter_Dyn=Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\productionMeter_Dyn.dwg" "Y" PAUSE PAUSE PAUSE 
PAUSE)

     (COMMAND "INSERT" 
"Z:\\1. RESIDENTIAL JOBS\\006 Block Library\\3LINE TEMPLATES\\productionMeter_Dyn.dwg" PAUSE PAUSE PAUSE PAUSE)

)
)