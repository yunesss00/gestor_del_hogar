import '../domain.dart';

abstract class HomeDataSource {
  Future<Home?> create(String name, int creator);
  Future<void> addParticipants(int homeId, int participant);
  Future<Home?> findMyHome(int user);
}
