import "package:dev_muscle/components/UIHelper.dart";
import "package:dev_muscle/components/styles.dart";
import "package:dev_muscle/functions/accountFuncs/accountFuncs.dart";
import "package:dev_muscle/pages/registerAndLogin/page.dart";
import "package:dev_muscle/variables/colors.dart";
import "package:dev_muscle/variables/routes.dart";
import "package:dev_muscle/widgets/mainpage_widgets/bottomNavBar.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int page = 0;
  late Future<Map<String, dynamic>> _userInfoFuture;

  @override
  void initState() {
    _userInfoFuture = getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // if (didPop) return;
        _showDialog();
      },
      child: Scaffold(
        backgroundColor: background_color,
        body: FutureBuilder(
          future: _userInfoFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Future henüz tamamlanmadıysa, yüklenme göstergesi döndür
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              // Future hata ile tamamlandıysa, hata mesajını göster
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              // Future başarıyla tamamlandıysa, veriyi kullanarak arayüzü oluştur

              final userInformation = snapshot.data;
              return UIHelper.PageChanger(page, userInformation);
            }
          },
        ),
        bottomNavigationBar: BottomNavBar(
          page: page,
          onPressed: (value) {
            setState(() {
              page = value;
              _userInfoFuture = getUserInfo();
            });
          },
        ),
      ),
    );
  }

// UIHelper.PageChanger(page, userInformation),
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Exit"),
        content: const Text(
          "Do you want to sign out ?",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: background_color,
        titleTextStyle: TextStyles.IntroTitleText(),
        contentTextStyle: TextStyles.WorkoutSubtitleTextStyle(),
        actions: [
          TextButton(
            onPressed: () {
              userSignOut().whenComplete(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const RegisterAndLoginPage()),
                    ModalRoute.withName(registerAndLoginRoute));
              });
            },
            child: Text(
              "Sign Out",
              style: TextStyle(color: high_green),
            ),
          ),
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: high_green),
              ))
        ],
      ),
    );
  }
}
