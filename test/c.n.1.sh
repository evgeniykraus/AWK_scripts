IN='
stat
alarm off
stat
cooler 0 18C
stat
cooler 0 26C
stat
cooler 1 18C
stat
cooler 1 23C
stat
cooler 1 26C
stat
cooler 2 18C
stat
cooler 2 19C
stat
cooler 2 23C
stat
cooler 2 26C
stat
cooler 3 18C
stat
cooler 3 22C
stat
cooler 4 18C
cooler 5 26C
stat
cooler 0 18C
stat
cooler 5 20C
cooler 6 22C
stat
cooler 7 22C
stat
cooler 9 18C
stat
cooler 8 18C
stat
'

OUT='
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 0 set to 18
0[18][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 0 set to 26
0[26][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 1 set to 18
0[26][18][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 1 set to 23C
0[26][23][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 1 set to 26
0[26][26][  ][  ][  ][  ][  ][  ][  ][  ]
success: cooler 2 set to 18
0[26][26][18][  ][  ][  ][  ][  ][  ][  ]
success: cooler 2 set to 19
0[26][26][19][  ][  ][  ][  ][  ][  ][  ]
success: cooler 2 set to 23
0[26][26][23][  ][  ][  ][  ][  ][  ][  ]
success: cooler 2 set to 26
0[26][26][26][  ][  ][  ][  ][  ][  ][  ]
success: cooler 3 set to 18
0[26][26][26][18  ][  ][  ][  ][  ][  ][  ]
success: cooler 3 set to 22
0[26][26][26][22][  ][  ][  ][  ][  ][  ]
success: cooler 4 set to 18
success: cooler 5 set to 26
0[26][26][26][26][18][26][  ][  ][  ][  ]
success: cooler 0 set to 18
0[18][26][26][26][18][26][  ][  ][  ][  ]
success: cooler 5 set to 20
success: cooler 6 set to 22
0[18][26][26][26][18][20][22][  ][  ][  ]
success: cooler 7 set to 22
0[18][26][26][26][18][20][22][22][  ][  ]
success: cooler 9 set to 18
0[18][26][26][26][18][20][22][22][  ][18]
success: cooler 8 set to 18
0[18][26][26][26][18][20][22][22][18][18]
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")