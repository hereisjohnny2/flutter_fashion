import 'package:flutter/material.dart';
import 'package:flutter_fashion/components/form_button.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:flutter_fashion/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              'Criar Conta'.toUpperCase(),
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
          )
        ],
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty || !text.contains("@"))
                      return "Email inválido";
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "Senha"),
                  obscureText: true,
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty || text.length < 6)
                      return "Senha inválida";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      if (_emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "Precisamos do email para recuperar sua senha!"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      model.recoveryPass(_emailController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Verifique o link no seu email!"),
                          backgroundColor: Theme.of(context).primaryColor,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    },
                    child: Text(
                      "Esqueci minha senha",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                      textAlign: TextAlign.right,
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                FormButton(
                  formKey: formKey,
                  label: "Entrar",
                  signFunc: () {
                    model.signIn(
                      email: _emailController.text,
                      password: _passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Login realizado com sucesso"),
                            backgroundColor: Theme.of(context).primaryColor,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Future.delayed(Duration(seconds: 2))
                            .then((_) => Navigator.of(context).pop());
                      },
                      onFailed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Não foi possivel realizar o login"),
                            backgroundColor: Colors.redAccent,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
