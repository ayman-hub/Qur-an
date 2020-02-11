import 'package:moshaf/feature/data/model/static_const_data.dart';
import 'package:moshaf/feature/domain/domain_repositry/DomainRepository.dart';

class CaseSetAndGetPageNum {
  DomainRepository damainRepositry;

  CaseSetAndGetPageNum(this.damainRepositry);

  int getSavedPageNum(PageType type) {
    return damainRepositry.getSavedPageNum(type);
  }

  void setPageNum(PageType type,int pageNum) {
    damainRepositry.setPageNum(type,pageNum);
  }
}
