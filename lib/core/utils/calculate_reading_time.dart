int CalculateReadingTime(String string){
  final wordCount=string.split(RegExp(r'\s+')).length;
  final readingTime=wordCount/255;
  return readingTime.ceil();
}