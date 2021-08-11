import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../sembast_example/fruit/fruit_event.dart';
import '../sembast_example/fruit/fruit_state.dart';
import 'fruit/fruit_bloc.dart';
import 'model/fruit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  const HomePage({Key? key}) : super(key: key);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit app'),
      ),
      body: BlocConsumer<FruitBloc, FruitState>(
        listener: (context, state) {
          debugPrint(state.toString());
        },
        buildWhen: (previous, current) => true,
        builder: (BuildContext context, FruitState state) {
          if (state is FruitsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FruitsLoaded) {
            return ListView.builder(
              itemCount: state.fruits.length,
              itemBuilder: (context, index) {
                final displayedFruit = state.fruits[index];
                return ListTile(
                  title: Text(displayedFruit.name),
                  subtitle: Text(displayedFruit.isSweet ? 'Very sweet!' : 'Sooo sour!'),
                  trailing: _buildUpdateDeleteButtons(displayedFruit),
                );
              },
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<FruitBloc>().add(AddRandomFruit());
        },
      ),
    );
  }

  Row _buildUpdateDeleteButtons(Fruit displayedFruit) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            context.read<FruitBloc>().add(UpdateWithRandomFruit(displayedFruit));
          },
        ),
        IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () {
            context.read<FruitBloc>().add(DeleteFruit(displayedFruit));
          },
        ),
      ],
    );
  }
}
