import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:flutter_fashion/screens/login_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
      height: 170.0,
      child: Stack(
        children: [
          Positioned(
            child: Text(
              "Flutter\nFashion",
              style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold),
            ),
            top: 8.0,
            left: 0.0,
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: ScopedModelDescendant<User>(
              builder: (context, child, model) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá, ${!model.isLoggedIn() ? "" : model.userData['name']}",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!model.isLoggedIn()) {
                        return Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      }
                      model.signOut();
                    },
                    child: Text(
                      !model.isLoggedIn() ? "Entre ou cadastre-se >" : "Sair",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
