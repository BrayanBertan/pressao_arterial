import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(ModularApp(module: AppModule())));

}

