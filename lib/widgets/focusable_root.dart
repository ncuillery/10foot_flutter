import 'package:auryn/models/dpad_navigation.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class _FocusableRootContent extends StatefulWidget {
  final Widget child;

  const _FocusableRootContent({Key key, this.child}) : super(key: key);

  @override
  _FocusableRootContentState createState() => _FocusableRootContentState();
}

class _FocusableRootContentState extends State<_FocusableRootContent> {
  FocusAttachment _focusAttachment;

  void _handleKey(event) {
    DpadNavigationModel dpadNavigationModel = sl.get<DpadNavigationModel>();

    if (event is RawKeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        dpadNavigationModel.focusScopeNode.focusInDirection(TraversalDirection.up);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        dpadNavigationModel.focusScopeNode.focusInDirection(TraversalDirection.right);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        dpadNavigationModel.focusScopeNode.focusInDirection(TraversalDirection.down);
      } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        dpadNavigationModel.focusScopeNode.focusInDirection(TraversalDirection.left);
      }
    }
  }

  @override
  void initState() {
    DpadNavigationModel dpadNavigationModel = sl.get<DpadNavigationModel>();

    RawKeyboard.instance.addListener(_handleKey);
    _focusAttachment = dpadNavigationModel.focusScopeNode.attach(context);
  }

  @override
  void dispose() {
    RawKeyboard.instance.removeListener(_handleKey);
    _focusAttachment.detach();
  }

  @override
  Widget build(BuildContext context) {
    _focusAttachment.reparent();
    return widget.child;
  }

}

class FocusableRoot extends StatelessWidget {
  final Widget child;

  const FocusableRoot({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultFocusTraversal(
      child: _FocusableRootContent(
        child: child
      )
    );
  }
}
