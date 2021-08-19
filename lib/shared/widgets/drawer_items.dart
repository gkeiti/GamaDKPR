import 'package:flutter/material.dart';
import 'package:trabalho_final_dgpr/shared/app_constants/text_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.route,
    required this.itemName,
  }) : super(key: key);

  final String route;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Text(itemName, style: TextStyles.black87_16w500Roboto),
      ),
    );
  }
}
//implementar botao de logout no drawer
// LogoutButton()
//import 'package:trabalho_final_dgpr/shared/widgets/logout_button.dart';
