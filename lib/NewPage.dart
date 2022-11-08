import 'package:counter_bloc07/counter_bloc.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = CounterBloc();
    return Scaffold(
      appBar: AppBar(
          title: const Text("Home")
      ),
      body:  Center(
        child:Text('Welcome',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            )
    ));
          }

}
