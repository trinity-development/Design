(defun c:newarray()
  (command "vbaload" "Draw(1).dvb")
  (command "-vbarun" "Module1.newarray")
)