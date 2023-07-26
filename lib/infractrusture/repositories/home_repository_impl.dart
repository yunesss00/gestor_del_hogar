import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

class HomeRespositoryImpl extends HomeRepository {
  final HomeDataSource dataSource;
  HomeRespositoryImpl({HomeDataSource? dataSource})
      : dataSource = dataSource ?? HomeDataSourceImpl();

  @override
  Future<Home?> create(String name, int creator) {
    return dataSource.create(name, creator);
  }

  @override
  Future<void> addParticipants(int homeId, int participant) {
    return dataSource.addParticipants(homeId, participant);
  }
  
  @override
  Future<Home?> findMyHome(int user) {
    return dataSource.findMyHome(user);
  }
}
