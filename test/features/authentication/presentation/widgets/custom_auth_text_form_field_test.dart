import 'package:eatsy/common/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../app_pumper.dart';

void main() {
  group('Test AppTextFormField', () {
    testWidgets('check properties', (widgetTester) async {
      const String sampleText = 'Hint Sample';
      final FocusNode focusNode = FocusNode();
      const String assetPath = 'assets/icons/profile.svg';
      const bool isObscureText = true;
      await widgetTester.pumpWidget(AppPumper(
        child: Scaffold(
          body: AppTextFormField(
            hintText: sampleText,
            focusNode: focusNode,
            prefixIconSvgPath: assetPath,
            isObscureText: isObscureText,
          ),
        ),
      ),);
      expect(find.text(sampleText), findsOneWidget);
      final svgIconFinder = find.byType(SvgPicture);
      expect(svgIconFinder, findsOneWidget);
      final svgRenderObject = widgetTester.renderObject(svgIconFinder);
      expect(svgRenderObject, isNotNull);

      expect(focusNode.hasFocus, false);
      await widgetTester.tap(find.byType(TextFormField));
      await widgetTester.pump();
      expect(focusNode.hasFocus, true);
    });

    testWidgets('OnChangedCallback', (widgetTester) async {
      String changedText = '';

      await widgetTester.pumpWidget(AppPumper(
        child: Scaffold(
          body: AppTextFormField(
            onChanged: (value) => changedText = value,
          ),
        ),
      ),);

      await widgetTester.enterText(find.byType(TextFormField), 'Hello World');

      expect(changedText, equals('Hello World'));
    });

    testWidgets('OnSubmittedCallback', (widgetTester) async {
      String submittedText = '';

      await widgetTester.pumpWidget(AppPumper(
        child: Scaffold(
          body: AppTextFormField(
            onSubmitted: (value) => submittedText = value,
          ),
        ),
      ),);
      await widgetTester.enterText(
          find.byType(TextFormField), 'Submitted Text Sample',);
      await widgetTester.testTextInput.receiveAction(TextInputAction.done);

      expect(submittedText, equals('Submitted Text Sample'));
    });
  });
}
