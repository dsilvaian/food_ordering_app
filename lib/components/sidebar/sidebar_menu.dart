import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';

import 'sidebar_menu_item.dart';
import '../../screens/auth/login_page.dart';

class SideBarMenu extends StatelessWidget {
  final Function onMenuItemPressed;

  const SideBarMenu({Key key, this.onMenuItemPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    final String username = user.displayName;
    final String email = user.email;
    final String photoUrl = user.photoURL;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        ListTile(
          title: Text(
            "$username",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            "$email",
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 20,
            ),
          ),
          leading: CircleAvatar(
            child: ClipOval(
              child: Image.network(
                photoUrl,
                // width: 40,
                // fit: BoxFit.cover,
              ),
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
