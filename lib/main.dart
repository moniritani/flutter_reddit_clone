import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'package:flutter/material.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( const ProviderScope(child: App()));
}