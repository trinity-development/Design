;use this to initiate
;(_dwgru-dwgprops-set-custom-prop "CUSTOM PROP NAME" NEWVALUE nil










(defun _dwgru-dwgprops-get-all-prop (Doc / si ret nc key value) 
;;; Returns the file's properties, set the command _dwgprops 
;;; Returns an associative list, where the key is: 
;; - For properties created by the user (tab OTHER) 
;;; Property name 
;; - For standard properties (tab PAPER) 
;;; Key field 
;;; NAME - *TITLE* 
;;; AUTHOR - *AUTHOR* 
;;; TOPIC - *SUBJECT* 
;;; KEY WORDS - *KEYWORDS* 
;;; NOTES - *COMMENTS* 
;;; Hyperlink Base - *HYPERLINK* 
;;;!! Key fields are converted to uppercase 
;;; Doc - a pointer to the  document, nil - the current 
   
;;; Example 
;;; (_dwgru-dwgprops-get-all-prop nil) ;;;(("* AUTHOR * "" VVA ") (" * COMMENTS * "" Memo ") (" * HYPERLINK * "" Base ") 
                                ;;;("* KEYWORDS * "" Key ") (" * TITLE * "" named ") (" * SUBJECT * "" R ") (" UNIQKEY "" Key ")) 

(and
(or Doc
    (setq Doc (vla-get-activeDocument (vlax-get-acad-object)))
    )
(setq si (vla-get-SummaryInfo Doc))
(setq ret (list
	    (list "*AUTHOR*" (vla-get-author si))
	    (list "*COMMENTS*" (vla-get-comments si))
            (list "*HYPERLINK*" (vla-get-HyperlinkBase si))
	    (list "*KEYWORDS*" (vla-get-keywords si))
            (list "*TITLE*" (vla-get-Title si))
	    (list "*SUBJECT*" (vla-get-Subject si))
	    )
)
(setq nc (vla-numcustominfo si))
(while (> nc 0) 
(vla-GetCustomByIndex si (- nc 1) 'key 'value)
(setq ret (append ret (list(list (strcase key) value))))  
(setq nc (1- nc))
)
(vlax-release-object si)
)
 ret
)   



(defun _dwgru-dwgprops-get-custom-prop (key Doc / app counter counter2 counter3 doc dwgprops kv) 
;;; Returns the value of the property created by the user (command _dwgprops) 
;;; Returns an associative list, where the key is: 
;; - For properties created by the user (tab OTHER) 
;;; Key - a string property name (tab OTHER) 
;; - For standard properties (tab PAPER) 
;;; Key field 
;;; NAME - *TITLE* 
;;; AUTHOR - *AUTHOR* 
;;; TOPIC - *SUBJECT* 
;;; KEY WORDS - *KEYWORDS* 
;;; NOTES - *COMMENTS* 
;;; Hyperlink Base - *HYPERLINK* 
;;; 
;;; Uses the library 
;;; _dwgru-Dwgprops-get-all-prop 
;;; _dwgru-Assoc (_dwgru-assoc-multi) 
   
;;; Doc - a pointer to the  document, nil - the current 
   
  (cadr (_dwgru-assoc key (_dwgru-dwgprops-get-all-prop Doc))) 
) 


(defun _dwgru-dwgprops-set-custom-prop (key value Doc / si) 
;;, Create in the properties of the figure (team _dwgprops bookmark OTHER) 
;;; Property with key and value value 
;;; If the property was not, it is created, otherwise the changes 
;;; Key - a string property name (tab OTHER) 
;;; Value - a string  - value of property 
;;; Uses the library 
;;; _dwgru-Dwgprops-get-custom-prop 
;;; Doc - a pointer to the document, nil - the current 
;;; Returns - nil 
;;; Example 
;;; (_dwgru-dwgprops-set-custom-prop "dwgru" "dwgru-dwgprops-set-custom-prop" nil) 

   (or Doc 
   (setq Doc (vla-Get-ActiveDocument (vlax-Get-Acad-Object))) 
     ) 
   (setq si (vla-Get-SummaryInfo Doc)) 
   (if (_dwgru-dwgprops-get-custom-prop key Doc) 
     (vla-SetCustomByKey si key value) 
     (vla-AddCustomInfo si key value) 
   ) 
) 



(defun _dwgru-assoc-multi (key lst) 
   (if (= (type key) 'str) 
     (setq key (strcase key)) 
     ); _ End of if 
   (vl-remove-if-not 
     (function 
       (lambda (a / b) 
         (and (setq b (car a)) 
              (or (and (= (type b) 'str) (= (strcase b) key)) (equal b key)) 
              ); _ End of and 
         ); _ End of lambda 
       ); _ End of function 
     lst 
     ); _ End of vl-remove-if-not 
   ); _ End of defun 
(defun _dwgru-assoc (key lst) 
   (car (_dwgru-assoc-multi key lst)) 
   ); _ End of defun