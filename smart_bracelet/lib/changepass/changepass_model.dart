import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'changepass_widget.dart' show ChangepassWidget;
import 'package:flutter/material.dart';

class ChangepassModel extends FlutterFlowModel<ChangepassWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for NEWPASSWORD widget.
  FocusNode? newpasswordFocusNode;
  TextEditingController? newpasswordTextController;
  late bool newpasswordVisibility;
  String? Function(BuildContext, String?)? newpasswordTextControllerValidator;
  // State field(s) for CONFIRMPASS widget.
  FocusNode? confirmpassFocusNode;
  TextEditingController? confirmpassTextController;
  late bool confirmpassVisibility;
  String? Function(BuildContext, String?)? confirmpassTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    newpasswordVisibility = false;
    confirmpassVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    newpasswordFocusNode?.dispose();
    newpasswordTextController?.dispose();

    confirmpassFocusNode?.dispose();
    confirmpassTextController?.dispose();
  }
}
