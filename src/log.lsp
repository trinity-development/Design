(defun logThis(msg /)
	(setq 
		logPath "Z:\\AUTOCAD SETTINGS\\AutoLisp\\publishLog.txt"
		user (getvar "loginname")
		curDate (rtos (getvar "CDATE") 2 4)
		curDate (strcat (substr CurDate 5 2)"/"(substr CurDate 7 2)"/"(substr CurDate 3 2) " " (substr curDate 10 2) ":" (substr curDate 12 2))
	)
	(if
		(findfile logPath)
		(progn
			(setq file(open logPath "a"))
			(setq line (strcat user ": " curDate " - " msg))
			(print line file)
			(close file)
			(princ)
		)
	)
	(princ)
)

(defun c:readLog()
	(setq
		logPath "Z:\\AUTOCAD SETTINGS\\AutoLisp\\publishLog.txt"
		file (open logpath "r")
	)
	(while
		(setq line (read-line file))
		(print line)
	)
	(princ)
)