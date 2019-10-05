;从cad中获取多线段的端点坐标何高程 其中 ; 前为高程。分号为端点坐标
(setq polylines (ssget "X" '((0 . "LWPOlYLINE"))))
(setq filepath (getfiled "文件" "" "txt" 1))
(setq file (open filepath "w"))
(setq i 0)
(repeat 
	(sslength polylines)

	(setq line (entget (ssname polylines i)))

	(setq j 0)
	;获取标高
	(repeat
		(length line)
		
		(setq line_point (nth j line))
		(if (= (car line_point) 38)
				(princ (rtos (cdr line_point) 2 4) file)
		)
		(setq j (+ j 1))
	)
	(princ ";" file)
	(setq j 0)
	(repeat
		(length line)

		(setq line_point (nth j line))
		;获取点坐标
		(if (= (car line_point) 10)
			;if yes start
			(progn
				(princ (rtos (nth 1 line_point) 2 4) file)
				(princ " " file)
				(princ (rtos (nth 2 line_point) 2 4) file)
				(princ "," file)
			)
			;if no start
			(
				
			)
		)
		(setq j (+ j 1))
	)
	(setq i (+ i 1))
	(princ "\n" file)
)
(close file)