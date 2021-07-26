void print_time_now(String identifier){
  DateTime _now = DateTime.now();
  print(identifier+': ${_now.hour}:${_now.minute}:${_now.second}.${_now.millisecond}');
}