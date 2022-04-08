import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:mgov/models/custom_type.dart';
import 'package:mgov/models/user_model.dart';
import 'package:mgov/models/video_model.dart';

class StorageService extends GetxService {
  final box = GetStorage();

  String _login = "";
  String _password = "";
  int _requestCode = 0;
  RxList<CustomType> _docTypes = RxList(<CustomType>[]);
  RxList<VideoModel> _videos = RxList(<VideoModel>[]);
  int _user_id = 0;
  UserModel _userModel = UserModel();

  RxList<CustomType> get docTypes => _docTypes;

  set docTypes(List<CustomType> list) {
    _docTypes.clear();
    _docTypes.addAll(list);

    List forStoreItems = [];
    for (CustomType item in list) {
      forStoreItems.add(item.toMap());
    }

    _saveToDevice(docTypeKey, forStoreItems);
  }

  RxList<VideoModel> get videos => _videos;

  set videos(List<VideoModel> list) {
    _videos.addAll(list);

    List forStoreItems = [];
    for (VideoModel item in _videos) {
      forStoreItems.add(item.toMap());
    }

    _saveToDevice(videoModelKey, forStoreItems);
  }

  @override
  void onReady() {
    super.onReady();
    loadSettings();
  }

  void loadSettings() {
    _login = _loadFromDevice(loginKey) ?? "";
    _password = _loadFromDevice(passwordKey) ?? "";
    _user_id = _loadFromDevice(userIdKey) ?? 0;
    _requestCode = _loadFromDevice(requestCodeKey) ?? 0;
    _userModel = UserModel.fromJson(_loadFromDevice(userModelKey) ?? Map<String, dynamic>());

    List<CustomType> tempDocs = [];
    List items = _loadFromDevice(docTypeKey) ?? [];
    for (var item in items) {
      CustomType model = CustomType.fromJson2(item);
      tempDocs.add(model);
    }
    _docTypes.addAll(tempDocs);

    List<VideoModel> tempvideos = [];
    List itemss = _loadFromDevice(videoModelKey) ?? [];
    for (var item in itemss) {
      VideoModel model = VideoModel.fromJson2(item);
      tempvideos.add(model);
    }
    _videos.addAll(tempvideos);
  }

  String get login => _login;

  set login(String login) {
    _login = login;
    _saveToDevice(loginKey, login);
  }

  int get requestCode => _requestCode;

  set requestCode(int code) {
    _requestCode = code;
    _saveToDevice(requestCodeKey, code);
  }

  UserModel get userModel => _userModel;

  set userModel(UserModel userModel) {
    _userModel = userModel;
    _saveToDevice(userModelKey, userModel.toMap());
  }

  String get password => _password;

  set password(String password) {
    _password = password;
    _saveToDevice(passwordKey, password);
  }

  int get userId => _user_id;

  set userId(int userId) {
    _user_id = userId;
    _saveToDevice(userIdKey, userId);
  }

  void _saveToDevice(String key, dynamic value) {
    try {
      box.write(key, value);
      Logger().w("$key $value");
    } catch (e) {
      Logger().e(e);
    }
  }

  dynamic _loadFromDevice(String key) {
    try {
      return box.read(key);
    } catch (e) {
      Logger().e(e);
    }
  }

  final String loginKey = "login";
  final String passwordKey = "password";
  final String userIdKey = "user_id";
  final String docTypeKey = "doc_type_key";
  final String requestCodeKey = "request_code";
  final String userModelKey = "user_model";
  final String videoModelKey = "video_model";
}

// Future<bool> checkIsFirst() async {
//   bool? isFirst = box.read("isFirst");
//   Logger().d(isFirst);
//   if (isFirst != null && !isFirst) {
//     return false;
//   } else {
//     return true;
//   }
// }
//
// void saveCheckIsFirst() {
//   box.write("isFirst", false);
// }
