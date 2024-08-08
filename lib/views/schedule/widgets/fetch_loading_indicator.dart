import 'package:fetch_application/constants/colors.dart';
import 'package:flutter/material.dart';

class FetchLoadingIndicator extends StatefulWidget {
  const FetchLoadingIndicator({super.key});

  @override
  State<FetchLoadingIndicator> createState() => _FetchLoadingIndicatorState();
}

class _FetchLoadingIndicatorState extends State<FetchLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.25, end: 0.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBodyPrimaryBackground,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: Image.asset('images/other/fetch_loading.png'),
            );
          },
        ),
      ),
    );
  }
}
