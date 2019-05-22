(defun c:scaleup ()
	(prompt "Select Objects to Scale Up: ")
	(setq ss (ssget))
	(setq basePoint (getpoint "\nSelect Base Point: "))
	(command "scale" ss "" basePoint "r" "1" "12")
	(princ)
)




(defun c:scaledown ()
	(prompt "Select Objects to Scale Down: ")
	(setq ss (ssget))
	(setq basePoint (getpoint "\nSelect Base Point: "))
	(command "scale" ss "" basePoint "r" "12" "1")
	(princ)
)