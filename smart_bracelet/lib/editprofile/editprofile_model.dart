import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'editprofile_widget.dart' show EditprofileWidget;
import 'package:flutter/material.dart';

class EditprofileModel extends FlutterFlowModel<EditprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for namefield widget.
  FocusNode? namefieldFocusNode;
  TextEditingController? namefieldTextController;
  String? Function(BuildContext, String?)? namefieldTextControllerValidator;
  // State field(s) for lastnamefield widget.
  FocusNode? lastnamefieldFocusNode;
  TextEditingController? lastnamefieldTextController;
  String? Function(BuildContext, String?)? lastnamefieldTextControllerValidator;
  // State field(s) for emailfield widget.
  FocusNode? emailfieldFocusNode;
  TextEditingController? emailfieldTextController;
  String? Function(BuildContext, String?)? emailfieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    namefieldFocusNode?.dispose();
    namefieldTextController?.dispose();

    lastnamefieldFocusNode?.dispose();
    lastnamefieldTextController?.dispose();

    emailfieldFocusNode?.dispose();
    emailfieldTextController?.dispose();
  }
}
