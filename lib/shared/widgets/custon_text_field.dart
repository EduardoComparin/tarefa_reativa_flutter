import 'package:flutter/material.dart';

class custonInputText extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool leitura;

  const custonInputText(
      {super.key,
      required this.label,
      required this.controller,
      required this.leitura});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          readOnly: leitura,
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label,
          ),
        ),
      ),
    );
  }
}
