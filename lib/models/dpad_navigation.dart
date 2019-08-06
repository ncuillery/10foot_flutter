import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DpadNavigationModel {
  FocusScopeNode focusScopeNode;

  DpadNavigationModel() {
    focusScopeNode = FocusScopeNode(debugLabel: 'FocusableModel');
  }
}

