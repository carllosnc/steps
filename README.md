# Steps

> A Flutter package that provides a simple way to create a step-based user interface.

```dart
Scaffold(
  body: Center(
    child: ManualSteps(
      onExit: () {
        Navigator.pushNamed(context, "home");
      },
      screens: [
        ManualScreen(
          backgroundColor: Colors.deepPurple.shade600,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //...
            ],
          ),
        ),
        ManualScreen(
          backgroundColor: Colors.deepPurple.shade700,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //...
            ],
          ),
        ),
        ManualScreen(
          backgroundColor: Colors.deepPurple.shade800,
          content: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //...
            ],
          ),
        )
      ],
    ),
  ),
)
```

---

Carlos Costa @ 2025