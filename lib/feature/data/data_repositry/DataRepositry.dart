import 'dart:async';

import 'package:moshaf/feature/data/local_data_source/LocalDataSource.dart';
import 'package:moshaf/feature/data/local_data_source/quran_data.dart';
import 'package:moshaf/feature/data/local_data_source/azkar_data.dart';
import 'package:moshaf/feature/data/model/data_body_model.dart';
import 'package:moshaf/feature/data/model/data_model.dart';
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/data/remote_data_source/RemoteDataSource.dart';
import 'package:moshaf/feature/domain/domain_repositry/DomainRepository.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';
import 'package:flutter/material.dart';

class DataRepositry extends DomainRepository {
  RemoteDataSource remoteDataSource;
  LocalDataSource localDataSource;

  DataRepositry(
      {@required this.remoteDataSource, @required this.localDataSource});

  @override
  Stream<List<NameEntities>> getAllName() {
    Stream<List<DataModel>> remoteData = remoteDataSource.getAllName();
    return remoteData;
  }

  @override
  Stream<List<BodyEntities>> getAllSorah(String name) {
    Stream<List<DataBodyModel>> remoteData = remoteDataSource.getAllSorah(name);
    return remoteData;
  }

  @override
  List<ReadEntities> getAllPages(String type) {
    if (type == QURAN_PAGE) {
      return quranData;
    } else {
      return azkarData;
    }
  }

  @override
  int getSavedPageNum(PageType type) {
    return localDataSource.getSavedPageNum(type);
  }

  @override
  setPageNum(PageType type, int pageNum) {
    localDataSource.setPageNum(type, pageNum);
  }
}
