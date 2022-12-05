IN='
stat
alarm off
cooler 3 18C
stat
cooler 2 off
cooler 8 off
cooler 3 off
stat
alarm on
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
success: cooler 3 set to 18
0[  ][  ][  ][18][  ][  ][  ][  ][  ][  ]
cooler error: 2 already off
cooler error: 8 already off
success: cooler 3 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")