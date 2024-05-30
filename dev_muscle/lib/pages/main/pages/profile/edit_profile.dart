import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/accountFuncs/accountFuncs.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/widgets/register_widgets/fields.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  String name;
  String surname;
  String email;
  bool isTrainer;
  String professionField;
  String desc;
  String phoneNumber;
  EditProfilePage({
    Key? key,
    required this.name,
    required this.surname,
    required this.email,
    required this.isTrainer,
    required this.professionField,
    required this.phoneNumber,
    String this.desc = "",
  });

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.turn_left_outlined, color: Colors.white)),
        title: Text(
          "EDIT PROFILE",
          style: TextStyles.PrivacyPolicyTitleTextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 60, 32, 0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/pp.png",
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      color: button_color,
                      shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt,
                      color: Colors.white, size: 20),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  NameandSurnameField(
                      onSaved: (p0) => name = p0!,
                      label: "Name",
                      initialValue: name),
                  const SizedBox(height: 20),
                  NameandSurnameField(
                      onSaved: (p0) => surname = p0!,
                      label: "Surname",
                      initialValue: surname),
                  const SizedBox(height: 20),
                  MailField(
                    onSaved: (p0) {},
                    readOnly: true,
                    initialValue: email,
                  ),
                  isTrainer ? const SizedBox(height: 20) : SizedBox(),
                  isTrainer
                      ? ProfessionField(
                          initialValue: professionField,
                          onSaved: (p0) {},
                          readOnly: true)
                      : SizedBox(),
                  isTrainer ? const SizedBox(height: 20) : SizedBox(),
                  isTrainer
                      ? DescribeForPTField(
                          initialValue: desc,
                          onSaved: (p0) {
                            desc = p0!;
                          },
                        )
                      : SizedBox(),
                  const SizedBox(height: 30),
                  isTrainer
                      ? PhoneNumberField(
                          initialValue: phoneNumber,
                          onChanged: (p0) {
                            phoneNumber = p0!.completeNumber.toString();
                          },
                        )
                      : SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (isTrainer) {
                    await updateUserInfo(
                      {
                        "Name": name,
                        "Surname": surname,
                      },
                    );
                  } else {
                    await updateUserInfo(
                      {
                        "Name": name,
                        "Surname": surname,
                        "Description": desc,
                        "PhoneNumber": phoneNumber,
                      },
                    );
                  }
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Changes have been saved."),
                    backgroundColor: button_color,
                  ));
                  Navigator.pop(context);
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(high_green)),
              child: Text(
                "Save",
                style: TextStyles.IntroButtonText(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
