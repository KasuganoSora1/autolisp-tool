(setq polylines (ssget "X" '((0 . "LWPOlYLINE"))))
(setq filepath (getfiled "нд╪Ч" "" "txt" 1))
(setq file (open filepath "w"))
(setq i 0)
(setq j 0)
(repeat 
	(sslength polylines)
	(setq line (entget (ssname polylines i)))
	(repeat
		(sslength line)
		
	)
	(setq i (+ i 1))
)