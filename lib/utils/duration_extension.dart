extension DurationFormatter on Duration{

  String tommss(){
    int totalSeconds = inSeconds;
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String tommssxx(){
    int totalSeconds = inSeconds;
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    int totalMilliseconds = inMilliseconds;
    int milliseconds = totalMilliseconds - (totalSeconds * 1000);
    int toShow = milliseconds ~/ 10;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}:${toShow.toString().padLeft(2, '0')}';
  }
}