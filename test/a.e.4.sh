IN='
stat
alarm off
stat
cooler 9 22C
cooler 1 18C
stat
alarm on
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 9 set to 22
success: cooler 1 set to 18
0[  ][18][  ][  ][  ][  ][  ][  ][  ][22]
alarm error: cooler 1 enabled
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")