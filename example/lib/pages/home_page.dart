import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Steps'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Manual Steps 1'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, "manual1");
            },
          ),
          ListTile(
            title: const Text('Manual Steps 2'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, "manual2");
            },
          )
        ],
      ),
    );
  }
}
