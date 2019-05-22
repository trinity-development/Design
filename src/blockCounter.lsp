(vl-load-com)
(defun blockCounter (blkname)
  (if (and 
           (setq found (tblsearch "BLOCK" blkname))
           (setq objs (ssadd)
                 ss   (ssget "_x" '((0 . "INSERT")))
           )
      )
    (progn
      (repeat
        (setq i (sslength ss))
         (setq name (vla-get-effectivename
                      (vlax-ename->vla-object
                        (setq blk (ssname ss (setq i (1- i))))
                      )
                    )
         )
         (if (eq (strcase blkname) (strcase name))
           (ssadd blk objs)
         )
      )
      (if objs
        (sssetfirst nil objs)
      )
    )
    (cond ((not blkname)
           (princ "\n Missed name of block ***")
          )
          ((not found)
           (princ "\n Block not found in drawing !!!")
          )
          (t
           (princ "\n couldn't find any block !!! ")
          )
    )

  )
  (princ)
)