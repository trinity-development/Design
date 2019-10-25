; Delete a specified block(s) and return the number deleted.
; created by: Lamar Crowe

(Defun C:DELBLK (/ N A E)
    (prompt "\n���������������������������������������������������������ͻ")
    (prompt "\n�     This routine will delete a specified block          �")
    (prompt "\n�  from the current drawing regardless of how many        �")
    (prompt "\n�  are nested in the drawing.                             �")
    (prompt "\n�                                                         �")
    (prompt "\n�     The speed at which the block is deleted is          �")
    (prompt "\n�  determined by the size of the drawing, so be patient.  �")
    (prompt "\n���������������������������������������������������������ͼ")
        (Setq N (Strcase (Getstring "\n\nEnter block name to delete ... ")))
        (Setq A 0)
        (Setq E (Entnext))
            (While E
              (If (= N (cdr (Assoc 2 (Entget E))))(progn
                    (Entdel E)
                    (Setq A (1+ A))
                    )
              )
         (Setq E (Entnext E)))
    (Prompt "\n")
    (prompt (Itoa A))
    (prompt " blocks deleted"\n)
    (Princ)
)
