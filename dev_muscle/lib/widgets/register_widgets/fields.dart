// ignore_for_file: must_be_immutable

import "package:dev_muscle/components/styles.dart";
import "package:flutter/material.dart";
import "package:form_validator/form_validator.dart";
import 'package:intl_phone_field/intl_phone_field.dart';
import "package:intl_phone_field/phone_number.dart";

class PasswordField extends StatefulWidget {
  final String label;
  final void Function(String?) onSaved;

  PasswordField({super.key, required this.label, required this.onSaved});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isOpen = true;
  Color _passwordTextColor = Colors.white;

  FocusNode _focusNodePassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isOpen,
      autocorrect: false,
      keyboardType: TextInputType.text,
      focusNode: _focusNodePassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecorations.RegisterLoginInputDec(
          widget.label, _passwordTextColor,
          isOpen: _isOpenPassword),
      onSaved: widget.onSaved,
      validator: ValidationBuilder()
          .minLength(8, "Password must be at least 8 characters")
          .build(),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  GestureDetector _isOpenPassword() {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isOpen = !_isOpen;
          });
        },
        child: Icon(_isOpen ? Icons.visibility_off : Icons.visibility));
  }

  void _onPasswordFocusChange() {
    setState(() {
      _passwordTextColor =
          _focusNodePassword.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class MailField extends StatefulWidget {
  void Function(String?) onSaved;
  bool readOnly;
  String? initialValue;
  MailField(
      {Key? key,
      required this.onSaved,
      this.readOnly = false,
      this.initialValue = null})
      : super(key: key);

  @override
  State<MailField> createState() => _MailFieldState();
}

class _MailFieldState extends State<MailField> {
  FocusNode _focusNodeMail = FocusNode();

  Color _emailTextColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNodeMail,
      onSaved: widget.onSaved,
      readOnly: widget.readOnly,
      style: const TextStyle(color: Colors.white),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecorations.RegisterLoginInputDec("E-Mail", _emailTextColor)
              .copyWith(suffixIcon: Icon(Icons.mail)),
      validator: ValidationBuilder().email().minLength(5).maxLength(50).build(),
      initialValue: widget.initialValue,
    );
  }

  @override
  void dispose() {
    _focusNodeMail.dispose();
    super.dispose();
  }

  void _onEmailFocusChange() {
    setState(() {
      _emailTextColor =
          _focusNodeMail.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class NameandSurnameField extends StatefulWidget {
  void Function(String?) onSaved;
  String label;
  String initialValue;
  NameandSurnameField(
      {Key? key,
      required this.onSaved,
      required this.label,
      this.initialValue = ""})
      : super();

  @override
  State<NameandSurnameField> createState() => _NameandSurnameFieldState();
}

class _NameandSurnameFieldState extends State<NameandSurnameField> {
  FocusNode _focusNode = FocusNode();
  Color _textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onSaved: widget.onSaved,
      style: const TextStyle(color: Colors.white),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecorations.RegisterLoginInputDec(widget.label, _textColor),
      validator: ValidationBuilder().minLength(3).maxLength(20).build(),
      initialValue: widget.initialValue,
    );
  }

  void _onFocusChange() {
    setState(() {
      _textColor = _focusNode.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class DescribeForPTField extends StatefulWidget {
  void Function(String?) onSaved;
  String initialValue;
  DescribeForPTField(
      {super.key, required this.initialValue, required this.onSaved});
  @override
  State<DescribeForPTField> createState() => _DescribeForPTFieldState();
}

class _DescribeForPTFieldState extends State<DescribeForPTField> {
  FocusNode _focusNode = FocusNode();

  Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onSaved: widget.onSaved,
      style: const TextStyle(color: Colors.white),
      autocorrect: true,
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecorations.RegisterLoginInputDec("Description", _textColor),
      validator: ValidationBuilder().minLength(20).maxLength(400).build(),
      initialValue: widget.initialValue,
    );
  }

  void _onFocusChange() {
    setState(() {
      _textColor = _focusNode.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class ProfessionField extends StatefulWidget {
  void Function(String?) onSaved;
  String initialValue;
  bool readOnly;
  ProfessionField(
      {Key? key,
      required this.initialValue,
      required this.onSaved,
      this.readOnly = false});
  @override
  State<ProfessionField> createState() => _ProfessionFieldState();
}

class _ProfessionFieldState extends State<ProfessionField> {
  FocusNode _focusNode = FocusNode();

  Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      onSaved: widget.onSaved,
      style: const TextStyle(color: Colors.white),
      autocorrect: true,
      readOnly: widget.readOnly,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecorations.RegisterLoginInputDec(
          "Profession Field", _textColor),
      validator: ValidationBuilder().minLength(5).maxLength(50).build(),
      initialValue: widget.initialValue,
    );
  }

  void _onFocusChange() {
    setState(() {
      _textColor = _focusNode.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}

class PhoneNumberField extends StatefulWidget {
  void Function(PhoneNumber?) onChanged;
  String initialValue;
  PhoneNumberField({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  });
  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  FocusNode _focusNode = FocusNode();

  Color _textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration:
          InputDecorations.RegisterLoginInputDec("Phone Number", _textColor),
      initialValue: widget.initialValue,
    );
  }

  void _onFocusChange() {
    setState(() {
      _textColor = _focusNode.hasFocus ? Color(0xffD0FD3E) : Colors.white;
    });
  }
}
