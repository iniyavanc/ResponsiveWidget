// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:demo2/common_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends ConsumerStatefulWidget {
  const MyHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyhomeState();
}

class _MyhomeState extends ConsumerState<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          desktop: Column(
            children: [
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: Text((index + 1).toString()),
                      ),
                      title: Text('Item ${index + 1}'),
                      subtitle: Text('Subtitle for item ${index + 1}'),
                    );
                  },
                ),
              ),
            ],
          ),
          mobile: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Row(
                    children: [
                      Container(
                          width: 150,
                          color: Colors.red,
                          child: Text('Subtitle for item ${index + 1}')),
                    ],
                  ),
                );
              },
            ),
          ),
          tablet: Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text((index + 1).toString()),
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Row(
                    children: [
                      Container(
                          width: 150,
                          color: Colors.green,
                          child: Text('Subtitle for item ${index + 1}')),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
