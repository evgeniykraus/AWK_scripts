IN='
stat
window -1 open
window 0 open
window 1 open
window 2 open
window 3 open
window 4 open
stat
window 5 open
window 6 open
window 7 open
window 8 open
window 9 open
window 10 open
stat
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
error: unknown command
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: alarm enabled
window error: room must be between 0 and 9
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")