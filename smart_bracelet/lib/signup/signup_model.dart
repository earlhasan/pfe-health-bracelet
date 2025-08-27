import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'signup_widget.dart' show SignupWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupModel extends FlutterFlowModel<SignupWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for firstNameField widget.
  FocusNode? firstNameFieldFocusNode;
  TextEditingController? firstNameFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameFieldTextControllerValidator;
  // State field(s) for lastnamefield widget.
  FocusNode? lastnamefieldFocusNode;
  TextEditingController? lastnamefieldTextController;
  String? Function(BuildContext, String?)? lastnamefieldTextControllerValidator;
  // State field(s) for genderfield widget.
  String? genderfieldValue;
  FormFieldController<String>? genderfieldValueController;
  // State field(s) for birthdatefield widget.
  FocusNode? birthdatefieldFocusNode;
  TextEditingController? birthdatefieldTextController;
  final birthdatefieldMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)?
      birthdatefieldTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for emailfield widget.
  FocusNode? emailfieldFocusNode;
  TextEditingController? emailfieldTextController;
  String? Function(BuildContext, String?)? emailfieldTextControllerValidator;
  // State field(s) for passwordfield widget.
  FocusNode? passwordfieldFocusNode;
  TextEditingController? passwordfieldTextController;
  late bool passwordfieldVisibility;
  String? Function(BuildContext, String?)? passwordfieldTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    passwordfieldVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    firstNameFieldFocusNode?.dispose();
    firstNameFieldTextController?.dispose();

    lastnamefieldFocusNode?.dispose();
    lastnamefieldTextController?.dispose();

    birthdatefieldFocusNode?.dispose();
    birthdatefieldTextController?.dispose();

    emailfieldFocusNode?.dispose();
    emailfieldTextController?.dispose();

    passwordfieldFocusNode?.dispose();
    passwordfieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
