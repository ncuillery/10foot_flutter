import 'package:auryn/models/dpad_navigation.dart';
import 'package:auryn/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

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
  FocusNode focusNode;
  bool hasFocus = false;

  void _handleFocusChange() {
    final RenderObject object = context.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(object);
    final ScrollableState scrollableState = Scrollable.of(context);

    if (scrollableState != null) {
      ScrollPosition position = scrollableState.position;

      if (position.pixels > viewport.getOffsetToReveal(object, 0.0).offset) {
        Scrollable.ensureVisible(this.context, duration: Duration(milliseconds: 500), alignment: 0);
      } else if (position.pixels < viewport.getOffsetToReveal(object, 1.0).offset) {
        Scrollable.ensureVisible(this.context, duration: Duration(milliseconds: 500), alignment: 1);
      }
    }

    setState(() {
      hasFocus = focusNode.hasFocus;
    });
  }

  void _press() {
    final RenderBox renderBox = context.findRenderObject();
    BoxHitTestResult result = BoxHitTestResult();
    renderBox.hitTest(result, position: Offset(context.size.width / 2, context.size.height / 2));

    // https://github.com/flutter/flutter/issues/33610#issuecomment-514733614
    result.path.forEach((entry){
      print(entry.target.runtimeType);

      if(entry.target is RenderSemanticsGestureHandler){
        var target = entry.target as RenderSemanticsGestureHandler;
        target.onTap();
      }
    });
  }

  bool _handleKey(FocusNode node, RawKeyEvent event) {
    if (event is RawKeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.enter || event.logicalKey == LogicalKeyboardKey.select) {
        _press();
        return true;
      }
    }

    return false;
  }

  @override
  void initState() {
    focusNode = FocusNode(debugLabel: 'Focusable Focus Node', onKey: _handleKey);
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
