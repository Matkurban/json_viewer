import 'package:flutter/material.dart';
import 'package:json_viewer/src/enum/json_type.dart';
import 'json_node_view.dart';
import 'json_row_view.dart';

/// JSON对象节点渲染类
/// Renderer for JSON object nodes
class JsonObjectView extends StatelessWidget {
  /// 当前对象的key名
  /// Key name of current object
  final String keyName;
  /// 当前对象的Map数据
  /// Map data of current object
  final Map jsonObject;
  /// 当前对象的路径
  /// Path of current object
  final String path;
  /// 当前对象的层级
  /// Level of current object
  final int level;
  /// 主题色：key
  /// Theme color: key
  final Color keyColor;
  /// 主题色：字符串
  /// Theme color: string
  final Color stringColor;
  /// 主题色：数字
  /// Theme color: number
  final Color numberColor;
  /// 主题色：布尔
  /// Theme color: bool
  final Color boolColor;
  /// 主题色：普通值
  /// Theme color: value
  final Color valueColor;
  /// 行间距
  /// Row spacing
  final double rowSpacing;
  /// 字体大小
  /// Font size
  final double fontSize;
  /// 缩进宽度
  /// Indent width
  final double indentWidth;
  /// 行自定义构建器
  /// Custom row builder
  final Widget Function(
    BuildContext context,
    String keyName,
    dynamic value,
    JsonType type,
    String path,
    TextStyle keyStyle,
    TextStyle valueStyle,
  )? rowBuilder;

  const JsonObjectView({
    super.key,
    required this.keyName,
    required this.jsonObject,
    required this.path,
    required this.level,
    required this.keyColor,
    required this.stringColor,
    required this.numberColor,
    required this.boolColor,
    required this.valueColor,
    required this.rowSpacing,
    required this.fontSize,
    required this.indentWidth,
    this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    // 空对象，直接一行显示 {}
    // Empty object, display as {}
    if (jsonObject.isEmpty) {
      return JsonRowView(
        context: context,
        keyName: keyName,
        value: "{ }",
        type: JsonType.objectStart,
        path: path,
        level: level,
        keyColor: keyColor,
        valueColor: valueColor,
        fontSize: fontSize,
        indentWidth: indentWidth,
        rowBuilder: rowBuilder,
      );
    }
    List<Widget> children = [];
    children.add(JsonRowView(
      context: context,
      keyName: keyName,
      value: '{',
      type: JsonType.objectStart,
      path: path,
      level: level,
      keyColor: keyColor,
      valueColor: valueColor,
      fontSize: fontSize,
      indentWidth: indentWidth,
      rowBuilder: rowBuilder,
    ));
    int index = 0;
    jsonObject.forEach((key, value) {
      children.add(JsonNodeView(
        keyName: key.toString(),
        value: value,
        path: '$path/$key',
        level: level + 1,
        keyColor: keyColor,
        stringColor: stringColor,
        numberColor: numberColor,
        boolColor: boolColor,
        valueColor: valueColor,
        rowSpacing: rowSpacing,
        fontSize: fontSize,
        indentWidth: indentWidth,
        rowBuilder: rowBuilder,
        isLast: index == jsonObject.length - 1,
      ));
      index++;
    });
    children.add(JsonRowView(
      context: context,
      keyName: '',
      value: '}',
      type: JsonType.objectEnd,
      path: path,
      level: level,
      keyColor: keyColor,
      valueColor: valueColor,
      fontSize: fontSize,
      indentWidth: indentWidth,
      rowBuilder: rowBuilder,
    ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children.map((child) => Padding(
        padding: EdgeInsets.symmetric(vertical: rowSpacing / 2),
        child: child,
      )).toList(),
    );
  }
}

