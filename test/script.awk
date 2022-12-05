function CheckAlarm(device){
   if (alarmStatus){
      print device " error: alarm enabled";
      next;
   }
}

function AlarmOn(){
   if (alarmStatus == 1){
      print "alarm error: already enabled";
      next;
   } 

   for (i in arr){
      if (arr[i] == winOpen){
         print "alarm error: window "i" opened";
         next;
      }
   }
         
   for (i in arr){
      if(arr[i] != emptyRoom){
         print "alarm error: cooler "i" enabled";
         next;
      }
   }
      
   alarmStatus = 1;
   print "success: alarm enabled";
}

function AlarmOff(){
   if (alarmStatus == 0){
      print "alarm error: already disabled";
      next;
   } else {
      alarmStatus = 0;
      print "success: alarm disabled";
   }
}

function WindowOpen(room){
   CheckRoomRange(room, "window");
   CheckAlarm("window");

   if (arr[room] == winOpen){
      print "window error: "room" already opened";
      next;
   } else if (arr[room] != emptyRoom) {
      print "window error: cooler "room" enabled";
      next;
   }
   
   arr[room] = winOpen;
   print "success: window "room" opened";
}

function WindowClose(room){
   CheckRoomRange(room, "window");
   
   if (arr[room] == winOpen){
      print "success: window "room" closed";
      arr[room] = emptyRoom;
      next;
   } else {
      print "window error: "room" already closed";
      next;
   }   
}

function CheckRoomRange(room, device){
   if (room < 0 || room > 9) {
      print device " error: room must be between 0 and 9";
      next;
   }
}

function CheckTempRenge(temp){
   if (temp < 18 || temp > 26){
      print "cooler error: temp must be between 18 and 26";
      return 1;

   } else {
      return 0;
      }
}

function Status(){
   printf alarmStatus;
   for (i in arr){
      printf arr[i];
   }
   print ""
}

function SetTemperature(room, temp){
   if (CheckRoomRange(room, "cooler")){
      return;

   } else if (temp != "off" && CheckTempRenge(int(temp))){
      return;

   } else if (CheckAlarm("cooler")){
      return;

   } else if ((arr[room] == emptyRoom || arr[room] == winOpen) && temp == "off"){
      print "cooler error: "room" already off";
      return;

   } else if (arr[room] == winOpen) {
      print "cooler error: window "room" opened";
      return;

   } else if (temp == "off" && arr[room] != emptyRoom){
      arr[room] = emptyRoom;
      print "success: cooler "room" disabled";
      return;

   } else{
      print "success: cooler "room" set to "int(temp)"";
      arr[room] = "[" int(temp) "]";
   }   
}

function DisableAll(){
   for(i in arr){
   arr[i] = emptyRoom;
   }
   print "success: all devices are disabled";
}

BEGIN{
   winOpen = "[\\/]";
   emptyRoom = "[  ]";
   alarmStatus = 1;

   for(i = 0; i < 10; i++){
      arr[i] = emptyRoom;
   }
}

/^stat$/{
   Status();
   next;
   }

/^alarm on$/{
   AlarmOn();
   next;
   }

/^alarm off$/{
   AlarmOff();
   next;
   }

/^window [0-9]+ open$/{
   WindowOpen($2);
   next;
   }

/^window [0-9]+ close$/{
   WindowClose($2);
   next;
   }

/^cooler [0-9]+ -?([0-9]+C|off)$/{
   SetTemperature($2, $3);
   next;
   }

/^all disable$/{DisableAll();
   next;
   }

/^(#.*)?$/{
   print $0;
   next;
   }

/^exit$/{
   exit;
   }

{print "error: unknown command";}