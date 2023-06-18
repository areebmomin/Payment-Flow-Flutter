import 'package:flutter/material.dart';

class ThankYouPageAnimationWidget extends StatefulWidget {
  const ThankYouPageAnimationWidget({Key? key}) : super(key: key);

  @override
  State<ThankYouPageAnimationWidget> createState() =>
      _ThankYouPageAnimationWidgetState();
}

class _ThankYouPageAnimationWidgetState
    extends State<ThankYouPageAnimationWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) => _playAnimation());
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.topCenter,
        child: StaggerAnimation(controller: _controller.view),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class StaggerAnimation extends StatefulWidget {
  StaggerAnimation({super.key, required this.controller})
      : offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, -0.6),
          end: const Offset(0.0, 0.0),
        ).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.200, curve: Curves.easeInOutBack))),
        // sizeAnimation = Tween<double>(begin: 100.0, end: 200.0)
        //     .animate(CurvedAnimation(parent: controller, curve: const Interval(0.510, 0.999, curve: Curves.bounceOut)));
        sizeAnimation = TweenSequence<double>(
          <TweenSequenceItem<double>>[
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 100.0, end: 200.0).chain(CurveTween(
                  curve: Curves.bounceOut)),
              weight: 50,
            ),
            TweenSequenceItem<double>(
              tween: Tween<double>(begin: 200.0, end: 400.0).chain(CurveTween(
                  curve: Curves.bounceOut)),
              weight: 50,
            ),
          ],
        ).animate(CurvedAnimation(parent: controller, curve: const Interval(0.200, 0.999, curve: Curves.bounceOut)));

  final Animation<double> controller;
  final Animation<Offset> offsetAnimation;
  final Animation sizeAnimation;

  @override
  State<StaggerAnimation> createState() => _StaggerAnimationState();
}

class _StaggerAnimationState extends State<StaggerAnimation> {
  // This function is called each time the controller "ticks" a new frame.
  Widget _buildAnimation(BuildContext context, Widget? child) {
    return SlideTransition(
      position: widget.offsetAnimation,
      child: Center(
        child: Container(
          height: widget.sizeAnimation.value,
          width: widget.sizeAnimation.value,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: widget.controller,
    );
  }
}
