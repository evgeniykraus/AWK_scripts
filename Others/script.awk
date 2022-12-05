function CheckWindow(room, action){
   if (arr[room] == emptyRoom && action == "close"){
      print "window error: "room" already closed";
      return 0;

   } else if (arr[room] != emptyRoom && arr[room] != winOpen && action == "close"){
      print "window error: "room" already closed";
      return 0;

   } else if (arr[room] != emptyRoom && arr[room] != winOpen && action == "open"){
      print "window error: cooler "room" enabled";
      return 0;

   } else if (arr[room] == winOpen && action == "open"){
      print "window error: "room" already opened";
      return 0;

   } else {
      return 1;
   }
}

function CheckRoomNumber(room, device){
   if (room < 0 || room > 9) {
      print device " error: room must be between 0 and 9";
      return 1;

   } else{
      return 0;
   }
}

function CheckTemp(temp){
   if (temp < 18 || temp > 26){
      print "cooler error: temp must be between 18 and 26";
      return 1;

   } else {
      return 0;
      }
}

function CheckAlarm(device){
   if (alarmStatus){
      print device " error: alarm enabled";
      return 1;

   } else{
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

function Alarm(switch){
   if (switch == "on" && alarmStatus == 1){
      print "alarm error: already enabled";
      return;

   } else if (switch == "off" && alarmStatus == 0){
      print "alarm error: already disabled";
      return;

   } else if (switch == "on" && alarmStatus == 0){

      for (i in arr){
         if (arr[i] == winOpen){
            print "alarm error: window "i" opened";
            return;
         }
      }
         
         for (i in arr){
          if(arr[i] != emptyRoom){
            print "alarm error: cooler "i" enabled";
            return;
         }
      }

      alarmStatus = 1;
      print "success: alarm enabled";
   }

   if (switch == "off" && alarmStatus == 1){
      alarmStatus = 0;
      print "success: alarm disabled";
   }
}

function WindowAction(room, action){
   if (CheckRoomNumber(room, "window")){
      return;

   } else if (CheckAlarm("window")){
      return;

   } else if (action == "open" && CheckWindow(room, action)){
      print "success: window "room" opened";
      arr[room] = winOpen;
      return;

   } else if (action == "close" && CheckWindow(room, action)){
      print "success: window "room" closed";
      arr[room] = emptyRoom;
      return;
   }
}

function SetTemperature(room, temp){
   if (CheckRoomNumber(room, "cooler")){
      return;

   } else if (temp != "off" && CheckTemp(int(temp))){
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
   qwe = "["22"]";

   for(i = 0; i < 10; i++){
      arr[i] = emptyRoom;
   }
}


/^stat$/{
   Status();
   next;
   }

/^alarm (off|on)$/{
   Alarm($2);
   next;
   }

/^window [0-9]+ (open|close)$/{
   WindowAction($2, $3);
   next;
   }

/^cooler [0-9]+ -?([0-9]+C|off)$/{
   SetTemperature($2, $3);
   next;
   }

/^all disable$/{DisableAll();
   next;
   }

/^\s*$|(#.*)/{
   print $0;
   next;
   }

/^exit$/{
   exit;
   }
{print int(qwe);}
{print qwe == "["23"]";}
# {print "error: unknown command";}