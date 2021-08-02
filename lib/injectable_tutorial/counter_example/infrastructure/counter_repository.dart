import 'package:injectable/injectable.dart';

import '../domain/i_counter_repository.dart';

@Named("CounterRepository")
@Injectable(as: ICounterRepository)
class CounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 1;
}
