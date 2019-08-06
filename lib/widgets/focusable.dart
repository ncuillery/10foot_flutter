import 'package:auryn/models/dpad_navigation.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';

class _FocusableInherited extends InheritedWidget {
  final FocusNode focusNode;
  final Widget child;

  _FocusableInherited({ this.focusNode, this.child });

  @override
  bool updateShouldNotify(_FocusableInherited oldWidget) {
    return true;
  }
}

class Focusable extends StatefulWidget {
  final Widget child;
  final Function onFocus;
  final Function onBlur;
  final String debugLabel;

  Focusable({Key key, this.child, this.onFocus, this.onBlur, this.debugLabel}) : super(key: key);

  @override
  _FocusableState createState() => _FocusableState();

  static _FocusableInherited of(BuildContext context) {
    _FocusableInherited _focusableInherited = context.inheritFromWidgetOfExactType(_FocusableInherited);
    return _focusableInherited;
  }
}

class _FocusableState extends State<Focusable> {
  FocusAttachment _focusAttachment;
  FocusNode focusNode = FocusNode(debugLabel: 'Focusable Focus Node');
  bool hasFocus = false;

  void _handleFocusChange() {
    if (focusNode.hasFocus && widget.onFocus != null) {
      widget.onFocus();
    }

    if (!focusNode.hasFocus && widget.onBlur != null) {
      widget.onBlur();
    }

    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }

  @override
  void initState() {
    _focusAttachment = focusNode.attach(context);
    focusNode.addListener(_handleFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focusAttachment.detach();
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void _reparentFocusNode(Duration timeStamp) {
    // Because the underlying reattach the focusNode in the build method,
    // we need to reattach it back to our FocusScopeNode
    DpadNavigationModel dpadNavigationModel = sl.get<DpadNavigationModel>();
    _focusAttachment = focusNode.attach(context);
    _focusAttachment.reparent(parent: dpadNavigationModel.focusScopeNode);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(_reparentFocusNode);

    return _FocusableInherited(
      focusNode: focusNode,
      child: widget.child
    );
  }
}
