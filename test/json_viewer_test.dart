import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kurban_json_viewer/kurban_json_viewer.dart';

void main() {
  testWidgets('正常渲染Map类型JSON', (WidgetTester tester) async {
    final jsonData = {
      'name': 'Kurban',
      'age': 28,
      'isDev': true,
      'skills': ['Flutter', 'Dart'],
    };
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: JsonViewer(jsonData: jsonData)),
      ),
    );
  });

  testWidgets('支持自定义contentPadding', (WidgetTester tester) async {
    final jsonData = {'a': 1};
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JsonViewer(
            jsonData: jsonData,
            contentPadding: const EdgeInsets.all(32),
          ),
        ),
      ),
    );
  });

  testWidgets('支持自定义rowBuilder', (WidgetTester tester) async {
    final jsonData = {'a': 1};
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: JsonViewer(
            jsonData: jsonData,
            rowBuilder:
                (context, key, value, type, path, keyStyle, valueStyle) {
                  return Text('custom-$key-$value');
                },
          ),
        ),
      ),
    );
  });
}
