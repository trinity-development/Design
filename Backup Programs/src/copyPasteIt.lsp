(defun c:copyit()
	(command "copybase" "0,0,0")
	(princ)
)

(defun c:pasteit()
	(command "pasteclip" "0,0,0")
	(princ)
)