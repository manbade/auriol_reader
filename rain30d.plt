#!/usr/local/bin/gnuplot -persist
set terminal png size 640,480 enhanced font "Helvetica,8"
set output '/var/www/tmp/rain30d.png'

set title "Opady atmosferyczne za ostanie 30 dni"
unset multiplot
unset key
set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0
set datafile separator "|"
set xdata time
set timefmt "%Y-%m-%d"
set format x "%Y-%m-%d"
unset mxtics
set boxwidth 0.5 relative
set style fill solid 1.0

plot "< sqlite3 database.sl3  \"SELECT strftime('%Y-%m-%d', created) AS day,  MAX(amount)-MIN(amount) FROM pluviometer WHERE created > datetime('now','localtime','-30 day') GROUP BY day\"" using 1:2 with boxes lc rgb "blue"
