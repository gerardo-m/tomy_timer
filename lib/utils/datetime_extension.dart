extension DateTimeFormatter on DateTime{

  String tohhmm(){
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}