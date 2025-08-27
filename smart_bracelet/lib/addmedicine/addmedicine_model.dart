import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'addmedicine_widget.dart' show AddmedicineWidget;
import 'package:flutter/material.dart';

class AddmedicineModel extends FlutterFlowModel<AddmedicineWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nom widget.
  FocusNode? nomFocusNode;
  TextEditingController? nomTextController;
  String? Function(BuildContext, String?)? nomTextControllerValidator;
  // State field(s) for gramage widget.
  FocusNode? gramageFocusNode;
  TextEditingController? gramageTextController;
  String? Function(BuildContext, String?)? gramageTextControllerValidator;
  // State field(s) for frequance widget.
  String? frequanceValue;
  FormFieldController<String>? frequanceValueController;
  // State field(s) for duree widget.
  FocusNode? dureeFocusNode;
  TextEditingController? dureeTextController;
  String? Function(BuildContext, String?)? dureeTextControllerValidator;
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
  // State field(s) for status widget.
  String? statusValue;
  FormFieldController<String>? statusValueController;
  // State field(s) for note widget.
  FocusNode? noteFocusNode;
  TextEditingController? noteTextController;
  String? Function(BuildContext, String?)? noteTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nomFocusNode?.dispose();
    nomTextController?.dispose();

    gramageFocusNode?.dispose();
    gramageTextController?.dispose();

    dureeFocusNode?.dispose();
    dureeTextController?.dispose();

    birthdatefieldFocusNode1?.dispose();
    birthdatefieldTextController1?.dispose();

    birthdatefieldFocusNode2?.dispose();
    birthdatefieldTextController2?.dispose();

    noteFocusNode?.dispose();
    noteTextController?.dispose();
  }
}
