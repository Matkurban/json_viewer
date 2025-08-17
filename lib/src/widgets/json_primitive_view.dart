import 'package:flutter/material.dart';
import 'package:kurban_json_view/src/enum/json_type.dart';
import 'package:kurban_json_view/src/widgets/json_row_view.dart';

/// JSON原始值节点渲染类
/// Renderer for JSON primitive value nodes
class JsonPrimitiveView extends StatelessWidget {
  /// 当前原始值的key名
  /// Key name of current primitive value
  final String keyName;
  /// 当前原始值
  /// Value of current primitive node
  final dynamic value;
  /// 当前节点路径
  /// Path of current node
  final String path;
  /// 当前节点层级
  /// Level of current node
  final int level;
  /// 是否为最后一个节点
  /// Is last node
  final bool isLast;
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

  const JsonPrimitiveView({
    super.key,
    required this.keyName,
    required this.value,
    required this.path,
    required this.level,
    required this.isLast,
    required this.keyColor,
    required this.stringColor,
    required this.numberColor,
    required this.boolColor,
    required this.valueColor,
    required this.fontSize,
    required this.indentWidth,
    this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return JsonRowView(
      context: context,
      keyName: keyName,
      value: value,
      type: JsonType.primitive,
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
