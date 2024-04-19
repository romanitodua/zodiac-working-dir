import 'dart:io';
import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled1/no_network_providers/dark_mode_provider.dart';
import 'package:path_provider/path_provider.dart';
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsState();
}

class _SettingsState extends ConsumerState<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = ref.watch(myNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Icon(Icons.dark_mode_sharp),
          Switch(
            value: darkMode,
            onChanged: (val) => ref.read(myNotifierProvider.notifier).toggle(),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
           Card(
            elevation: 2,
            child: ListTile(
              title: const Text("Give Feedback about the app"),
              leading: const Icon(Icons.feedback),
              onTap: () {
                BetterFeedback.of(context).show((UserFeedback feedback) async {
                  final screenshotFilePath =
                      await writeImageToStorage(feedback.screenshot);
                  final Email email = Email(
                    body: feedback.text,
                    subject: 'App Feedback',
                    recipients: ['zodiacappfeedback@gmail.com'],
                    attachmentPaths: [screenshotFilePath],
                    isHTML: false,
                  );
                  await FlutterEmailSender.send(email);
                });
              },
            ),
          )
        ],
      ),
    );
  }
  Future<String> writeImageToStorage(Uint8List feedbackScreenshot) async {
    final Directory output = await getTemporaryDirectory();
    final String screenshotFilePath = '${output.path}/feedback.png';
    final File screenshotFile = File(screenshotFilePath);
    await screenshotFile.writeAsBytes(feedbackScreenshot);
    return screenshotFilePath;
  }
}
