import 'package:flutter/material.dart';
import 'package:flutter_fashion/components/form_button.dart';
import 'package:flutter_fashion/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _onSuccess() {}

    void _onFailed() {}

    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<User>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Nome Completo"),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Nome necessário";
                  },
                ),
                SizedBox(height: 16.0),
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
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(hintText: "Endereço"),
                  // ignore: missing_return
                  validator: (text) {
                    if (text.isEmpty) return "Endereço necessário";
                  },
                ),
                SizedBox(
                  height: 18.0,
                ),
                FormButton(
                  formKey: formKey,
                  label: "Criar",
                  signFunc: () {
                    model.signUp(
                      userData: {
                        'name': _nameController.text,
                        'email': _emailController.text,
                        'address': _addressController.text,
                      },
                      password: _passwordController.text,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Usuário criado com sucesso"),
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
                            content: Text("Algo deu errado"),
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
