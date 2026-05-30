import 'package:flutter/material.dart';

/// 智能布局间距组件，能自动匹配父 Flex 布局的主轴方向
class Gap extends StatelessWidget {
  /// 间距的大小（主轴上的延伸大小）
  final double mainAxisExtent;

  /// 显式指定的排布方向。
  ///
  /// 如果为 `null`，则在渲染时会自动寻找最近的祖先 [Flex]（如 [Row]、[Column]）来推导主轴方向。
  /// 若上层无 [Flex]，默认使用 [Axis.vertical] 渲染。
  final Axis? direction;

  const Gap(
    this.mainAxisExtent, {
    super.key,
    this.direction,
  }) : assert(mainAxisExtent >= 0.0, 'mainAxisExtent must be non-negative');

  @override
  Widget build(BuildContext context) {
    if (direction != null) {
      return _buildSizedBox(direction!);
    }

    // 向上遍历祖先 Element，寻找最近的 Flex (Row/Column/Flex)
    Axis? inferredDirection;
    context.visitAncestorElements((element) {
      final widget = element.widget;
      if (widget is Flex) {
        inferredDirection = widget.direction;
        return false; // 找到后立即终止遍历
      }
      return true; // 继续向上遍历
    });

    // 找不到时，默认为垂直方向间距
    return _buildSizedBox(inferredDirection ?? Axis.vertical);
  }

  Widget _buildSizedBox(Axis dir) {
    return SizedBox(
      width: dir == Axis.horizontal ? mainAxisExtent : 0.0,
      height: dir == Axis.vertical ? mainAxisExtent : 0.0,
    );
  }
}
