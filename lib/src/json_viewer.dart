import 'package:flutter/material.dart';
import 'package:kurban_json_view/src/enum/json_type.dart';
import 'package:kurban_json_view/src/widgets/json_node_view.dart';

/// JSON字符串可视化预览组件入口
/// Main entry for JSON string visual preview widget
class JsonViewer extends StatelessWidget {
  /// 需要展示的JSON数据
  /// The JSON data to display
  final Map<String, dynamic> jsonData;

  /// 卡片边距
  /// Card margin
  final EdgeInsetsGeometry margin;

  /// 行间距
  /// Row spacing
  final double rowSpacing;

  /// 行文字大小
  /// Font size for each row
  final double fontSize;

  /// 左侧缩进量
  /// Indent width for each level
  final double indentWidth;

  /// 卡片阴影
  /// Card elevation
  final double elevation;

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

  /// 点击事件
  /// Tap event
  final VoidCallback? onTap;

  /// 双击事件
  /// Double tap event
  final VoidCallback? onDoubleTap;

  /// 长按事件
  /// Long press event
  final VoidCallback? onLongPress;

  /// 内容区内边距
  /// Inner padding for content area
  final EdgeInsetsGeometry contentPadding;

  const JsonViewer({
    super.key,
    required this.jsonData,
    this.margin = EdgeInsets.zero,
    this.rowSpacing = 2.0,
    this.fontSize = 14,
    this.indentWidth = 10,
    this.rowBuilder,
    this.onLongPress,
    this.onTap,
    this.onDoubleTap,
    this.elevation = 0,
    this.contentPadding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    // 类型校验 Type check
    final keyColor = Theme.of(context).colorScheme.primary;
    final stringColor = Theme.of(context).colorScheme.secondary;
    final numberColor = Theme.of(context).colorScheme.tertiary;
    final boolColor = Theme.of(context).colorScheme.error;
    final valueColor = Theme.of(context).colorScheme.onSurface;

    return Card(
      margin: margin,
      elevation: elevation,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: contentPadding,
          child: JsonNodeView(
            keyName: '',
            value: jsonData,
            path: '',
            level: 0,
            keyColor: keyColor,
            stringColor: stringColor,
            numberColor: numberColor,
            boolColor: boolColor,
            valueColor: valueColor,
            rowSpacing: rowSpacing,
            fontSize: fontSize,
            indentWidth: indentWidth,
            rowBuilder: rowBuilder,
          ),
        ),
      ),
    );
  }
}

