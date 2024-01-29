import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/Themes/theme_manager.dart';

class Testing extends ConsumerStatefulWidget {
  const Testing({super.key});

  @override
  ConsumerState createState() => _TestingState();
}

class _TestingState extends ConsumerState<Testing> {
  @override
  Widget build(BuildContext context) {
    var darkMode = ref.watch(darkModeProvider);
    return SafeArea(
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Switch(
          value: darkMode,
          onChanged: (val) => ref.read(darkModeProvider.notifier).toggle(),
        ),
        Text("Time For little surpirse", style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontSize: 50,color: Colors.black87)
        ),
      ],
    ),)
    ,
    );
  }
}
