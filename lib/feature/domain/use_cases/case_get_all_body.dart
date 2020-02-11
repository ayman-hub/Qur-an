import 'package:moshaf/feature/domain/domain_repositry/DomainRepository.dart';
import 'package:moshaf/feature/domain/entities/body_entities.dart';

class CaseGetAllBody {
  DomainRepository damainRepositry;

  CaseGetAllBody(this.damainRepositry);

  Stream<List<BodyEntities>> getAllSorah(String name) {
    return damainRepositry.getAllSorah(name);
  }

  void dispose() {}
}
