import 'package:flutter/material.dart';

///
///页面生命周期
///
final RouteObserver<Route> lifeObserver = RouteObserver();

abstract class LifeState<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver, RouteAware {

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    lifeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
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

  void didPop() {
    onPaused();
  }

  void didPopNext() {
    onResume();
  }

  void didPush() {
    onResume();
  }

  void didPushNext() {
    onPaused();
  }

  void onResume();

  void onPaused();
}

