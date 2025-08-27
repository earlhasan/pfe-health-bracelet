import '/flutter_flow/flutter_flow_util.dart';
import 'addappintment_widget.dart' show AddappintmentWidget;
import 'package:flutter/material.dart';

class AddappintmentModel extends FlutterFlowModel<AddappintmentWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  // State field(s) for birthdatefield widget.
  FocusNode? birthdatefieldFocusNode1;
  TextEditingController? birthdatefieldTextController1;
  String? Function(BuildContext, String?)?
      birthdatefieldTextController1Validator;
  // State field(s) for birthdatefield widget.
  FocusNode? birthdatefieldFocusNode2;
  TextEditingController? birthdatefieldTextController2;
  String? Function(BuildContext, String?)?
      birthdatefieldTextController2Validator;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    birthdatefieldFocusNode1?.dispose();
    birthdatefieldTextController1?.dispose();

    birthdatefieldFocusNode2?.dispose();
    birthdatefieldTextController2?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
