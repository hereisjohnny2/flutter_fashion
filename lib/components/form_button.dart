import 'package:flutter/material.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    Key key,
    @required this.formKey,
    this.label,
    this.signFunc,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String label;
  final Function signFunc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.0,
      child: ElevatedButton(
        child: Text(
          label,
          style: TextStyle(fontSize: 18.0),
        ),
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          if (formKey.currentState.validate()) {}
          signFunc();
        },
      ),
    );
  }
}
