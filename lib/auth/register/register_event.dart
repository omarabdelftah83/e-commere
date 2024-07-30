
import 'package:flutter/material.dart';

abstract class RegisterEvent {}
class ButtonEvent extends RegisterEvent{
  final BuildContext context;

  ButtonEvent(this.context);
}