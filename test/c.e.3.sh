IN='
stat
cooler 2 18C
alarm off
cooler 2 18C
stat
cooler 2 off
stat
alarm on
stat
cooler 2 18C
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: alarm enabled
success: alarm disabled
success: cooler 2 set to 18
0[  ][  ][18][  ][  ][  ][  ][  ][  ][  ]
success: cooler 2 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
cooler error: alarm enabled
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")