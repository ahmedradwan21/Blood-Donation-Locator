import 'package:bldapp/Provider/languge_state.dart';
import 'package:bldapp/generated/l10n.dart';
import 'package:bldapp/helper/notification_helper.dart';
import 'package:bldapp/view/LoginView.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:bldapp/Colors.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'register_as_hospital.dart';

class JoinBloodDonationApp extends StatefulWidget {
  @override
  State<JoinBloodDonationApp> createState() => _JoinBloodDonationAppState();
}

class _JoinBloodDonationAppState extends State<JoinBloodDonationApp> {
  @override
  NotificationHelper notificationHelper = NotificationHelper();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initState() {
    // TODO: implement initState
    // notificationHelper.getMyToken();

    notificationHelper.getForGroundMessage(context);
    notificationHelper.getRequest();
    super.initState();
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(
              flex: 2,
            ),
            Image.asset(
              'Assets/Images/gif.gif', // Replace with your image URL
              width: 350,
              height: 350,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[400],
              ),
              onPressed: () async {
                // await _firebaseMessaging.subscribeToTopic('bloodType');
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => LoginView())));
              },
              child: Text(
                S.of(context).Register_as_User,
                style: TextStyle(color: background),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[400],
              ),
              onPressed: () async {
                // await _firebaseMessaging.subscribeToTopic('bloodType');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => RegisterAsHospitalView())));
              },
              child: Text(
                S.of(context).register_as_hospital,
                style: TextStyle(color: background),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: () => provider.toggleTheme(),
              child: Row(
                mainAxisAlignment: provider.isArabic
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  !provider.isArabic
                      ? Text(
                          S.of(context).change_languge,
                          style: TextStyle(fontSize: 16),
                        )
                      : SizedBox(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.language,
                        size: 25,
                      )),
                  provider.isArabic
                      ? Text(
                          S.of(context).change_languge,
                          style: TextStyle(fontSize: 16),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
