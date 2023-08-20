import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

// ignore: camel_case_types
class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl =
        "https://media.licdn.com/dms/image/D5603AQH4MkBGlmY3eg/profile-displayphoto-shrink_800_800/0/1665503124245?e=2147483647&v=beta&t=Xx9WKTUisLV74SSFzKbFwFLZv2qKYxXaHFXi8bDl3n8";
    return Drawer(
      child: Container(
        color: Colors.indigoAccent,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text(
                  "Soumyadeep Dandpat",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                accountEmail: Text(
                  "soumyadeepdandapat@gmail.com",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "HOME",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "PROFILE",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "EMAIL",
                textScaleFactor: 1.3,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
