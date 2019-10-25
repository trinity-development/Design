(prompt "\nType TEST_DCL1 to run...")
 
(defun C:TEST_DCL1 ()
 
(setq dcl_id (load_dialog "testdcl1.DCL"))
 
     (if (not (new_dialog "testdcl1" dcl_id))
	 (exit )
     );if
 
(action_tile "accept"
    "(done_dialog)"
);action_tile
 
(start_dialog)
(unload_dialog dcl_id)
 
(princ)
 
);defun
(princ)
;AUTOLISP CODING ENDS HERE