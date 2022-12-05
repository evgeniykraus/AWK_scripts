IN='
stat
alarm off
stat
alarm off
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
alarm error: already disabled
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")