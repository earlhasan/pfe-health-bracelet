import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailLoginField widget.
  FocusNode? emailLoginFieldFocusNode;
  TextEditingController? emailLoginFieldTextController;
  String? Function(BuildContext, String?)?
      emailLoginFieldTextControllerValidator;
  // State field(s) for passwordLoginField widget.
  FocusNode? passwordLoginFieldFocusNode;
  TextEditingController? passwordLoginFieldTextController;
  late bool passwordLoginFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordLoginFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordLoginFieldVisibility = false;
  }

  @override
  void dispose() {
    emailLoginFieldFocusNode?.dispose();
    emailLoginFieldTextController?.dispose();

    passwordLoginFieldFocusNode?.dispose();
    passwordLoginFieldTextController?.dispose();
  }
}
