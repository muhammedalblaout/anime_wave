import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract interface class ConnectionChecker{
  Future<bool> get isConnecred;
}
class ConnectionCheckerImp implements ConnectionChecker{
  final InternetConnection internetConnection;

  ConnectionCheckerImp(this.internetConnection);

  @override
  Future<bool> get isConnecred async => await internetConnection.hasInternetAccess;

}