import 'package:flutter/material.dart';
import 'package:homepage_proto/main.dart';
import 'package:provider/provider.dart';

import './assessmentPages.dart';
import './patientFollowUpPage.dart';
import '../Widget/adaptiveRaisedButton.dart';
import '../Widget/Logo.dart';
import '../Widget/sideDrawer.dart';
import '../Provider/user-info.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfo>(context, listen: false);
    final mdqr = MediaQuery.of(context);
    final scndColor = Color.fromARGB(255, 75, 75, 75);
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      endDrawer: SideDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mdqr.size.width * 0.05,
          vertical: mdqr.size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: mdqr.size.height * 0.35),
            Container(
                height: mdqr.size.height * 0.25,
                child: FittedBox(child: Logo())),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: mdqr.size.width * 0.05),
              child: Text(
                (userInfo.role == Role.Patient)
                    ? 'Hi. I can help you find\nwhat’s going on.\nJust start a symptom\nassessment.'
                    : 'Welcome ${userInfo.userData['fname']}',
                style: TextStyle(
                  color: scndColor,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(child: Container()),
            Align(
              alignment: Alignment.centerRight,
              child: AdaptiveRaisedButton(
                buttonText: (userInfo.role == Role.Patient)
                    ? 'Start symptom assessment'
                    : 'See patient',
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.6,
                handlerFn: (() {
                  if (userInfo.role == Role.Patient) {
                    Navigator.of(context).pushNamed(AssessmentPages.routeName);
                  } else {
                    Navigator.of(context).pushNamed(PatientFollowUpPage.routeName);
                  }
                }),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  color: scndColor,
                  size: mdqr.size.width * 0.1,
                ),
                onPressed: () => scaffoldKey.currentState.openEndDrawer(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
