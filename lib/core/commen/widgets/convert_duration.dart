String ConvertDuration(Duration duration, Duration pos){
  if(duration.inHours==0){
    if(duration.inMinutes==0){
      return "${(pos.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
    }
    return "${pos.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(pos.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
  }
 return "${pos.inHours.toString().padLeft(2, '0')}:${pos.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(pos.inSeconds.remainder(60).toString().padLeft(2, '0'))}";
}