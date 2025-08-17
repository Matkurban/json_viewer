import 'package:flutter/material.dart';
import 'package:kurban_json_viewer/src/enum/json_type.dart';

/// JSON行渲染类
/// Renderer for a single JSON row
class JsonRowView extends StatelessWidget {
  /// 构建上下文
  /// Build context
  final BuildContext context;

  /// 当前行的key名
  /// Key name of current row
  final String keyName;

  /// 当前行的值
  /// Value of current row
  final dynamic value;

  /// 当前行类型
  /// Type of current row
  final JsonType type;

  /// 当前行路径
  /// Path of current row
  final String path;

  /// 当前行层级
  /// Level of current row
  final int level;

  /// 是否为最后一个节点
  /// Is last node
  final bool isLast;

  /// 主题色：key
  /// Theme color: key
  final Color keyColor;

  /// 主题色：字符串
  /// Theme color: string
  final Color? stringColor;

  /// 主题色：数字
  /// Theme color: number
  final Color? numberColor;

  /// 主题色：布尔
  /// Theme color: bool
  final Color? boolColor;

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
  )?
  rowBuilder;

  const JsonRowView({
    super.key,
    required this.context,
    required this.keyName,
    required this.value,
    required this.type,
    required this.path,
    required this.level,
    this.isLast = false,
    required this.keyColor,
    this.stringColor,
    this.numberColor,
    this.boolColor,
    required this.valueColor,
    required this.fontSize,
    required this.indentWidth,
    this.rowBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle keyStyle = TextStyle(color: keyColor, fontSize: fontSize);
    Color vColor = valueColor;
    String displayValue = value.toString();
    if (type == JsonType.primitive) {
      if (value is String) {
        displayValue = '"$value"${isLast ? '' : ','}';
        vColor = stringColor ?? valueColor;
      } else if (value is num) {
        displayValue = '$value${isLast ? '' : ','}';
        vColor = numberColor ?? valueColor;
      } else if (value is bool) {
        displayValue = '$value${isLast ? '' : ','}';
        vColor = boolColor ?? valueColor;
      }
    } else if (type == JsonType.objectStart) {
      displayValue = '{';
    } else if (type == JsonType.objectEnd) {
      displayValue = '}';
    } else if (type == JsonType.arrayStart) {
      displayValue = '[';
    } else if (type == JsonType.arrayEnd) {
      displayValue = ']';
    }
    final TextStyle valueStyle = TextStyle(color: vColor, fontSize: fontSize);
    if (rowBuilder != null) {
      return rowBuilder!(
        context,
        keyName,
        value,
        type,
        path,
        keyStyle,
        valueStyle,
      );
    }
    return Padding(
      padding: EdgeInsets.only(left: indentWidth * level),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: fontSize),
          children: [
            if (type != JsonType.objectEnd &&
                type != JsonType.arrayEnd &&
                keyName.isNotEmpty)
              TextSpan(text: '"$keyName" : ', style: keyStyle),
            TextSpan(text: displayValue, style: valueStyle),
          ],
        ),
        softWrap: true,
      ),
    );
  }
}
