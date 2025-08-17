/// JSON节点类型枚举
/// Enum for JSON node types
enum JsonType {
  /// 对象开始 {  Object start
  objectStart,

  /// 对象结束 }  Object end
  objectEnd,

  /// 数组开始 [  Array start
  arrayStart,

  /// 数组结束 ]  Array end
  arrayEnd,

  /// 原始值（字符串、数字、布尔等） Primitive value (string, number, bool, etc.)
  primitive,
}

