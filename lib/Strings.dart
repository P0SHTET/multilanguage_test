import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

class Strings {

  static late BuildContext context;

  static get welcome => FlutterI18n.translate(context, 'welcome');
}
