IN='
stat
alarm off
stat
alarm on
'
OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")