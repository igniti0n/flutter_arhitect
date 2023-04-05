import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CustomTextField extends StatefulWidget {
  final String name;
  final String? text;
  final String? hint;
  final String? initialValue;
  final bool isPassword;
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onChanged;
  final bool isRequired;
  final TextStyle? style;
  final TextInputType? textInputType;
  final List<TextInputFormatter> inputFormatters;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization? textCapitalization;
  final bool isMultilineDescription;

  const CustomTextField._({
    Key? key,
    required this.name,
    this.text,
    this.validator,
    this.hint,
    this.style,
    this.isPassword = false,
    required this.onChanged,
    required this.isRequired,
    this.textEditingController,
    this.textInputType,
    this.inputFormatters = const [],
    this.autoValidateMode,
    this.textCapitalization,
    this.isMultilineDescription = false,
    this.initialValue,
  }) : super(key: key);

  factory CustomTextField.password({
    required String name,
    required String text,
    FormFieldValidator<String>? validator,
    void Function(String?)? onChanged,
    String? hint,
    String? initialValue,
    bool isRequired = false,
    String? isRequiredValidatorErrorText,
  }) =>
      CustomTextField._(
        name: name,
        text: text,
        isPassword: true,
        initialValue: initialValue,
        validator: validator ??
            (isRequired
                ? FormBuilderValidators.required(
                    errorText: isRequiredValidatorErrorText ??
                        'This field is required',
                  )
                : null),
        onChanged: onChanged,
        hint: hint,
        isRequired: isRequired,
      );

  factory CustomTextField.normal({
    required String name,
    String? text,
    FormFieldValidator<String>? validator,
    void Function(String?)? onChanged,
    TextInputType? textInputType,
    TextEditingController? textEditingController,
    String? hint,
    String? initialValue,
    TextStyle? style,
    bool isRequired = false,
    List<TextInputFormatter>? inputFormatters,
    AutovalidateMode? autoValidateMode,
    String? isRequiredValidatorErrorText,
  }) =>
      CustomTextField._(
        name: name,
        text: text,
        validator: validator ??
            (isRequired
                ? FormBuilderValidators.required(
                    errorText: isRequiredValidatorErrorText ??
                        'This field is required',
                  )
                : null),
        textInputType: textInputType,
        onChanged: onChanged,
        hint: hint,
        initialValue: initialValue,
        textEditingController: textEditingController,
        style: style,
        isRequired: isRequired,
        inputFormatters: inputFormatters ?? [],
        autoValidateMode: autoValidateMode,
        textCapitalization: TextCapitalization.sentences,
      );

  factory CustomTextField.multilineDescription({
    required String name,
    String? text,
    FormFieldValidator<String>? validator,
    void Function(String?)? onChanged,
    TextInputType? textInputType,
    TextEditingController? textEditingController,
    String? hint,
    String? initialValue,
    TextStyle? style,
    bool isRequired = false,
    List<TextInputFormatter>? inputFormatters,
    AutovalidateMode? autoValidateMode,
    String? isRequiredValidatorErrorText,
  }) =>
      CustomTextField._(
        name: name,
        text: text,
        validator: validator ??
            (isRequired
                ? FormBuilderValidators.required(
                    errorText: isRequiredValidatorErrorText ??
                        'This field is required',
                  )
                : null),
        textInputType: textInputType,
        onChanged: onChanged,
        hint: hint,
        initialValue: initialValue,
        textEditingController: textEditingController,
        style: style,
        isRequired: isRequired,
        inputFormatters: inputFormatters ?? [],
        autoValidateMode: autoValidateMode,
        isMultilineDescription: true,
        textCapitalization: TextCapitalization.sentences,
      );

  factory CustomTextField.email({
    required String name,
    required String text,
    FormFieldValidator<String>? validator,
    void Function(String?)? onChanged,
    String? hint,
    String? initialValue,
    bool isRequired = false,
    AutovalidateMode? autoValidateMode,
    String? isRequiredValidatorErrorText,
  }) =>
      CustomTextField._(
        name: name,
        text: text,
        validator: validator ??
            FormBuilderValidators.compose([
              if (isRequired)
                FormBuilderValidators.required(
                  errorText:
                      isRequiredValidatorErrorText ?? 'This field is required',
                ),
              FormBuilderValidators.email(
                errorText: 'email is not valid',
              ),
            ]),
        onChanged: onChanged,
        hint: hint,
        isRequired: isRequired,
        initialValue: initialValue,
        textInputType: TextInputType.emailAddress,
        autoValidateMode: autoValidateMode,
      );

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isHidden;

  @override
  void initState() {
    isHidden = widget.isPassword;
    super.initState();
  }

  void _changeTextVisibility() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<String>(
      name: widget.name,
      validator: widget.validator,
      autovalidateMode:
          widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.text != null) ...[
              SizedBox(
                height: 16,
                child: FittedBox(
                  child: Text(
                    widget.text!.toUpperCase(),
                    style: TextStyle(
                      color: field.hasError && !field.isValid
                          ? AppColors.inputValidationErrorPlaceholderLabel
                          : AppColors.inputPlaceholderLabel,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
            TextField(
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              controller: widget.textEditingController,
              onChanged: (value) {
                field.didChange(value);
                widget.onChanged?.call(value);
              },
              inputFormatters: widget.inputFormatters,
              style: widget.style ?? Theme.of(context).textTheme.titleMedium,
              obscureText: isHidden,
              enableSuggestions: !isHidden,
              textInputAction: TextInputAction.done,
              autocorrect: !isHidden,
              maxLines: widget.isMultilineDescription ? 30 : 1,
              minLines: widget.isMultilineDescription ? 3 : null,
              decoration: InputDecoration(
                hintText: widget.hint,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          isHidden
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: field.hasError && !field.isValid
                              ? AppColors.inputValidationErrorIcon
                              : AppColors.inputDefaultIcon,
                        ),
                        onPressed: _changeTextVisibility,
                      )
                    : null,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: field.hasError && !field.isValid
                        ? AppColors.inputValidationErrorDefaultBorder
                        : AppColors.inputDefaultBorder,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: field.hasError && !field.isValid
                        ? AppColors.inputValidationErrorDefaultBorder
                        : AppColors.inputDefaultBorder,
                  ),
                ),
              ),
            ),
            if (field.hasError && !field.isValid) ...[
              const SizedBox(height: 4),
              Text(
                field.errorText!,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: AppColors.inputValidationErrorPlaceholderLabel,
                    ),
              ),
            ],
          ],
        );
      },
    );
  }
}
