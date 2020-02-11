import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moshaf/feature/data/data_repositry/DataRepositry.dart';
import 'package:moshaf/feature/data/local_data_source/shared_preferences.dart';
import 'package:moshaf/feature/data/local_data_source/sqflite_database.dart';
import 'package:moshaf/feature/data/remote_data_source/RemoteDataSource.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_name.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_page.dart';
import 'package:moshaf/feature/domain/use_cases/case_get_all_body.dart';
import 'package:moshaf/feature/domain/use_cases/case_save_page_num.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/data/local_data_source/LocalDataSource.dart';
import 'feature/domain/domain_repositry/DomainRepository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! feature
  // for bloc
  // * cases
  sl.registerLazySingleton(
      () => CaseGetAllName(sl())); //? need domain repositry

  sl.registerLazySingleton(
      () => CaseGetAllBody(sl())); //? need domain repositry
  sl.registerLazySingleton(
      () => CaseGetAllPage(sl())); //? need domain repositry
  sl.registerLazySingleton(
      () => CaseSetAndGetPageNum(sl())); //? need domain repositry
  // * repository
  sl.registerLazySingleton<DomainRepository>(
      () => DataRepositry(remoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImp(firestore: sl()));
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImp(dbHelper: sl(), sharedPreference: sl()));
  sl.registerLazySingleton(() => GetSharedPreference(sharedPreferences: sl()));
  //! external
  sl.registerLazySingleton(() => Firestore());
  // * database from local data source
  sl.registerLazySingleton(() => DBHelper());
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
