
import 'package:common/common.dart' as common;
import 'package:data/data.dart' as data;
import 'package:domain/domain.dart' as domain;

Future<void> registerServiceLocator() async {
  common.init();
  await domain.registerUseCaseDiModule();
  await data.registerDataDiModule();
}
