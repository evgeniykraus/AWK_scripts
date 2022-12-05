IN='
stat
alarm off
stat
cooler 23 18C
cooler 01 65C
cooler 02 dsfdf
cooler -1 118C
cooler 74 128C
alarm on
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: room must be between 0 and 9
cooler error: temp must be between 18 and 26
error: unknown command
error: unknown command
cooler error: room must be between 0 and 9
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")