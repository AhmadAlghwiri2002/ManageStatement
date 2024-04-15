import 'package:flutter/material.dart';
import 'package:training/cubit.dart';
import 'package:training/cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Pay(),
    );
  }
}

class Pay extends StatelessWidget {
  Pay({super.key});
  final l = List<double>.generate(42, (index) => index + 1.0);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CostCubit(),
      child: BlocConsumer<CostCubit, CostState>(
          builder: (context, state) {
            final addCert = CostCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text("Cost of Items : ${state.cost}"),
              ),
              body: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: l.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Card(
                      child: Center(
                        child: Text(
                          "${l[index]}",
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    onTap: () {
                      addCert.addToCert(l[index]);
                    },
                    onLongPress: () {
                      addCert.removeFromCert(l[index]);
                    },
                  );
                },
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
