import 'package:quiz_app/app/data/repository/config_repository.dart';
import 'package:quiz_app/base/base_controller.dart';

class AppController extends BaseController<ConfigRepository> {
  @override
  void onInit() {
    super.onInit();
    repository.saveAppConfig();
  }
}
