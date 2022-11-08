import 'package:counter_bloc07/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NewPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final _bloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                initialData: 0,
                stream: _bloc.counterStream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline4,
                  );
                }
            ),
            StreamBuilder(
              stream: null,
              builder: (context, snapshot) {
                return ElevatedButton(onPressed: (){
                  snapshot.hasData?() => changeThePage(context):snapshot.data;
                },
                    child: Text('Next Page'));
              }
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(DecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(ResetEvent());
            },
            tooltip: 'Reset',
            child: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),

    );
  }

  changeThePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageTwo()));
  }
}
