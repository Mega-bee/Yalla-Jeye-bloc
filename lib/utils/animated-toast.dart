import 'package:flutter/material.dart';

class CustomToast extends StatefulWidget {
  final String message;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final Duration duration;

  CustomToast({
    required this.message,
    required this.icon,
    this.backgroundColor = Colors.black87,
    this.iconColor = Colors.white,
    this.duration = const Duration(seconds: 2),
  });

  @override
  _CustomToastState createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Future.delayed(widget.duration, () {
      _animationController.reverse();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: child,
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [widget.backgroundColor, widget.backgroundColor.withOpacity(0.8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: widget.iconColor),
            SizedBox(width: 12),
            Text(
              widget.message,
              style: TextStyle(color: widget.iconColor),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
