import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/ptFuncs/ptInfo.dart';
import 'package:dev_muscle/widgets/personalTrainers_widgets/ptCard.dart';
import 'package:flutter/material.dart';

class PTsPage extends StatelessWidget {
  const PTsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getTrainerUsers(),
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

          final trainersList = snapshot.data;
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 70, 24, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "FITNESS TRAINERS",
                    style: TextStyles.PrivacyPolicyTitleTextStyle(),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height - 200,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: trainersList!.length,
                        itemBuilder: (context, index) {
                          return PTCard(trainer: trainersList[index]);
                        },
                      ))
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

/*
*/