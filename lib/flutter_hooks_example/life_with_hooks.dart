import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePageHooks extends HookWidget {
  const HomePageHooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hideFabAnimController = useAnimationController(
      duration: kThemeAnimationDuration,
      initialValue: 1,
    );
    final scrollController = useScrollControllerForAnimation(hideFabAnimController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Scroll"),
      ),
      floatingActionButton: FadeTransition(
        opacity: hideFabAnimController,
        child: ScaleTransition(
          scale: hideFabAnimController,
          child: FloatingActionButton.extended(
            label: const Text('Useless Floating Action Button'),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        controller: scrollController,
        children: <Widget>[
          for (int i = 0; i < 5; i++) const Card(child: FittedBox(child: FlutterLogo())),
        ],
      ),
    );
  }

  ScrollController useScrollControllerForAnimation(AnimationController animationController) {
    /// Hooks. use is @deprecated
    return use(_ScrollControllerForAnimationHook(animationController: animationController));
  }
}

/// HOOK Separation-------------------------------------------------------------------------------------------------------------------------

class _ScrollControllerForAnimationHook extends Hook<ScrollController> {
  final AnimationController animationController;

  const _ScrollControllerForAnimationHook({required this.animationController});

  @override
  _ScrollControllerForAnimationHookState createState() => _ScrollControllerForAnimationHookState();
}

class _ScrollControllerForAnimationHookState extends HookState<ScrollController, _ScrollControllerForAnimationHook> {
  late ScrollController _scrollController;

  @override
  void initHook() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      switch (_scrollController.position.userScrollDirection) {
        case ScrollDirection.forward:
          // State has the "widget" property
          // HookState has the "hook" property
          hook.animationController.forward();
          break;
        case ScrollDirection.reverse:
          hook.animationController.reverse();
          break;
        case ScrollDirection.idle:
          break;
      }
    });
  }

  // Build doesn't return a Widget but rather the ScrollController
  @override
  ScrollController build(BuildContext context) => _scrollController;

  // This is what we came here for
  @override
  void dispose() => _scrollController.dispose();
}
