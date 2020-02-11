import 'package:moshaf/feature/domain/domain_repositry/DomainRepository.dart';
import 'package:moshaf/feature/domain/entities/read_entities.dart';

class CaseGetAllPage {
  DomainRepository domainRepository;

  CaseGetAllPage(this.domainRepository);

  List<ReadEntities> getPages(String type) {
    return domainRepository.getAllPages(type);
  }
}
