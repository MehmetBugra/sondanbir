import 'package:dev_muscle/functions/accountFuncs/accountFuncs.dart';
import 'package:dev_muscle/pages/baslangic_ekrani2/GetInfoDefaultPage.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/variables/routes.dart';
import 'package:dev_muscle/widgets/register_widgets/fields.dart';
import 'package:dev_muscle/widgets/register_widgets/register/register_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _surname;
  late String _email;
  late String _password;
  late String _descForTrainer;
  late String _professionFieldForTrainer;
  late String _phoneNumber;
  late bool _isTrainer;

  @override
  void initState() {
    _name = "";
    _surname = "";
    _email = "";
    _password = "";
    _descForTrainer = "";
    _professionFieldForTrainer = "";
    _phoneNumber = "";
    _isTrainer = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            NameandSurnameField(
              onSaved: (name) => _name = name!,
              label: "Name",
            ),
            NameandSurnameField(
                onSaved: (surname) => _surname = surname!, label: "Surname"),
            MailField(onSaved: (mail) => _email = mail!),

            PasswordField(
                label: "Password",
                onSaved: (password) {
                  setState(() {
                    _password = password!;
                  });
                }),

            const SizedBox(height: 20),
            CheckboxListTile(
              value: _isTrainer,
              selectedTileColor: high_green,
              onChanged: (value) {
                setState(() {
                  _isTrainer = !_isTrainer;
                });
              },
              title: const Text("Are you Personal Trainer ?",
                  style: TextStyle(color: Colors.white)),
            ),
            _isTrainer
                ? ProfessionField(
                    initialValue: "",
                    onSaved: (p0) {
                      setState(() {
                        _professionFieldForTrainer = p0!;
                      });
                    },
                  )
                : SizedBox(),

            const SizedBox(height: 20),
            _isTrainer
                ? DescribeForPTField(
                    initialValue: "",
                    onSaved: (val) {
                      setState(() {
                        _descForTrainer = val!;
                      });
                    })
                : SizedBox(),

            const SizedBox(height: 20),
            _isTrainer
                ? PhoneNumberField(
                    initialValue: "",
                    onChanged: (val) {
                      setState(() {
                        _phoneNumber = val!.completeNumber.toString();
                      });
                    })
                : SizedBox(),

            const SizedBox(height: 20),

            // Sign Up Button
            RegisterButton(
              myOnPressed: () async {
                try {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    await registerUserWithMailandPassword(
                        _name, _surname, _password, _email, _isTrainer,
                        desc: _descForTrainer,
                        professionField: _professionFieldForTrainer,
                        phoneNumber: _phoneNumber);

                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const GetInfoDefaultPage(),
                          settings: const RouteSettings(name: getInfoRoute),
                        ),
                        (route) => false);
                  }
                } catch (err) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Error: ${err}"),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
