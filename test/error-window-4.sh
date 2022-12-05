IN='
stat
alarm off
stat
window 20 open
window -16 open
window –1 closed
window 10 close
window +25 close
window 5 closed
stat
window 555 open
window -5- open
window  open
window -20 open
window -5 open
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: room must be between 0 and 9
error: unknown command
error: unknown command
window error: room must be between 0 and 9
error: unknown command
error: unknown command
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: room must be between 0 and 9
error: unknown command
error: unknown command
error: unknown command
error: unknown command
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")