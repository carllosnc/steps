# Steps

```dart

Scaffold(
  body: Center(
    child: WelcomeSteps(
      screens: [
        WelcomeScreen(
          backgroundColor: Colors.red.shade600,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ /* content */ ],
          ),
        ),
        WelcomeScreen(
          backgroundColor: Colors.red.shade700,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ /* content */ ],
          ),
        ),
        WelcomeScreen(
          backgroundColor: Colors.red.shade800,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ /* content */ ],
          ),
        )
      ],
    ),
  ),
)

```