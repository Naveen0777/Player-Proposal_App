import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AnswerScreen extends StatefulWidget {
  const AnswerScreen({super.key});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  String? _activeButton;

  void _setActiveButton(String label) {
    setState(() {
      _activeButton = label;
    });
  }

  Future<void> sendWhatsAppMessage(String phoneNumber, String message) async {
    final Uri whatsappUrl = Uri.parse(
        "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  Future<void> sendResponseToGoogleSheet(String response) async {
    final Uri googleSheetUrl = Uri.parse(
        'https://script.google.com/macros/s/AKfycbzR0SYZLXQL5RrjdEebISmhdinDzw952VMNIbiGyoGt7bEs1zWZbHZ4kE8vQBgie_3M/exec');
    try {
      final httpResponse = await http.post(
        googleSheetUrl,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'response': response}),
      );
      if (httpResponse.statusCode == 200) {
        log('Response sent to Google Sheet successfully');
      } else if (httpResponse.statusCode == 302) {
        final redirectUrl = httpResponse.headers['location'];
        if (redirectUrl != null) {
          final redirectResponse = await http.get(
            Uri.parse(redirectUrl),
          );

          if (redirectResponse.statusCode == 200) {
            log('Response sent to Google Sheet successfully after redirection');
          } else {
            log('Failed to send response after redirection: ${redirectResponse.statusCode}');
          }
        } else {
          log('Failed to send response: Redirection URL is missing');
        }
      } else {
        log('Failed to send response to Google Sheet: ${httpResponse.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('GET OUT',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const Text('OF HERE',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const Text('YOU ARE GORGEOUS',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const Text('&',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const Text('I\'M REALLY',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          const Text('OBSESSED WITH YOU',
              style: TextStyle(color: Colors.white, fontSize: 20.0)),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              'assets/images/will_circle.png',
              height: 250.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Buttons(
                label: 'Yes',
                isActive: _activeButton == 'Yes',
                onTap: () async {
                  _setActiveButton('Yes');
                  await sendWhatsAppMessage(
                      '9056594660', 'IDK! We can think of it');
                  await sendResponseToGoogleSheet('Yes');
                },
              ),
              Buttons(
                label: 'No',
                isActive: _activeButton == 'No',
                onTap: () async {
                  _setActiveButton('No');
                  await sendWhatsAppMessage(
                      '9056594660', 'WTF! Not interested');
                  await sendResponseToGoogleSheet('No');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const Buttons({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
