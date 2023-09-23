import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AgenciesPage extends StatelessWidget {
  final List<Agency> agencies = [
    Agency(name: 'Agency 1', phoneNumber: '8072856538'),
    Agency(name: 'Agency 2', phoneNumber: '8778345583'),
    // Add more agencies as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agencies'),
      ),
      body: ListView.builder(
        itemCount: agencies.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(agencies[index].name),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                _makePhoneCall(context, agencies[index].phoneNumber);
              },
            ),
          );
        },
      ),
    );
  }

  void _makePhoneCall(BuildContext context, String phoneNumber) async {
    final phoneUrl = 'tel:$phoneNumber';
    if (await canLaunch(phoneUrl)) {
      await launch(phoneUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Unable to make a phone call.'),
        ),
      );
    }
  }
}

class Agency {
  final String name;
  final String phoneNumber;

  Agency({
    required this.name,
    required this.phoneNumber,
  });
}
