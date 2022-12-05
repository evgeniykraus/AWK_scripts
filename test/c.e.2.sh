IN='
stat
alarm off
stat
cooler 2 181C
cooler 0 -65C
cooler 7 2C
alarm on
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: temp must be between 18 and 26
cooler error: temp must be between 18 and 26
cooler error: temp must be between 18 and 26
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")