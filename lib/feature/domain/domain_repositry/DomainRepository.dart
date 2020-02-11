
import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';

abstract class DomainRepository {
  // to get the query of the name
  Stream<List<NameEntities>> getAllName();

  // to get the query of the name sorah
  Stream<List<BodyEntities>> getAllSorah(String name);

  List<ReadEntities> getAllPages(String type);

// for quran page
  int getSavedPageNum(PageType type);

// for quran page
  void setPageNum(PageType type,int pageNum);
}
