;��cad���ļ���ȡ������ ��λ����ο�������
(setq points (ssget "X" '((0 . "INSERT"))))
(setq i 0)
(setq filepath (getfiled "�ļ�" "" "txt" 1))
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