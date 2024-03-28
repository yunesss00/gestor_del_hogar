import 'package:flutter/material.dart';
import 'package:gestor_del_hogar/presentation/shared/shared.dart';
import 'package:go_router/go_router.dart';

import '../../../modulos/auth/controller/auth_controller.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;
    final AuthController authController = AuthController();



    return NavigationDrawer(
      elevation: 1,
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {

        setState(() {
          navDrawerIndex = value;
        });

        // final menuItem = appMenuItems[value];
        // context.push( menuItem.link );
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [

        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
          child: Text('Saludos', style: textStyles.titleMedium ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 16, 10),
          child: Text('Tony Stark', style: textStyles.titleSmall ),
        ),



        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: TextButton.icon(
              onPressed: () {
                context.push('/my-home-screen');
              },
              icon: const Icon(Icons.home_rounded),
              label: const Text('Mi hogar'))
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.build_rounded ),
              label: const Text('Opciones'))
          ),
        ),

        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomFilledButton(
            onPressed: () async{
              await authController.logout();
              context.push('/login-screen');
            },
            text: 'Cerrar sesión'
          ),
        ),

      ]
    );
  }
}