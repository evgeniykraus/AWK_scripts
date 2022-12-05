IN='
stat
alarm off
stat
window 5 open
window 5 open
window 6 open
window 6 open
window 7 open
window 7 open
stat
window 8 open
window 8 open
window 9 open
window 9 open
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 5 opened
window error: 5 already opened
success: window 6 opened
window error: 6 already opened
success: window 7 opened
window error: 7 already opened
0[  ][  ][  ][  ][  ][\/][\/][\/][  ][  ]
success: window 8 opened
window error: 8 already opened
success: window 9 opened
window error: 9 already opened
0[  ][  ][  ][  ][  ][\/][\/][\/][\/][\/]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")