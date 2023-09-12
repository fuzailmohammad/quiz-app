import 'package:get/get.dart';
import 'package:quiz_app/app/data/network/network_requester.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
