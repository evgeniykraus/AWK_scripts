IN='
stat
alarm off
stat
window 9 open
cooler 1 18C
stat
alarm on
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 9 opened
success: cooler 1 set to 18
0[  ][18][  ][  ][  ][  ][  ][  ][  ][\/]
alarm error: window 9 opened
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")