import 'package:get_it/get_it.dart';
import 'package:test_app/data/data_source/local_data_source.dart';
import 'package:test_app/domain/repository/orders_repo.dart';
import 'package:test_app/presentation/provider/orders_provider.dart';

import '../data/repository/orders_repo_impl.dart';
import '../domain/usecase/order_use_case.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerFactory(() => OrdersProvider(getIt()));

  getIt.registerLazySingleton(() => GetOrdersUseCase(getIt()));

  getIt.registerLazySingleton<OrdersRepo>(() => OrdersRepoImpl(getIt()));

  getIt.registerLazySingleton<OrdersLocalDataSource>(
      () => OrdersLocalDataSourceImpl());
}
