import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_module/basic_provider.dart';
import 'package:flutter_application_1/multitask_module/multitask_app.dart';
import 'package:flutter_application_1/multitask_module/multitask_provider.dart';
import 'package:flutter_application_1/readgame_module/readgame_app.dart';
import 'package:flutter_application_1/readgame_module/readgame_provider.dart';
import 'package:flutter_application_1/state_module/state_app.dart';
import 'package:flutter_application_1/state_module/state_provider.dart';
import 'package:flutter_application_1/student_module/student_app.dart';
import 'package:flutter_application_1/student_module/student_provider.dart';
import 'package:provider/provider.dart';
import 'basic_module/basic_app.dart';
void main(){
  //runApp(Container(color: Colors.yellow));
  runApp(studentProvider());
}
