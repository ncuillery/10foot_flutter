import 'package:auryn/models/dpad_navigation.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';

class Focusable extends StatefulWidget {
  final Widget child;
  final Function onFocus;
  final Function onBlur;
  final String debugLabel;

  Focusable({Key key, this.child, this.onFocus, this.onBlur, this.debugLabel}) : super(key: key);

  @override
  _FocusableState createState() => _FocusableState();
}

class _FocusableState extends State<Focusable> {
  FocusAttachment _focusAttachment;
  FocusNode _focusNode;

  void _handleFocusChange() {
    if (_focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus();
    }

    if (!_focusNode.hasFocus && widget.onBlur != null) {
      widget.onBlur();
    }
  }

  @override
  void initState() {
    _focusNode = FocusNode(debugLabel: 'Focusable #' + widget.debugLabel);
    _focusAttachment = _focusNode.attach(context);
    _focusNode.addListener(_handleFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focusAttachment.detach();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DpadNavigationModel dpadNavigationModel = sl.get<DpadNavigationModel>();
    _focusAttachment.reparent(parent: dpadNavigationModel.focusScopeNode);
    return widget.child;
  }
}
