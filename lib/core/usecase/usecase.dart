import 'package:fpdart/fpdart.dart';

import '../error/failures.dart';

abstract interface class Usecase<SuccessTybe,Params>{
  Future<Either<Failures,SuccessTybe>> call(Params params);
}
class NoParams{

}
class PageParams{
String pagenum;

PageParams({
    required this.pagenum,
  });
}