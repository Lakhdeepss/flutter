// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TimePickerThemeData copyWith, ==, hashCode basics', () {
    expect(const TimePickerThemeData(), const TimePickerThemeData().copyWith());
    expect(const TimePickerThemeData().hashCode, const TimePickerThemeData().copyWith().hashCode);
  });

  test('TimePickerThemeData lerp special cases', () {
    const TimePickerThemeData data = TimePickerThemeData();
    expect(identical(TimePickerThemeData.lerp(data, data, 0.5), data), true);
  });

  test('TimePickerThemeData null fields by default', () {
    const TimePickerThemeData timePickerTheme = TimePickerThemeData();
    expect(timePickerTheme.backgroundColor, null);
    expect(timePickerTheme.cancelButtonStyle, null);
    expect(timePickerTheme.confirmButtonStyle, null);
    expect(timePickerTheme.dayPeriodBorderSide, null);
    expect(timePickerTheme.dayPeriodColor, null);
    expect(timePickerTheme.dayPeriodShape, null);
    expect(timePickerTheme.dayPeriodTextColor, null);
    expect(timePickerTheme.dayPeriodTextStyle, null);
    expect(timePickerTheme.dialBackgroundColor, null);
    expect(timePickerTheme.dialHandColor, null);
    expect(timePickerTheme.dialTextColor, null);
    expect(timePickerTheme.dialTextStyle, null);
    expect(timePickerTheme.elevation, null);
    expect(timePickerTheme.entryModeIconColor, null);
    expect(timePickerTheme.helpTextStyle, null);
    expect(timePickerTheme.hourMinuteColor, null);
    expect(timePickerTheme.hourMinuteShape, null);
    expect(timePickerTheme.hourMinuteTextColor, null);
    expect(timePickerTheme.hourMinuteTextStyle, null);
    expect(timePickerTheme.inputDecorationTheme, null);
    expect(timePickerTheme.entryModeIconColor, null);
    expect(timePickerTheme.padding, null);
    expect(timePickerTheme.shape, null);
  });

  testWidgets('Default TimePickerThemeData debugFillProperties', (WidgetTester tester) async {
    final DiagnosticPropertiesBuilder builder = DiagnosticPropertiesBuilder();
    const TimePickerThemeData().debugFillProperties(builder);

    final List<String> description = builder.properties
        .where((DiagnosticsNode node) => !node.isFiltered(DiagnosticLevel.info))
        .map((DiagnosticsNode node) => node.toString())
        .toList();

    expect(description, <String>[]);
  });

  testWidgets('TimePickerThemeData implements debugFillProperties', (WidgetTester tester) async {
    final DiagnosticPropertiesBuilder builder = DiagnosticPropertiesBuilder();
    const TimePickerThemeData(
      backgroundColor: Color(0xfffffff0),
      cancelButtonStyle: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(Color(0xfffffff1))),
      confirmButtonStyle: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(Color(0xfffffff2))),
      dayPeriodBorderSide: BorderSide(color: Color(0xfffffff3)),
      dayPeriodColor: Color(0xfffffff4),
      dayPeriodShape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xfffffff5)),
      ),
      dayPeriodTextColor: Color(0xfffffff6),
      dayPeriodTextStyle: TextStyle(color: Color(0xfffffff7)),
      dialBackgroundColor: Color(0xfffffff8),
      dialHandColor: Color(0xfffffff9),
      dialTextColor: Color(0xfffffffa),
      dialTextStyle: TextStyle(color: Color(0xfffffffb)),
      elevation: 1.0,
      entryModeIconColor: Color(0xfffffffc),
      helpTextStyle: TextStyle(color: Color(0xfffffffd)),
      hourMinuteColor: Color(0xfffffffe),
      hourMinuteShape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xffffffff)),
      ),
      hourMinuteTextColor: Color(0xfffffff0),
      hourMinuteTextStyle: TextStyle(color: Color(0xfffffff1)),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Color(0xfffffff2)),
      ),
      padding: EdgeInsets.all(1.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xfffffff3)),
      ),
    ).debugFillProperties(builder);

    final List<String> description = builder.properties
        .where((DiagnosticsNode node) => !node.isFiltered(DiagnosticLevel.info))
        .map((DiagnosticsNode node) => node.toString())
        .toList();

    expect(description, equalsIgnoringHashCodes(<String>[
      'backgroundColor: Color(0xfffffff0)',
      'cancelButtonStyle: ButtonStyle#00000(foregroundColor: MaterialStatePropertyAll(Color(0xfffffff1)))',
      'confirmButtonStyle: ButtonStyle#00000(foregroundColor: MaterialStatePropertyAll(Color(0xfffffff2)))',
      'dayPeriodBorderSide: BorderSide(color: Color(0xfffffff3))',
      'dayPeriodColor: Color(0xfffffff4)',
      'dayPeriodShape: RoundedRectangleBorder(BorderSide(color: Color(0xfffffff5)), BorderRadius.zero)',
      'dayPeriodTextColor: Color(0xfffffff6)',
      'dayPeriodTextStyle: TextStyle(inherit: true, color: Color(0xfffffff7))',
      'dialBackgroundColor: Color(0xfffffff8)',
      'dialHandColor: Color(0xfffffff9)',
      'dialTextColor: Color(0xfffffffa)',
      'dialTextStyle: TextStyle(inherit: true, color: Color(0xfffffffb))',
      'elevation: 1.0',
      'entryModeIconColor: Color(0xfffffffc)',
      'helpTextStyle: TextStyle(inherit: true, color: Color(0xfffffffd))',
      'hourMinuteColor: Color(0xfffffffe)',
      'hourMinuteShape: RoundedRectangleBorder(BorderSide(color: Color(0xffffffff)), BorderRadius.zero)',
      'hourMinuteTextColor: Color(0xfffffff0)',
      'hourMinuteTextStyle: TextStyle(inherit: true, color: Color(0xfffffff1))',
      'inputDecorationTheme: InputDecorationTheme#ff861(labelStyle: TextStyle(inherit: true, color: Color(0xfffffff2)))',
      'padding: EdgeInsets.all(1.0)',
      'shape: RoundedRectangleBorder(BorderSide(color: Color(0xfffffff3)), BorderRadius.zero)'
    ]));
  });

  testWidgets('Material2 - Passing no TimePickerThemeData uses defaults', (WidgetTester tester) async {
    final ThemeData defaultTheme = ThemeData(useMaterial3: false);
    await tester.pumpWidget(_TimePickerLauncher(themeData: defaultTheme));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Material dialogMaterial = _dialogMaterial(tester);
    expect(dialogMaterial.color, defaultTheme.colorScheme.surface);
    expect(
      dialogMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );

    final RenderBox dial = tester.firstRenderObject<RenderBox>(find.byType(CustomPaint));
    expect(
      dial,
      paints
        ..circle(color: defaultTheme.colorScheme.onSurface.withOpacity(0.08)) // Dial background color.
        ..circle(color: Color(defaultTheme.colorScheme.primary.value))
    );

    final RenderParagraph hourText = _textRenderParagraph(tester, '7');
    expect(
      hourText.text.style,
      Typography.material2014().englishLike.displayMedium!
        .merge(Typography.material2014().black.displayMedium)
        .copyWith(color: defaultTheme.colorScheme.primary)
    );

    final RenderParagraph minuteText = _textRenderParagraph(tester, '15');
    expect(
      minuteText.text.style,
      Typography.material2014().englishLike.displayMedium!
        .merge(Typography.material2014().black.displayMedium)
        .copyWith(color: defaultTheme.colorScheme.onSurface),
    );

    final RenderParagraph amText = _textRenderParagraph(tester, 'AM');
    expect(
      amText.text.style,
      Typography.material2014().englishLike.titleMedium!
        .merge(Typography.material2014().black.titleMedium)
        .copyWith(color: defaultTheme.colorScheme.primary),
    );

    final RenderParagraph pmText = _textRenderParagraph(tester, 'PM');
    expect(
      pmText.text.style,
      Typography.material2014().englishLike.titleMedium!
        .merge(Typography.material2014().black.titleMedium)
        .copyWith(color: defaultTheme.colorScheme.onSurface.withOpacity(0.6)),
    );

    final RenderParagraph helperText = _textRenderParagraph(tester, 'SELECT TIME');
    expect(
      helperText.text.style,
      Typography.material2014().englishLike.labelSmall!
        .merge(Typography.material2014().black.labelSmall),
    );

    final CustomPaint dialPaint = tester.widget(findDialPaint);
    final dynamic dialPainter = dialPaint.painter;
    // ignore: avoid_dynamic_calls
    final List<dynamic> primaryLabels = dialPainter.primaryLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      primaryLabels.first.painter.text.style,
      Typography.material2014().englishLike.bodyLarge!
        .merge(Typography.material2014().black.bodyLarge)
        .copyWith(color: defaultTheme.colorScheme.onSurface),
    );
    // ignore: avoid_dynamic_calls
    final List<dynamic> selectedLabels = dialPainter.selectedLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      selectedLabels.first.painter.text.style,
      Typography.material2014().englishLike.bodyLarge!
        .merge(Typography.material2014().white.bodyLarge)
        .copyWith(color: defaultTheme.colorScheme.onPrimary),
    );

    final Material hourMaterial = _textMaterial(tester, '7');
    expect(hourMaterial.color, defaultTheme.colorScheme.primary.withOpacity(0.12));
    expect(
      hourMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );

    final Material minuteMaterial = _textMaterial(tester, '15');
    expect(minuteMaterial.color, defaultTheme.colorScheme.onSurface.withOpacity(0.12));
    expect(
      minuteMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
    );

    final Material amMaterial = _textMaterial(tester, 'AM');
    expect(amMaterial.color, defaultTheme.colorScheme.primary.withOpacity(0.12));

    final Material pmMaterial = _textMaterial(tester, 'PM');
    expect(pmMaterial.color, Colors.transparent);

    final Color expectedBorderColor = Color.alphaBlend(
      defaultTheme.colorScheme.onSurface.withOpacity(0.38),
      defaultTheme.colorScheme.surface,
    );
    final Material dayPeriodMaterial = _dayPeriodMaterial(tester);
    expect(
      dayPeriodMaterial.shape,
      RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        side: BorderSide(color: expectedBorderColor),
      ),
    );

    final Container dayPeriodDivider = _dayPeriodDivider(tester);
    expect(
      dayPeriodDivider.decoration,
      BoxDecoration(border: Border(left: BorderSide(color: expectedBorderColor))),
    );

    final IconButton entryModeIconButton = _entryModeIconButton(tester);
    expect(
      entryModeIconButton.color,
      defaultTheme.colorScheme.onSurface.withOpacity(0.6),
    );

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'CANCEL');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));

    final ButtonStyle confirmButtonStyle = _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));
  });

  testWidgets('Material3 - Passing no TimePickerThemeData uses defaults', (WidgetTester tester) async {
    final ThemeData defaultTheme = ThemeData(useMaterial3: true);
    await tester.pumpWidget(_TimePickerLauncher(themeData: defaultTheme));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Material dialogMaterial = _dialogMaterial(tester);
    expect(dialogMaterial.color, defaultTheme.colorScheme.surface);
    expect(
      dialogMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(28.0))),
    );

    final RenderBox dial = tester.firstRenderObject<RenderBox>(find.byType(CustomPaint));
    expect(
      dial,
      paints
        ..circle(color: defaultTheme.colorScheme.surfaceVariant) // Dial background color.
        ..circle(color: Color(defaultTheme.colorScheme.primary.value)), // Dial hand color.
    );

    final RenderParagraph hourText = _textRenderParagraph(tester, '7');
    expect(
      hourText.text.style,
      Typography.material2021().englishLike.displayMedium!
        .merge(Typography.material2021().black.displayMedium)
        .copyWith(
          color: defaultTheme.colorScheme.onPrimaryContainer,
          decorationColor: defaultTheme.colorScheme.onSurface
        ),
    );

    final RenderParagraph minuteText = _textRenderParagraph(tester, '15');
    expect(
      minuteText.text.style,
      Typography.material2021().englishLike.displayMedium!
        .merge(Typography.material2021().black.displayMedium)
        .copyWith(
          color: defaultTheme.colorScheme.onSurface,
          decorationColor: defaultTheme.colorScheme.onSurface
        ),
    );

    final RenderParagraph amText = _textRenderParagraph(tester, 'AM');
    expect(
      amText.text.style,
      Typography.material2021().englishLike.titleMedium!
        .merge(Typography.material2021().black.titleMedium)
        .copyWith(
          color: defaultTheme.colorScheme.onTertiaryContainer,
          decorationColor: defaultTheme.colorScheme.onSurface,
        ),
    );

    final RenderParagraph pmText = _textRenderParagraph(tester, 'PM');
    expect(
      pmText.text.style,
      Typography.material2021().englishLike.titleMedium!
        .merge(Typography.material2021().black.titleMedium)
        .copyWith(
          color: defaultTheme.colorScheme.onSurfaceVariant,
          decorationColor: defaultTheme.colorScheme.onSurface,
        )
    );

    final RenderParagraph helperText = _textRenderParagraph(tester, 'Select time');
    expect(
      helperText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .copyWith(
          color: defaultTheme.colorScheme.onSurface,
          decorationColor: defaultTheme.colorScheme.onSurface,
        ),
    );

    final CustomPaint dialPaint = tester.widget(findDialPaint);
    final dynamic dialPainter = dialPaint.painter;
    // ignore: avoid_dynamic_calls
    final List<dynamic> primaryLabels = dialPainter.primaryLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      primaryLabels.first.painter.text.style,
      Typography.material2021().englishLike.bodyLarge!
        .merge(Typography.material2021().black.bodyLarge)
        .copyWith(
          color: defaultTheme.colorScheme.onSurface,
          decorationColor: defaultTheme.colorScheme.onSurface,
        ),
    );
    // ignore: avoid_dynamic_calls
    final List<dynamic> selectedLabels = dialPainter.selectedLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      selectedLabels.first.painter.text.style,
      Typography.material2021().englishLike.bodyLarge!
        .merge(Typography.material2021().black.bodyLarge)
        .copyWith(
          color: defaultTheme.colorScheme.onPrimary,
          decorationColor: defaultTheme.colorScheme.onSurface,
        ),
    );

    final Material hourMaterial = _textMaterial(tester, '7');
    expect(hourMaterial.color, defaultTheme.colorScheme.primaryContainer);
    expect(
      hourMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)))
    );

    final Material minuteMaterial = _textMaterial(tester, '15');
    expect(minuteMaterial.color, defaultTheme.colorScheme.surfaceVariant);
    expect(
      minuteMaterial.shape,
      const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
    );

    final Material amMaterial = _textMaterial(tester, 'AM');
    expect(amMaterial.color, defaultTheme.colorScheme.tertiaryContainer);

    final Material pmMaterial = _textMaterial(tester, 'PM');
    expect(pmMaterial.color, Colors.transparent);

    final Material dayPeriodMaterial = _dayPeriodMaterial(tester);
    expect(
      dayPeriodMaterial.shape,
      RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        side: BorderSide(color: defaultTheme.colorScheme.outline),
      ),
    );

    final Container dayPeriodDivider = _dayPeriodDivider(tester);
    expect(
      dayPeriodDivider.decoration,
      BoxDecoration(border: Border(left: BorderSide(color: defaultTheme.colorScheme.outline))),
    );

    final IconButton entryModeIconButton = _entryModeIconButton(tester);
    expect(entryModeIconButton.color, null);

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'Cancel');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));

    final ButtonStyle confirmButtonStyle = _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));
  });

  testWidgets('Material2 - Passing no TimePickerThemeData uses defaults - input mode', (WidgetTester tester) async {
    final ThemeData defaultTheme = ThemeData(useMaterial3: false);
    await tester.pumpWidget(_TimePickerLauncher(themeData: defaultTheme, entryMode: TimePickerEntryMode.input));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final InputDecoration hourDecoration = _textField(tester, '7').decoration!;
    expect(hourDecoration.filled, true);
    expect(
      hourDecoration.fillColor,
      MaterialStateColor.resolveWith((Set<MaterialState> states) =>
        defaultTheme.colorScheme.onSurface.withOpacity(0.12))
    );
    expect(
      hourDecoration.enabledBorder,
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
    );
    expect(
      hourDecoration.errorBorder,
      OutlineInputBorder(borderSide: BorderSide(color: defaultTheme.colorScheme.error, width: 2))
    );
    expect(
      hourDecoration.focusedBorder,
      OutlineInputBorder(borderSide: BorderSide(color: defaultTheme.colorScheme.primary, width: 2))
    );
    expect(
      hourDecoration.focusedErrorBorder,
      OutlineInputBorder(borderSide: BorderSide(color: defaultTheme.colorScheme.error, width: 2))
    );
    expect(
      hourDecoration.hintStyle,
      Typography.material2014().englishLike.displayMedium!
        .merge(defaultTheme.textTheme.displayMedium!.copyWith(color: defaultTheme.colorScheme.onSurface.withOpacity(0.36)))
    );

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'CANCEL');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));

    final ButtonStyle confirmButtonStyle= _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));
  });

  testWidgets('Material3 - Passing no TimePickerThemeData uses defaults - input mode', (WidgetTester tester) async {
    final ThemeData defaultTheme = ThemeData(useMaterial3: true);
    await tester.pumpWidget(_TimePickerLauncher(themeData: defaultTheme, entryMode: TimePickerEntryMode.input));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final InputDecoration hourDecoration = _textField(tester, '7').decoration!;
    expect(hourDecoration.filled, true);
    expect(hourDecoration.fillColor, defaultTheme.colorScheme.surfaceVariant);
    expect(
      hourDecoration.enabledBorder,
      const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: Colors.transparent)),
    );
    expect(
      hourDecoration.errorBorder,
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: defaultTheme.colorScheme.error, width: 2.0)),
    );
    expect(
      hourDecoration.focusedBorder,
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: defaultTheme.colorScheme.primary, width: 2.0)),
    );
    expect(
      hourDecoration.focusedErrorBorder,
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        borderSide: BorderSide(color: defaultTheme.colorScheme.error, width: 2.0)),
    );
    expect(
      hourDecoration.hintStyle,
      TextStyle(color: defaultTheme.colorScheme.onSurface.withOpacity(0.36))
    );

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'Cancel');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));

    final ButtonStyle confirmButtonStyle = _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(TextButton.styleFrom().toString()));
  });

  testWidgets('Material2 - Time picker uses values from TimePickerThemeData', (WidgetTester tester) async {
    final TimePickerThemeData timePickerTheme = _timePickerTheme();
    final ThemeData theme = ThemeData(timePickerTheme: timePickerTheme, useMaterial3: false);
    await tester.pumpWidget(_TimePickerLauncher(themeData: theme));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Material dialogMaterial = _dialogMaterial(tester);
    expect(dialogMaterial.color, timePickerTheme.backgroundColor);
    expect(dialogMaterial.shape, timePickerTheme.shape);

    final RenderBox dial = tester.firstRenderObject<RenderBox>(find.byType(CustomPaint));
    expect(
      dial,
      paints
        ..circle(color: Color(timePickerTheme.dialBackgroundColor!.value)) // Dial background color.
        ..circle(color: Color(timePickerTheme.dialHandColor!.value)), // Dial hand color.
    );

    final RenderParagraph hourText = _textRenderParagraph(tester, '7');
    expect(
      hourText.text.style,
      Typography.material2014().englishLike.bodyMedium!
        .merge(Typography.material2014().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _selectedColor),
    );

    final RenderParagraph minuteText = _textRenderParagraph(tester, '15');
    expect(
      minuteText.text.style,
      Typography.material2014().englishLike.bodyMedium!
        .merge(Typography.material2014().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _unselectedColor),
    );

    final RenderParagraph amText = _textRenderParagraph(tester, 'AM');
    expect(
      amText.text.style,
      Typography.material2014().englishLike.titleMedium!
        .merge(Typography.material2014().black.titleMedium)
        .merge(timePickerTheme.dayPeriodTextStyle)
        .copyWith(color: _selectedColor),
    );

    final RenderParagraph pmText = _textRenderParagraph(tester, 'PM');
    expect(
      pmText.text.style,
      Typography.material2014().englishLike.titleMedium!
        .merge(Typography.material2014().black.titleMedium)
        .merge(timePickerTheme.dayPeriodTextStyle)
        .copyWith(color: _unselectedColor),
    );

    final RenderParagraph helperText = _textRenderParagraph(tester, 'SELECT TIME');
    expect(
      helperText.text.style,
      Typography.material2014().englishLike.bodyMedium!
        .merge(Typography.material2014().black.bodyMedium)
        .merge(timePickerTheme.helpTextStyle),
    );

    final CustomPaint dialPaint = tester.widget(findDialPaint);
    final dynamic dialPainter = dialPaint.painter;
    // ignore: avoid_dynamic_calls
    final List<dynamic> primaryLabels = dialPainter.primaryLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      primaryLabels.first.painter.text.style,
      Typography.material2014().englishLike.bodyLarge!
        .merge(Typography.material2014().black.bodyLarge)
        .copyWith(color: _unselectedColor),
    );
    // ignore: avoid_dynamic_calls
    final List<dynamic> selectedLabels = dialPainter.selectedLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      selectedLabels.first.painter.text.style,
      Typography.material2014().englishLike.bodyLarge!
        .merge(Typography.material2014().white.bodyLarge)
        .copyWith(color: _selectedColor),
    );

    final Material hourMaterial = _textMaterial(tester, '7');
    expect(hourMaterial.color, _selectedColor);
    expect(hourMaterial.shape, timePickerTheme.hourMinuteShape);

    final Material minuteMaterial = _textMaterial(tester, '15');
    expect(minuteMaterial.color, _unselectedColor);
    expect(minuteMaterial.shape, timePickerTheme.hourMinuteShape);

    final Material amMaterial = _textMaterial(tester, 'AM');
    expect(amMaterial.color, _selectedColor);

    final Material pmMaterial = _textMaterial(tester, 'PM');
    expect(pmMaterial.color, _unselectedColor);

    final Material dayPeriodMaterial = _dayPeriodMaterial(tester);
    expect(
      dayPeriodMaterial.shape,
      timePickerTheme.dayPeriodShape!.copyWith(side: timePickerTheme.dayPeriodBorderSide),
    );

    final Container dayPeriodDivider = _dayPeriodDivider(tester);
    expect(
      dayPeriodDivider.decoration,
      BoxDecoration(border: Border(left: timePickerTheme.dayPeriodBorderSide!)),
    );

    final IconButton entryModeIconButton = _entryModeIconButton(tester);
    expect(
      entryModeIconButton.color,
      timePickerTheme.entryModeIconColor,
    );

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'CANCEL');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(timePickerTheme.cancelButtonStyle.toString()));

    final ButtonStyle confirmButtonStyle = _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(timePickerTheme.confirmButtonStyle.toString()));
  });

  testWidgets('Material3 - Time picker uses values from TimePickerThemeData', (WidgetTester tester) async {
    final TimePickerThemeData timePickerTheme = _timePickerTheme();
    final ThemeData theme = ThemeData(timePickerTheme: timePickerTheme, useMaterial3: true);
    await tester.pumpWidget(_TimePickerLauncher(themeData: theme));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final Material dialogMaterial = _dialogMaterial(tester);
    expect(dialogMaterial.color, timePickerTheme.backgroundColor);
    expect(dialogMaterial.shape, timePickerTheme.shape);

    final RenderBox dial = tester.firstRenderObject<RenderBox>(find.byType(CustomPaint));
    expect(
      dial,
      paints
        ..circle(color: Color(timePickerTheme.dialBackgroundColor!.value)) // Dial background color.
        ..circle(color: Color(timePickerTheme.dialHandColor!.value)), // Dial hand color.
    );

    final RenderParagraph hourText = _textRenderParagraph(tester, '7');
    expect(
      hourText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _selectedColor, decorationColor: const Color(0xff1c1b1f)),
    );

    final RenderParagraph minuteText = _textRenderParagraph(tester, '15');
    expect(
      minuteText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _unselectedColor, decorationColor: const Color(0xff1c1b1f)),
    );

    final RenderParagraph amText = _textRenderParagraph(tester, 'AM');
    expect(
      amText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _selectedColor, decorationColor: const Color(0xff1c1b1f)),
    );

    final RenderParagraph pmText = _textRenderParagraph(tester, 'PM');
    expect(
      pmText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .merge(timePickerTheme.hourMinuteTextStyle)
        .copyWith(color: _unselectedColor, decorationColor: const Color(0xff1c1b1f)),
    );

    final RenderParagraph helperText = _textRenderParagraph(tester, 'Select time');
    expect(
      helperText.text.style,
      Typography.material2021().englishLike.bodyMedium!
        .merge(Typography.material2021().black.bodyMedium)
        .merge(timePickerTheme.helpTextStyle).copyWith(
          color: theme.colorScheme.onSurface,
          decorationColor: theme.colorScheme.onSurface
        ),
    );

    final CustomPaint dialPaint = tester.widget(findDialPaint);
    final dynamic dialPainter = dialPaint.painter;
    // ignore: avoid_dynamic_calls
    final List<dynamic> primaryLabels = dialPainter.primaryLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      primaryLabels.first.painter.text.style,
      Typography.material2021().englishLike.bodyLarge!
        .merge(Typography.material2021().black.bodyLarge)
        .copyWith(color: _unselectedColor, decorationColor: theme.colorScheme.onSurface),
    );
    // ignore: avoid_dynamic_calls
    final List<dynamic> selectedLabels = dialPainter.selectedLabels as List<dynamic>;
    expect(
      // ignore: avoid_dynamic_calls
      selectedLabels.first.painter.text.style,
      Typography.material2021().englishLike.bodyLarge!
        .merge(Typography.material2021().black.bodyLarge)
        .copyWith(color: _selectedColor, decorationColor: theme.colorScheme.onSurface),
    );

    final Material hourMaterial = _textMaterial(tester, '7');
    expect(hourMaterial.color, _selectedColor);
    expect(hourMaterial.shape, timePickerTheme.hourMinuteShape);

    final Material minuteMaterial = _textMaterial(tester, '15');
    expect(minuteMaterial.color, _unselectedColor);
    expect(minuteMaterial.shape, timePickerTheme.hourMinuteShape);

    final Material amMaterial = _textMaterial(tester, 'AM');
    expect(amMaterial.color, _selectedColor);

    final Material pmMaterial = _textMaterial(tester, 'PM');
    expect(pmMaterial.color, _unselectedColor);

    final Material dayPeriodMaterial = _dayPeriodMaterial(tester);
    expect(
      dayPeriodMaterial.shape,
      timePickerTheme.dayPeriodShape!.copyWith(side: timePickerTheme.dayPeriodBorderSide),
    );

    final Container dayPeriodDivider = _dayPeriodDivider(tester);
    expect(
      dayPeriodDivider.decoration,
      BoxDecoration(border: Border(left: timePickerTheme.dayPeriodBorderSide!)),
    );

    final IconButton entryModeIconButton = _entryModeIconButton(tester);
    expect(entryModeIconButton.color, null);

    final ButtonStyle cancelButtonStyle = _actionButtonStyle(tester, 'Cancel');
    expect(cancelButtonStyle.toString(), equalsIgnoringHashCodes(timePickerTheme.cancelButtonStyle.toString()));

    final ButtonStyle confirmButtonStyle = _actionButtonStyle(tester, 'OK');
    expect(confirmButtonStyle.toString(), equalsIgnoringHashCodes(timePickerTheme.confirmButtonStyle.toString()));
  });

  testWidgets('Time picker uses values from TimePickerThemeData with InputDecorationTheme - input mode', (WidgetTester tester) async {
    final TimePickerThemeData timePickerTheme = _timePickerTheme(includeInputDecoration: true);
    final ThemeData theme = ThemeData(timePickerTheme: timePickerTheme);
    await tester.pumpWidget(_TimePickerLauncher(themeData: theme, entryMode: TimePickerEntryMode.input));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final InputDecoration hourDecoration = _textField(tester, '7').decoration!;
    expect(hourDecoration.filled, timePickerTheme.inputDecorationTheme!.filled);
    expect(hourDecoration.fillColor, timePickerTheme.inputDecorationTheme!.fillColor);
    expect(hourDecoration.enabledBorder, timePickerTheme.inputDecorationTheme!.enabledBorder);
    expect(hourDecoration.errorBorder, timePickerTheme.inputDecorationTheme!.errorBorder);
    expect(hourDecoration.focusedBorder, timePickerTheme.inputDecorationTheme!.focusedBorder);
    expect(hourDecoration.focusedErrorBorder, timePickerTheme.inputDecorationTheme!.focusedErrorBorder);
    expect(hourDecoration.hintStyle, timePickerTheme.inputDecorationTheme!.hintStyle);
  });

  testWidgets('Time picker uses values from TimePickerThemeData without InputDecorationTheme - input mode', (WidgetTester tester) async {
    final TimePickerThemeData timePickerTheme = _timePickerTheme();
    final ThemeData theme = ThemeData(timePickerTheme: timePickerTheme);
    await tester.pumpWidget(_TimePickerLauncher(themeData: theme, entryMode: TimePickerEntryMode.input));
    await tester.tap(find.text('X'));
    await tester.pumpAndSettle(const Duration(seconds: 1));

    final InputDecoration hourDecoration = _textField(tester, '7').decoration!;
    expect(hourDecoration.fillColor?.value, timePickerTheme.hourMinuteColor?.value);
  });
}

final Color _selectedColor = Colors.green[100]!;
final Color _unselectedColor = Colors.green[200]!;

TimePickerThemeData _timePickerTheme({bool includeInputDecoration = false}) {
  Color getColor(Set<MaterialState> states) {
    return states.contains(MaterialState.selected) ? _selectedColor : _unselectedColor;
  }
  final MaterialStateColor materialStateColor = MaterialStateColor.resolveWith(getColor);
  return TimePickerThemeData(
    backgroundColor: Colors.orange,
    cancelButtonStyle: TextButton.styleFrom(primary: Colors.red),
    confirmButtonStyle: TextButton.styleFrom(primary: Colors.green),
    hourMinuteTextColor: materialStateColor,
    hourMinuteColor: materialStateColor,
    dayPeriodTextColor: materialStateColor,
    dayPeriodColor: materialStateColor,
    dialHandColor: Colors.brown,
    dialBackgroundColor: Colors.pinkAccent,
    dialTextColor: materialStateColor,
    entryModeIconColor: Colors.red,
    hourMinuteTextStyle: const TextStyle(fontSize: 8.0),
    dayPeriodTextStyle: const TextStyle(fontSize: 8.0),
    helpTextStyle: const TextStyle(fontSize: 8.0),
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
    hourMinuteShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
    dayPeriodShape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
    dayPeriodBorderSide: const BorderSide(color: Colors.blueAccent),
    inputDecorationTheme: includeInputDecoration ? const InputDecorationTheme(
      filled: true,
      fillColor: Colors.purple,
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
      hintStyle: TextStyle(fontSize: 8),
    ) : null,
  );
}

class _TimePickerLauncher extends StatelessWidget {
  const _TimePickerLauncher({
    this.themeData,
    this.entryMode = TimePickerEntryMode.dial,
  });

  final ThemeData? themeData;
  final TimePickerEntryMode entryMode;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: Material(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                child: const Text('X'),
                onPressed: () async {
                  await showTimePicker(
                    context: context,
                    initialEntryMode: entryMode,
                    initialTime: const TimeOfDay(hour: 7, minute: 15),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

Material _dialogMaterial(WidgetTester tester) {
  return tester.widget<Material>(find.descendant(of: find.byType(Dialog), matching: find.byType(Material)).first);
}

Material _textMaterial(WidgetTester tester, String text) {
  return tester.widget<Material>(find.ancestor(of: find.text(text), matching: find.byType(Material)).first);
}

TextField _textField(WidgetTester tester, String text) {
  return tester.widget<TextField>(find.ancestor(of: find.text(text), matching: find.byType(TextField)).first);
}

Material _dayPeriodMaterial(WidgetTester tester) {
  return tester.widget<Material>(find.descendant(of: find.byWidgetPredicate((Widget w) => '${w.runtimeType}' == '_DayPeriodControl'), matching: find.byType(Material)).first);
}

Container _dayPeriodDivider(WidgetTester tester) {
  return tester.widget<Container>(find.descendant(of: find.byWidgetPredicate((Widget w) => '${w.runtimeType}' == '_DayPeriodControl'), matching: find.byType(Container)).at(0));
}

IconButton _entryModeIconButton(WidgetTester tester) {
  return tester.widget<IconButton>(find.descendant(of: find.byType(Dialog), matching: find.byType(IconButton)).first);
}

RenderParagraph _textRenderParagraph(WidgetTester tester, String text) {
  return tester.element<StatelessElement>(find.text(text).first).renderObject! as RenderParagraph;
}

final Finder findDialPaint = find.descendant(
  of: find.byWidgetPredicate((Widget w) => '${w.runtimeType}' == '_Dial'),
  matching: find.byWidgetPredicate((Widget w) => w is CustomPaint),
);

ButtonStyle _actionButtonStyle(WidgetTester tester, String text) {
  return tester.widget<TextButton>(find.widgetWithText(TextButton, text)).style!;
}
