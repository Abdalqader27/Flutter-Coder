import 'package:injectable/injectable.dart';

import '../domain/i_counter_repository.dart';

@Named("DevCounterRepository")
@Injectable(as: ICounterRepository)
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}
