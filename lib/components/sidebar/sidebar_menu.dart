import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_ordering_app/components/sidebar/sidebar_menu_item.dart';

class SideBarMenu extends StatelessWidget {
  const SideBarMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        ListTile(
          title: Text(
            "Ralph",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
          subtitle: Text(
            "ralph@email.com",
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
        ),
        SideBarMenuItem(
          icon: Icons.shopping_bag,
          title: "My Orders",
        ),
        SideBarMenuItem(
          icon: Icons.person,
          title: "My Account",
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
        ),
      ],
    );
  }
}
