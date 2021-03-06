import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AptSuggestCard extends StatelessWidget {
  final DateTime apDt;
  final List<String> prescription;
  final String suggestion;
  final int index;

  AptSuggestCard(
    this.apDt,
    this.prescription,
    this.suggestion,
    this.index,
  );

  Widget _buildSeperator(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 1,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        margin: EdgeInsets.all(3),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Text(
              'Appointment $index',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              DateFormat.yMMMEd().format(apDt),
              style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    'Prescription',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  (prescription != null)
                      ? Container(
                          height: prescription.length * 25.0 + 20,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.symmetric(vertical: 2.5),
                                    child: Text(
                                      '\t\t\t${prescription[index]}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 75, 75, 75),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: prescription.length,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'No drug suggestion',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 75, 75, 75),
                            ),
                          ),
                        ),
                  _buildSeperator(context),
                  Text(
                    'Suggestion',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(vertical: 2.5),
                      child: Text(
                        (suggestion != null)
                            ? '    $suggestion'
                            : '    No sugesstion',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 75, 75, 75),
                        ),
                      ),
                    ),
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
