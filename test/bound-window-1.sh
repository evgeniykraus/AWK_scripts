IN='
stat
window 0 open
window 9 open
window 0 close
window 9 close
stat
alarm off
stat
window 0 open
window 0 open
window 9 close
window 9 open
stat
window 9 open
window 0 close
window 0 close
window 9 close
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 0 opened
window error: 0 already opened
window error: 9 already closed
success: window 9 opened
0[\/][  ][  ][  ][  ][  ][  ][  ][  ][\/]
window error: 9 already opened
success: window 0 closed
window error: 0 already closed
success: window 9 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")