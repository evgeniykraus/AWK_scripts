IN='
stat
window -1 close
window 0 close
window 1 close
window 2 close
stat
window 3 close
window 4 close
window 5 close
window 6 close
stat
window 7 close
window 8 close
window 9 close
window 20 close
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
error: unknown command
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: room must be between 0 and 9
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")