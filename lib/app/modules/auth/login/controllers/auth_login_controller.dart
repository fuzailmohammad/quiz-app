import 'package:get/get.dart';
import 'package:quiz_app/app/data/models/dto/response.dart';
import 'package:quiz_app/app/data/models/request/auth_request.dart';
import 'package:quiz_app/app/data/repository/user_repository.dart';
import 'package:quiz_app/app/data/values/strings.dart';
import 'package:quiz_app/app/routes/app_pages.dart';
import 'package:quiz_app/base/base_controller.dart';
import 'package:quiz_app/utils/helper/text_field_wrapper.dart';
import 'package:quiz_app/utils/helper/validators.dart';
import 'package:quiz_app/utils/loading/loading_utils.dart';

class AuthLoginController extends BaseController<UserRepository> {
  final mobileWrapper = TextFieldWrapper();

  sendOTP() async {
    String mobile = mobileWrapper.controller.text.trim();
    if (mobile.isValidPhone()) {
      mobileWrapper.errorText = Strings.empty;
    } else {
      mobileWrapper.errorText = ErrorMessages.invalidPhone;
      return;
    }

    LoadingUtils.showLoader();
    RepoResponse<bool> response =
        await repository.sendOTP(SendOTPRequest(phone: mobile));
    LoadingUtils.hideLoader();

    if (response.data ?? false) {
      Get.toNamed(Routes.AUTH_VERIFY_OTP, arguments: mobile);
    } else {
      mobileWrapper.errorText = response.error?.message ?? "";
    }
  }
}
