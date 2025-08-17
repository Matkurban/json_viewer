import 'package:flutter/material.dart';
import 'package:json_viewer/src/enum/json_type.dart';
import 'json_object_view.dart';
import 'json_array_view.dart';
import 'json_primitive_view.dart';

/// JSON节点渲染分发类
/// Dispatcher for rendering JSON nodes
class JsonNodeView extends StatelessWidget {
  /// 当前节点的key名
  /// Key name of current node
  final String keyName;
  /// 当前节点的值
  /// Value of current node
  final dynamic value;
  /// 当前节点的路径
  /// Path of current node
  final String path;
  /// 当前节点的层级
  /// Level of current node
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
  /// 是否为最后一个节点
  /// Is last node
  final bool isLast;

  const JsonNodeView({
    super.key,
    required this.keyName,
    required this.value,
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
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    if (value is Map) {
      return JsonObjectView(
        keyName: keyName,
        jsonObject: value,
        path: path,
        level: level,
        keyColor: keyColor,
        stringColor: stringColor,
        numberColor: numberColor,
        boolColor: boolColor,
        valueColor: valueColor,
        rowSpacing: rowSpacing,
        fontSize: fontSize,
        indentWidth: indentWidth,
        rowBuilder: rowBuilder,
      );
    } else if (value is List) {
      return JsonArrayView(
        keyName: keyName,
        jsonArray: value,
        path: path,
        level: level,
        keyColor: keyColor,
        stringColor: stringColor,
        numberColor: numberColor,
        boolColor: boolColor,
        valueColor: valueColor,
        rowSpacing: rowSpacing,
        fontSize: fontSize,
        indentWidth: indentWidth,
        rowBuilder: rowBuilder,
      );
    } else {
      return JsonPrimitiveView(
        keyName: keyName,
        value: value,
        path: path,
        level: level,
        isLast: isLast,
        keyColor: keyColor,
        stringColor: stringColor,
        numberColor: numberColor,
        boolColor: boolColor,
        valueColor: valueColor,
        fontSize: fontSize,
        indentWidth: indentWidth,
        rowBuilder: rowBuilder,
      );
    }
  }
}

