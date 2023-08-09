import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final void Function(String) onChanged;

  const CustomTextField({
    required this.onChanged,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: TextField(
        onChanged: onChanged,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: "Search",
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.deepPurple),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
