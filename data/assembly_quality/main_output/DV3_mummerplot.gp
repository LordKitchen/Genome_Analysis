set terminal x11 font "Courier,8"
set xtics rotate ( \
 "CP100443.1" 1.0, \
 "CP100444.1" 9084844.0, \
 "" 10838897 \
)
set ytics ( \
 "contig_4_pilon" 1.0, \
 "contig_1_pilon" 551129.0, \
 "*contig_3_pilon" 7559034.0, \
 "contig_2_pilon" 7751284.0, \
 "" 8783868 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set xrange [1:10838897]
set yrange [1:8783868]
set style line 1  lt 1 lw 2 pt 6 ps 1
set style line 2  lt 3 lw 2 pt 6 ps 1
set style line 3  lt 2 lw 2 pt 6 ps 1
plot \
 "DV3_mummerplot.fplot" title "FWD" w lp ls 1, \
 "DV3_mummerplot.rplot" title "REV" w lp ls 2

print "-- INTERACTIVE MODE --"
print "consult gnuplot docs for command list"
print "mouse 1: coords to clipboard"
print "mouse 2: mark on plot"
print "mouse 3: zoom box"
print "'h' for help in plot window"
print "enter to exit"
pause -1
