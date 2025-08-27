import '/flutter_flow/flutter_flow_util.dart';
import 'insulinepage_widget.dart' show InsulinepageWidget;
import 'package:flutter/material.dart';

class InsulinepageModel extends FlutterFlowModel<InsulinepageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dose widget.
  FocusNode? doseFocusNode;
  TextEditingController? doseTextController;
  String? Function(BuildContext, String?)? doseTextControllerValidator;
  // State field(s) for temps widget.
  FocusNode? tempsFocusNode;
  TextEditingController? tempsTextController;
  String? Function(BuildContext, String?)? tempsTextControllerValidator;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    doseFocusNode?.dispose();
    doseTextController?.dispose();

    tempsFocusNode?.dispose();
    tempsTextController?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
