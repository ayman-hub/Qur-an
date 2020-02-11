import 'package:moshaf/feature/domain/domain_repositry/DomainRepository.dart';
import 'package:moshaf/feature/domain/entities/Entities.dart';

class CaseGetAllName {
  DomainRepository damainRepositry;

  CaseGetAllName(this.damainRepositry);

  Stream<List<NameEntities>> getAllName() {
    return damainRepositry.getAllName();
  }

  void dispose() {}
}
