import '../domain.dart';

abstract class HomeDataSource {
  Future<Home> create(String name, int creator);
}
