IN='
stat
alarm off
window 3 open
window 0 open
stat
cooler 0 18C
cooler 2 18C
stat
cooler 3 18C
cooler 9 22C
stat
window 3 close
window 0 close
stat
cooler 3 20C
stat
cooler 2 off
cooler 9 off
cooler 3 off
stat
alarm on
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
success: window 3 opened
success: window 0 opened
0[\/][  ][  ][\/][  ][  ][  ][  ][  ][  ]
cooler error: window 0 opened
success: cooler 2 set to 18
0[\/][  ][18][\/][  ][  ][  ][  ][  ][  ]
cooler error: window 3 opened
success: cooler 9 set to 22
0[\/][  ][18][\/][  ][  ][  ][  ][  ][22]
success: window 3 closed
success: window 0 closed
0[  ][  ][18][  ][  ][  ][  ][  ][  ][22]
success: cooler 3 set to 20
0[  ][  ][18][20][  ][  ][  ][  ][  ][22]
success: cooler 2 disabled
success: cooler 9 disabled
success: cooler 3 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")