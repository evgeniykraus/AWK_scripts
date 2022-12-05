IN='
stat
alarm off
stat
cooler 0 18C
cooler 3 18C
cooler 4 26C
stat
cooler 0 off
cooler 3 off
cooler 4 off
stat
alarm on
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 0 set to 18
success: cooler 3 set to 18
success: cooler 4 set to 26
0[18][  ][  ][18][26][  ][  ][  ][  ][  ]
success: cooler 0 disabled
success: cooler 3 disabled
success: cooler 4 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")