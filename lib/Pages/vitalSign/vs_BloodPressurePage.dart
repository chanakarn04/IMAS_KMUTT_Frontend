import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/user-info.dart';
import '../../Provider/vitalSign_Info.dart';
import '../../Widget/numberTextInput.dart';
import '../../Widget/adaptiveBorderButton.dart';
import '../../Widget/adaptiveRaisedButton.dart';
import '../../Widget/progressDot.dart';
import '../painScoreStartPage.dart';
import '../homePages.dart';

class VSBloodPressurePage extends StatelessWidget {
  static const routeName = '/vitalSign-pressure';
  final textControllerf = TextEditingController();
  final textControllerb = TextEditingController();

  _headerBuilder(
    BuildContext context,
    String header,
  ) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      child: Text(header,
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.clip),
    );
  }

  _descriptionBuilder(
    BuildContext context,
    String description,
  ) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.95),
        child: Text(
          description,
          style: TextStyle(
            color: Color.fromARGB(255, 75, 75, 75),
            fontSize: 18,
          ),
          textAlign: TextAlign.end,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);
    // final routeArgument =
    //     ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final userInfo = Provider.of<UserInfo>(context);
    final vitalSign = Provider.of<VitalSignProvider>(context);
    final appBar = AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop()),
      title: Container(
        alignment: Alignment.center,
        child: Text('IMAS'),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu_rounded,
            color: Colors.transparent,
          ),
          onPressed: null,
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              padding: EdgeInsets.only(
                top: 120,
                left: 15,
                right: 15,
                bottom: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _headerBuilder(context, 'Bloodpressure'),
                  SizedBox(
                    height: 20,
                  ),
                  _descriptionBuilder(context,
                      'If you don\u0027t know your bloodpressure.\nYou can skip this.'),
                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.4,
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 100,
                        child: NumberTextField(
                          textController: textControllerf,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '/',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: 100,
                        child: NumberTextField(
                          textController: textControllerb,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'mmHg',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ProgressDot(
                      length: 4,
                      markedIndex: 4,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AdaptiveBorderButton(
                        buttonText: 'Skip',
                        height: 45,
                        width: 125,
                        handlerFn: () {
                          vitalSign.pressure = null;
                          // print('${routeArgument['temp']}');
                          // print('${routeArgument['pulse']}');
                          // print('${routeArgument['breath']}');
                          // print('${routeArgument['pressure']}');
                          Navigator.of(context).popUntil(
                              ModalRoute.withName(HomePage.routeName));
                          Navigator.of(context)
                              .pushNamed(PainScoreStartPage.routeName);
                        },
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      AdaptiveRaisedButton(
                        buttonText: 'Submit',
                        height: 35,
                        width: MediaQuery.of(context).size.width * 0.35,
                        handlerFn: (double.tryParse(textControllerf.text) !=
                                    null) &&
                                (textControllerf.text.isNotEmpty) &&
                                (double.tryParse(textControllerb.text) !=
                                    null) &&
                                (textControllerb.text.isNotEmpty)
                            ? (() {
                                vitalSign.pressure = [
                                  double.parse(textControllerf.text),
                                  double.parse(textControllerb.text),
                                ];
                                vitalSign.uploadValue(userInfo.userId);
                                // print('temp:   ${routeArgument['temp']}');
                                // print('pulse:  ${routeArgument['pulse']}');
                                // print('breath: ${routeArgument['breath']}');
                                // print('press:  ${routeArgument['pressure']}');
                                Navigator.of(context).popUntil(
                                    ModalRoute.withName(HomePage.routeName));
                                Navigator.of(context)
                                    .pushNamed(PainScoreStartPage.routeName);
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //     PainScoreStartPage.routeName,
                                //     ModalRoute.withName(HomePage.routeName));
                                // .popUntil(ModalRoute.withName('/home'));
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) =>
                                //         VSSummary(routeArgument)));
                              })
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
