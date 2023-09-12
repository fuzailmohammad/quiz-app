import 'package:quiz_app/app/data/models/response/app_config_response.dart';
import 'package:quiz_app/app/data/values/urls.dart';
import 'package:quiz_app/base/base_repository.dart';
import 'package:quiz_app/utils/helper/exception_handler.dart';
import 'package:quiz_app/utils/storage/storage_utils.dart';

class ConfigRepository extends BaseRepository {
  saveAppConfig() async {
    final response = await controller.get(path: URLs.appConfig);
    if (response is! APIException) {
      Storage.setAppConfig(AppConfigResponse.fromJson(response).data);
    }
  }
}
