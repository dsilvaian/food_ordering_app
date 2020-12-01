import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

import 'sidebar_menu_item.dart';
import '../../screens/auth/login_page.dart';

class SideBarMenu extends StatelessWidget {
  final Function onMenuItemPressed;

  const SideBarMenu({Key key, this.onMenuItemPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        ListTile(
          title: Text(
            "User",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            "user@email.com",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 20,
            ),
          ),
          leading: CircleAvatar(
            child: SvgPicture.asset(
              "assets/icons/burger_beer.svg",
              width: 40,
            ),
            backgroundColor: Colors.white,
            radius: 40,
          ),
        ),
        Divider(
          height: 64,
          thickness: 0.5,
          color: Colors.white.withOpacity(0.5),
          indent: 32,
          endIndent: 32,
        ),
        SideBarMenuItem(
            icon: Icons.home,
            title: "Home",
            onTap: () {
              onMenuItemPressed();
            }),
        SideBarMenuItem(
          icon: Icons.shopping_bag,
          title: "My Orders",
          onTap: () {
            onMenuItemPressed();
          },
        ),
        SideBarMenuItem(
          icon: Icons.person,
          title: "My Account",
          onTap: () {
            onMenuItemPressed();
          },
        ),
        Divider(
          height: 64,
          thickness: 0.5,
          color: Colors.white.withOpacity(0.5),
          indent: 32,
          endIndent: 32,
        ),
        SideBarMenuItem(
          icon: Icons.exit_to_app,
          title: "Logout",
          onTap: () {
            context.read<AuthService>().signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            }), ModalRoute.withName('/'));
          },
        ),
      ],
    );
  }
}
