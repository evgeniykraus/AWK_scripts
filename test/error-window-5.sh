IN='
stat
alarm off
stat
window 0 open
window 0 open
window 1 open
window 1 open
window 2 open
window 2 open
stat
window 3 open
window 3 open
window 4 open
window 4 open
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 0 opened
window error: 0 already opened
success: window 1 opened
window error: 1 already opened
success: window 2 opened
window error: 2 already opened
0[\/][\/][\/][  ][  ][  ][  ][  ][  ][  ]
success: window 3 opened
window error: 3 already opened
success: window 4 opened
window error: 4 already opened
0[\/][\/][\/][\/][\/][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")