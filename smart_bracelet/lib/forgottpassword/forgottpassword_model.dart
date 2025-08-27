import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'forgottpassword_widget.dart' show ForgottpasswordWidget;
import 'package:flutter/material.dart';

class ForgottpasswordModel extends FlutterFlowModel<ForgottpasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldTextController;
  String? Function(BuildContext, String?)? emailFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFieldFocusNode?.dispose();
    emailFieldTextController?.dispose();
  }
}
