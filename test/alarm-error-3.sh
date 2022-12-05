IN='
stat
alarm off
stat
window 9 open
window 1 open
stat
alarm on
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: window 9 opened
success: window 1 opened
0[  ][\/][  ][  ][  ][  ][  ][  ][  ][\/]
alarm error: window 1 opened
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")