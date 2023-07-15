import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestor_del_hogar/domain/domain.dart';
import 'package:gestor_del_hogar/infractrusture/infractrusture.dart';

class HomeState {
  final Home? home;
  final String errorMessage;

  HomeState({
    this.home,
    this.errorMessage = '',
  });

  HomeState copyWith({
    Home? home,
    String? errorMessage,
  }) =>
      HomeState(
          home: home ?? this.home,
          errorMessage: errorMessage ?? this.errorMessage);
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  final homeRepository = HomeRespositoryImpl();

  return HomeNotifier(
    homeRepository: homeRepository,
  );
});

class HomeNotifier extends StateNotifier<HomeState> {
  final HomeRepository homeRepository;

  HomeNotifier({
    required this.homeRepository,
  }) : super(HomeState());


  void create(String name, int creator) async {
    try {
      final user = await homeRepository.create(name, creator);
    } on HomeError catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
