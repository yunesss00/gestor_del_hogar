import '../domain.dart';

abstract class HomeRepository {
  Future<Home> create(String name, int creator);
  //Future<Home> update();
}
