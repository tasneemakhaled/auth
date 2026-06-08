import 'package:auth/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:auth/generated/l10n.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      obscureText: isObsure ? false : true,
      onSaved: widget.onSaved,
      keyboardType: TextInputType.visiblePassword,
      hintText: S.of(context).password,
      suffixIcon: GestureDetector(
        onTap: () {
          isObsure = !isObsure;
          setState(() {});
        },
        child: Icon(
          isObsure ? Icons.visibility : Icons.visibility_off,
          color: Color(0xff949D9E),
        ),
      ),
    );
  }
}
