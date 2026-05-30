// @Description: 页面在前后台及路由切换时的生命周期监听抽象类
// @Author:      @Mr.pan

import 'package:flutter/material.dart';

/// 全局路由监听器，需在 [MaterialApp.navigatorObservers] 中进行注册：
/// ```dart
/// MaterialApp(
///   navigatorObservers: [lifeObserver],
///   ...
/// )
/// ```
final RouteObserver<Route<dynamic>> lifeObserver = RouteObserver<Route<dynamic>>();

/// 提供了对页面“前后台切换（AppLifecycle）”以及“路由进退（RouteAware）”进行统一回调封装的基类 [State]
abstract class LifeState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver, RouteAware {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final route = ModalRoute.of(context);
    if (route != null) {
      lifeObserver.subscribe(this, route);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    lifeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResume();
    } else if (state == AppLifecycleState.paused) {
      onPaused();
    }
  }

  @override
  void didPop() {
    onPaused();
  }

  @override
  void didPopNext() {
    onResume();
  }

  @override
  void didPush() {
    onResume();
  }

  @override
  void didPushNext() {
    onPaused();
  }

  /// 页面进入活跃（前台）状态时的回调。
  ///
  /// 触发场景包括：
  /// - 页面首次展示
  /// - 从后台切换回前台
  /// - 从下一个页面 pop 返回本页面
  void onResume();

  /// 页面进入非活跃（后台或被遮挡）状态时的回调。
  ///
  /// 触发场景包括：
  /// - 页面被 pop 销毁
  /// - 应用切换至后台运行
  /// - push 进入了下一个新页面
  void onPaused();
}
