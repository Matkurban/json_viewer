<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# JsonViewer

一个用于Flutter的JSON字符串可视化预览组件，支持主题色染色、结构化展示、行自定义渲染等功能。
A Flutter widget for visualizing JSON strings, supporting theme-based coloring, structured display, and custom row rendering.

## Features / 功能
- 自动结构化展示JSON数据
- 支持对象、数组、原始值多层嵌套
- 主题色染色，自动适配App主题
- 支持自定义行渲染（rowBuilder）
- 支持点击、双击、长按事件
- 可配置行间距、缩进、字体大小等

## Getting Started / 快速开始
在 `pubspec.yaml` 添加依赖：
```yaml
json_viewer:
  git:
    url: https://github.com/your-repo/json_viewer.git
```
或
```yaml
json_viewer: ^最新版本号
```

## Usage / 用法示例
```dart
import 'package:json_viewer/kurban_json_viewer.dart';

final Map<String, dynamic> jsonData = {
  "name": "Kurban",
  "age": 28,
  "isDeveloper": true,
  "skills": ["Flutter", "Dart", "JSON"]
};

KurbanJsonViewer(
  jsonData: jsonData,
)
```

## Customization / 个性化配置
- margin: 卡片边距
- rowSpacing: 行间距
- fontSize: 字体大小
- indentWidth: 缩进宽度
- elevation: 卡片阴影
- rowBuilder: 行自定义渲染
- onTap/onDoubleTap/onLongPress: 交互事件

所有颜色均自动使用主题色，无需手动配置。
All colors use theme colors automatically.

### 自定义行渲染示例
```dart
KurbanJsonViewer(
  jsonData: jsonData,
  rowBuilder: (context, key, value, type, path, keyStyle, valueStyle) {
    return Row(
      children: [
        Text(key, style: keyStyle),
        const SizedBox(width: 8),
        Text(value.toString(), style: valueStyle),
      ],
    );
  },
)
```

## Theme / 主题色说明
组件会自动使用当前主题的主色、辅助色、错误色等进行染色。
The widget automatically uses the current theme's primary, secondary, error, and surface colors.

## Contributing / 贡献
欢迎提交PR或Issue，帮助完善本组件。
Feel free to submit PRs or Issues to help improve this widget.

## License
MIT
