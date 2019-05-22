
;-------------------------------------------------------------------------------
(defun c:SayIt (/ Phrase$ Sapi)
  (if (setq Phrase$ (getstring "\nEnter phrase: " t))
    (progn
      (setq Sapi (vlax-create-object "Sapi.SpVoice"))
      (vlax-invoke Sapi "Speak" Phrase$ 0)
      (vlax-release-object Sapi)
    );progn
  );if
  (princ)
);defun c:SayIt
;-------------------------------------------------------------------------------
; SayIt - Says Phrase$ through computer speakers
; Arguments: 1
;   Phrase$ = Phrase to say
; Returns: Says Phrase$ through computer speakers
;-------------------------------------------------------------------------------
(defun SayIt (Phrase$ / Sapi)
  (setq Sapi (vlax-create-object "Sapi.SpVoice"))
  (vlax-invoke Sapi "Speak" Phrase$ 0)
  (vlax-release-object Sapi)
  (princ)
)
;-------------------------------------------------------------------------------
(princ);End of SayIt.lsp