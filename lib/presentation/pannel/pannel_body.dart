import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/widgets/custom_text_field.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PannelBody extends ConsumerWidget {
  const PannelBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maxPannelWidth = MediaQuery.of(context).size.width * 0.4;

    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blueGrey[700],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SizedBox(
          width: maxPannelWidth,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SizedBox(width: 120),
                Text('TITLE'),
                Expanded(child: _Body()),
                SizedBox(width: 120),
                SizedBox(width: 24),
                // Expanded(child: _Body()),
                // AnimationTimeDelaySlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 8),
            CustomTextField.email(
              name: '', //AuthForm.emailKey,
              text: 'address',
              autoValidateMode: AutovalidateMode.onUserInteraction,
              isRequired: true,
              isRequiredValidatorErrorText: 'Enter your email',
            ),
            const SizedBox(height: 8),
            CustomTextField.password(
              name: '', //AuthForm.passwordKey,
              text: 'pass',
              isRequired: true,
              isRequiredValidatorErrorText: 'Enter your password',
            ),
            const SizedBox(height: 16),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                _formKey.currentState?.saveAndValidate();
                if (_formKey.currentState?.isValid == true) {
                  // ref.read(authNotifierProvider.notifier).submitLoginForm(
                  //       formMap: _formKey.currentState!.value,
                  //     );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
