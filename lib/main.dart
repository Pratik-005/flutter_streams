import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamController<String> controller = StreamController<String>();
  TextEditingController textController = TextEditingController();
  late Stream<String> dataStream;

  @override
  void initState() {
    dataStream = controller.stream.asBroadcastStream();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Streams')),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              // StreamBuilder(

              //   stream: controller.stream,
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return Text(
              //         snapshot.data ?? 'Null Data',
              //         style: TextStyle(
              //           fontSize: 30,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       );
              //     }
              //     return Text(
              //       'No Data',
              //       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              //     );
              //   },
              // ),
              SizedBox(
                width: 200,
                child: TextField(controller: textController),
              ),
              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      'No Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),

              StreamBuilder<String>(
                stream: dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data ?? 'Null Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else {
                    return Text(
                      'No Data',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                },
              ),

              ElevatedButton(
                onPressed: () {
                  controller.add(textController.text);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
