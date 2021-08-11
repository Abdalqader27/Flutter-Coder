import 'package:sembast/sembast.dart';

import '../../model/fruit.dart';
import '../app_database.dart';

class FruitDao {
  static const String kFruitStoreName = "fruits";
  final _fruitStore = intMapStoreFactory.store(kFruitStoreName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(Fruit fruit) async {
    await _fruitStore.add(await _db, fruit.toMap());
  }

  Future update(Fruit fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.update(await _db, fruit.toMap(), finder: finder);
  }

  Future delete(Fruit fruit) async {
    final finder = Finder(filter: Filter.byKey(fruit.id));
    await _fruitStore.delete(await _db, finder: finder);
  }

  Future<List<Fruit>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('name')]);
    final recordSnapshots = await _fruitStore.find(await _db, finder: finder);
    return recordSnapshots.map((e) {
      final fruit = Fruit.fromMap(e.value);
      fruit.id = e.key;
      return fruit;
    }).toList();
  }
}
