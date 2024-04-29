class ServerExcepiton implements Exception{
  final String massage;

  ServerExcepiton(this.massage);
}

class EmptyExcepiton implements Exception{
  final bool isEmpty;

  EmptyExcepiton(this.isEmpty);
}