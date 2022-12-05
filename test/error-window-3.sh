IN='
stat
alarm off
stat
window 0 close
window 1 close
window 2 close
window 3 close
window 4 close
stat
window 5 close
window 6 close
window 7 close
window 8 close
window 9 close
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: 0 already closed
window error: 1 already closed
window error: 2 already closed
window error: 3 already closed
window error: 4 already closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: 5 already closed
window error: 6 already closed
window error: 7 already closed
window error: 8 already closed
window error: 9 already closed
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")