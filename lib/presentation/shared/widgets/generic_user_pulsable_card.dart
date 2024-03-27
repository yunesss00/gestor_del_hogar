import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/core/states_managment/custom_listenable_widget.dart';
import 'package:gestor_del_hogar/modulos/auth/controller/user_status.dart';
import '../../../core/states_managment/state_manager.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../modulos/home/controller/home_controller.dart';



class GenericUserPulsableCard extends StatelessWidget {
  final homeController = StateManager.getInstance().get<HomeController>();
  final userStatusController = StateManager.getInstance().get<UserStatus>();
  final List<UserEntity> users;
  GenericUserPulsableCard({super.key, required this.users});
  
  @override
  Widget build(BuildContext context) {
    userStatusController.addUsersStatus(homeController.participantsList.value!);
    return CustomListenableWidget(
        valueListenable: homeController.participantsList,
        builder: (context, user, child) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: user?.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  _userCard(context, index, user!),
                ],
              );
            },
          );
        });
  }

  _userCard(BuildContext context, int index, data) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () {
        userStatusController.updateUserStatus(
              data[index].id.toString(), !userStatusController.usersStatus.value[data[index].id.toString()]!);
      },
      child: CustomListenableWidget(
        valueListenable: userStatusController.usersStatus,
        builder: (context, userStatus, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Card(
              color: userStatus.containsKey(data[index].id.toString()) &&
                      userStatus[data[index].id.toString()] == true
                  ? theme.primaryColor
                  : theme.primaryColorDark,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(data[index].firstName + " " + data[index].lastName1,
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
