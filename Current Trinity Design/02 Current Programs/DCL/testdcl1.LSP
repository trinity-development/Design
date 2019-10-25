(prompt "\nType TEST_DCL1 to run...")
 
(defun C:TEST_DCL1 ()
 
(setq dcl_id (load_dialog "testdcl1.DCL"))
 
     (if (not (new_dialog "testdcl1" dcl_id))
	 (exit )
     );if
 
(set_tile "name" "Enter Name Here")
(mode_tile "name" 2)
(action_tile "name" "(setq name $value)")
(action_tile "age" "(setq age $value)")
(action_tile "accept" "(val1)")
 
(start_dialog)
(unload_dialog dcl_id)
 (alert (strcat "Your name is " name "\nand you are " age " years old."))
(princ)
 
);defun
(princ)
;AUTOLISP CODING ENDS HERE
(defun val1()
  (if (= (get_tile "name") "Enter Name Here")
    (progn
      (set_tile "error" "You Must Enter a name!")
      (mode_tile "name" 2)
    )
    (val2)
  )
)

(defun val2()
  (if (< (atoi (get_tile "age")) 1)
    (progn
      (set_tile "error" "Invalid age")
      (mode_tile "age" 2)
    )
    (done_dialog)
  )
)