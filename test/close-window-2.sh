IN='
stat
alarm off
stat
window 5 open
window 5 close
window 6 open
window 6 close
stat
window 7 open
window 7 close
window 8 open
window 8 close
window 9 open
window 9 close
stat

'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 5 opened
success: window 5 closed
success: window 6 opened
success: window 6 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 7 opened
success: window 7 closed
success: window 8 opened
success: window 8 closed
success: window 9 opened
success: window 9 closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")