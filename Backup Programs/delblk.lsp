; Delete a specified block(s) and return the number deleted.
; created by: Lamar Crowe

(Defun C:DELBLK (/ N A E)
    (prompt "\nษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออป")
    (prompt "\nบ     This routine will delete a specified block          บ")
    (prompt "\nบ  from the current drawing regardless of how many        บ")
    (prompt "\nบ  are nested in the drawing.                             บ")
    (prompt "\nบ                                                         บ")
    (prompt "\nบ     The speed at which the block is deleted is          บ")
    (prompt "\nบ  determined by the size of the drawing, so be patient.  บ")
    (prompt "\nศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ")
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
