import 'package:flutter/material.dart';
import 'package:flutter_fashion/models/cart.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:flutter_fashion/screens/home.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<User>(
      model: User(),
      child: ScopedModelDescendant<User>(
        rebuildOnChange: true,
        builder: (context, child, model) {
          return ScopedModel<Cart>(
            model: Cart(model),
            child: MaterialApp(
              title: 'Flutter Fashion',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: Color.fromARGB(255, 4, 125, 141),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
