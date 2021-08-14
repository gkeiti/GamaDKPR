import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_final_dgpr/services/auth_service.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/app_colors.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';
import 'package:trabalho_final_dgpr/shared/widgets/drawer_items.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 107,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.cyan, AppColors.purple],
                  stops: [0.1, 0.6],
                  transform: GradientRotation((45 * 3.1415) / 180),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 44.0),
                child: Text("Olá, José", style: TextStyles.white26w700Roboto),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0, top: 14.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Perfil', style: TextStyles.black54_14w400Roboto),
                  DrawerItem(
                      itemName: 'Cadastro', route: '/home/update_register'),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.drawerItemBorder),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0, top: 14.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Conta', style: TextStyles.black54_14w400Roboto),
                  DrawerItem(
                      route: '/error_home_page', itemName: 'Gerenciar cartões'),
                  DrawerItem(route: '', itemName: 'Investimentos'),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.drawerItemBorder),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0, top: 14.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Segurança', style: TextStyles.black54_14w400Roboto),
                  DrawerItem(route: '', itemName: 'Alterar senha')
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.drawerItemBorder),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0),
              width: double.infinity,
              child: DrawerItem(route: '', itemName: 'Ajuda'),
            ),
            Container(
              padding: EdgeInsets.only(left: 27.0),
              width: double.infinity,
              child: FloatingActionButton(
                onPressed: () {
                  context.read<AuthService>().signOut();
                },
                child: Text('sair'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
