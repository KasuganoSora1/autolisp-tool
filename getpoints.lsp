;;获取先择多线段的端点
(setq point1 (getpoint "first  point:"))
(setq point2 (getpoint "second point:"))
(setq polylines (ssget "C" point1 point2))
(setq lines (entget (ssname polylines 0)))
(setq filepath (getfiled "文件" "" "txt" 1))
(setq file (open filepath "W"))
(foreach
    line
    lines
    (if (= 10 (nth 0 line))
        (progn
            (princ (rtos (nth 1 line) 2 2) file)
            (princ "," file)
            (princ (rtos (nth 2 line) 2 2) file)
            (princ "\n" file)
        )
        ()
    )
)
(close file)