import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/chatRoom_info.dart';
import './caseMangementTab/cmDiseaseSymptom.dart';
import './caseMangementTab/cmPrescription.dart';
import './caseMangementTab/caseManagement.dart';

class CaseManagementPage extends StatefulWidget {
  static const routeName = '/caseManagement';

  @override
  _CaseManagementPageState createState() => _CaseManagementPageState();
}

class _CaseManagementPageState extends State<CaseManagementPage> {
  int selectedPageIndex = 0;

  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'title': 'Disease/Symptom',
        'tab': CMDiseaseSymptomTab(),
      },
      {
        'title': 'Prescription',
        'tab': CMPrescriptionTab(),
      },
      {
        'title': 'Case management',
        'tab': CaseManagementTab(),
      },
    ];
    super.initState();
  }

  _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedPageIndex]['tab'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).primaryColor.withAlpha(150),
        currentIndex: selectedPageIndex,
        onTap: _selectPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: _pages[0]['title'],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            label: _pages[1]['title'],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined),
            label: _pages[2]['title'],
          ),
        ],
      ),
    );
  }
}
