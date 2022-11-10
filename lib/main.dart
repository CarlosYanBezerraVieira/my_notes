import 'package:flutter/material.dart';
import 'package:mynotes/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    home: AppWidget(),
  ));
}
