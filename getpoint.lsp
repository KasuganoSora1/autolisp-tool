;从cad中文件获取点坐标 点位“快参考”类型
(setq points (ssget "X" '((0 . "INSERT"))))
(setq i 0)
(setq filepath (getfiled "文件" "" "txt" 1))
(setq file (open filepath "w"))
(repeat
	(sslength points)
	(setq li 
		(assoc 10 
			(entget (ssname points i))
		)
	)
	(print 
		li
	)
	(princ
		(rtos (nth 1 li) 2 4)
		file
	)
	(princ " " file)
	(princ
		(rtos (nth 2 li) 2 4)
		file
	)
	(princ " " file)
	(princ
		(rtos (nth 3 li) 2 4)
		file
	)
	(princ "\n" file)
	(setq i (+ i 1))
)
(close file)