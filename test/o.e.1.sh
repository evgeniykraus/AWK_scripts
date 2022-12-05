IN='
# crashcourse
  # get set!
  #     go!
stat

alarm on
alarm  of
alarm of
alarm off
cooler 0 18C
cooler 1 19C
cooler 2 20C
cooler 3 21C
cooler 4 22C
cooler 5 23C
cooler 6 24C
cooler 7 25C
cooler 8 26C
cooler 9 18C
stat
alarm on
cooler 0 off
stat
alarm on
window 0 open
alarm on
alarm   on
    alarm on
cooler 9 off
stat
alarm on
cooler 0 18C
window 0 close
alarm on
cooler 0 18C
cooler 0 2342343C
cooler off
cooler 1 off
cooler 2 off
cooler 3 off
cooler 4 off
cooler 5 off
cooler 6 off
cooler 7 off
cooler 8 off
stat
alarm on
cooler 0 off
stat
alarm on

'

OUT='
# crashcourse
error: unknown command
error: unknown command
1[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]

alarm error: already enabled
error: unknown command
error: unknown command
success: alarm disabled
success: cooler 0 set to 18
success: cooler 1 set to 19
success: cooler 2 set to 20
success: cooler 3 set to 21
success: cooler 4 set to 22
success: cooler 5 set to 23
success: cooler 6 set to 24
success: cooler 7 set to 25
success: cooler 8 set to 26
success: cooler 9 set to 18
0[18][19][20][21][22][23][24][25][26][18]
alarm error: cooler 0 enabled
success: cooler 0 disabled
0[  ][19][20][21][22][23][24][25][26][18]
alarm error: cooler 1 enabled
success: window 0 opened
alarm error: window 0 opened
error: unknown command
error: unknown command
success: cooler 9 disabled
0[\/][19][20][21][22][23][24][25][26][  ]
alarm error: window 0 opened
cooler error: window 0 opened
success: window 0 closed
alarm error: cooler 1 enabled
success: cooler 0 set to 18
cooler error: temp must be between 18 and 26
error: unknown command
success: cooler 1 disabled
success: cooler 2 disabled
success: cooler 3 disabled
success: cooler 4 disabled
success: cooler 5 disabled
success: cooler 6 disabled
success: cooler 7 disabled
success: cooler 8 disabled
0[18][  ][  ][  ][  ][  ][  ][  ][  ][  ]
alarm error: cooler 0 enabled
success: cooler 0 disabled
0[  ][  ][  ][  ][  ][  ][  ][  ][  ][  ]
success: alarm enabled
'
diff <(echo "$IN" | awk -f script.awk) <(echo "$OUT")