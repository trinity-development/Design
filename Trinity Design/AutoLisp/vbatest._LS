(defun c:callvba()
  (command "vbaload" "Draw(2-5-18).dvb")
  (command "-vbarun" "Module1.revisionlist")
)