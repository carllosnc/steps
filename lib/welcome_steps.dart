import 'package:flutter/material.dart';
import '/welcome_screen.dart';

class WelcomeSteps extends StatefulWidget {
  final List<WelcomeScreen> screens;
  final Color backgroundColor;

  const WelcomeSteps({
    super.key,
    required this.screens,
    this.backgroundColor = Colors.red,
  });

  @override
  State<WelcomeSteps> createState() => _WelcomeStepsState();
}

class _WelcomeStepsState extends State<WelcomeSteps> {
  PageController? _controller;
  int _currentPage = 0;

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
    return Stack(
      children: [
        Positioned(
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
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.white
                              : Colors.white.withOpacity(0.3),
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
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
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
                        opacity:
                            _currentPage == widget.screens.length - 1 ? 0.3 : 1,
                        child: IconButton.filled(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          color: Colors.black,
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
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text('Enter'),
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
