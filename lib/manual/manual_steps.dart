import 'package:flutter/material.dart';
import 'manual_screen.dart';

class ManualSteps extends StatefulWidget {
  final List<ManualScreen> screens;
  final Color backgroundColor;
  final ButtonStyle? buttonStyle;
  final Color? dotColor;
  final Color? selectedDotColor;
  final VoidCallback? onExit;
  final Text exitText;

  const ManualSteps({
    super.key,
    required this.screens,
    this.backgroundColor = Colors.red,
    this.buttonStyle,
    this.dotColor,
    this.selectedDotColor,
    this.onExit,
    this.exitText = const Text("Exit"),
  });

  @override
  State<ManualSteps> createState() => _ManualStepsState();
}

class _ManualStepsState extends State<ManualSteps> {
  PageController? _controller;
  int _currentPage = 0;

  ButtonStyle getButtonStyle() {
    ButtonStyle currentStyle = widget.buttonStyle ??
        FilledButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        );

    return currentStyle;
  }

  Color getDotColor() {
    return widget.dotColor ?? Colors.white;
  }

  Color getSelectedDotColor() {
    return widget.selectedDotColor ?? Colors.black;
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _controller!.addListener(() {
      setState(() {
        _currentPage = _controller!.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.screens.length < 2) {
      throw Exception("ManualSteps must have at least 2 screens");
    }

    return Stack(
      key: const Key("manual-steps-stack"),
      children: [
        Positioned(
          key: const Key("manual-steps-items"),
          child: Container(
            color: widget.backgroundColor,
            child: PageView(
              controller: _controller,
              children: [
                for (var screen in widget.screens) screen,
              ],
            ),
          ),
        ),
        Positioned(
          key: const Key("manual-steps-controls"),
          bottom: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (var index = 0; index < widget.screens.length; index++)
                      Container(
                        key: Key("manual-steps-dot-$index"),
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: _currentPage == index ? getDotColor() : getSelectedDotColor(),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: _currentPage == 0 ? 0.3 : 1,
                      child: IconButton.filled(
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.black,
                        style: getButtonStyle(),
                        onPressed: () {
                          _controller!.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    if (!(_currentPage == widget.screens.length - 1))
                      Opacity(
                        opacity: _currentPage == widget.screens.length - 1 ? 0.3 : 1,
                        child: IconButton.filled(
                          style: getButtonStyle(),
                          icon: const Icon(Icons.chevron_right),
                          onPressed: () {
                            _controller!.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                        ),
                      ),
                    if (_currentPage == widget.screens.length - 1)
                      FilledButton(
                        style: getButtonStyle(),
                        onPressed: widget.onExit ?? () => {},
                        child: widget.exitText,
                      ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
