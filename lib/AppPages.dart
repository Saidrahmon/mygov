import 'package:get/get.dart';
import 'package:mgov/pages/base/bindings/binding.dart';
import 'package:mgov/pages/base/views/view.dart';
import 'package:mgov/pages/camera/bindings/binding.dart';
import 'package:mgov/pages/camera/views/view.dart';
import 'package:mgov/pages/formA/bindings/binding.dart';
import 'package:mgov/pages/formA/views/view.dart';
import 'package:mgov/pages/formB/bindings/binding.dart';
import 'package:mgov/pages/formB/views/view.dart';
import 'package:mgov/pages/formC/bindings/binding.dart';
import 'package:mgov/pages/formC/views/view.dart';
import 'package:mgov/pages/formD/bindings/binding.dart';
import 'package:mgov/pages/formD/views/view.dart';
import 'package:mgov/pages/formE/bindings/binding.dart';
import 'package:mgov/pages/formE/views/view.dart';
import 'package:mgov/pages/home/bindings/binding.dart';
import 'package:mgov/pages/home/views/view.dart';
import 'package:mgov/pages/login/bindings/binding.dart';
import 'package:mgov/pages/login/views/view.dart';
import 'package:mgov/pages/profile/bindings/binding.dart';
import 'package:mgov/pages/profile/views/view.dart';
import 'package:mgov/pages/registration/bindings/RegBinding.dart';
import 'package:mgov/pages/registration/views/view.dart';
import 'package:mgov/pages/request/bindings/binding.dart';
import 'package:mgov/pages/request/views/view.dart';
import 'package:mgov/pages/usage/bindings/binding.dart';
import 'package:mgov/pages/usage/views/UsagePage.dart';
import 'package:mgov/pages/welcome/binding/binding.dart';
import 'package:mgov/pages/welcome/views/view.dart';
import 'AppRoutes.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.BASE,
      page: () => BasePage(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.FORMA,
      page: () => FormAView(),
      binding: FormABinding(),
    ),
    GetPage(
      name: AppRoutes.FORMB,
      page: () => FormBView(),
      binding: FormBBinding(),
    ),
    GetPage(
      name: AppRoutes.FORMC,
      page: () => FormCView(),
      binding: FormCBinding(),
    ),
    GetPage(
      name: AppRoutes.FORMD,
      page: () => FormDView(),
      binding: FormDBinding(),
    ),
    GetPage(
      name: AppRoutes.FORME,
      page: () => FormEView(),
      binding: FormEBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.REGISTRATION,
      page: () => RegView(),
      binding: RegBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CAMERA,
      page: () => CameraPage(),
      binding: CameraBinding(),
    ),
    GetPage(
      name: AppRoutes.REQUEST,
      page: () => RequestPage(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.USAGE,
      page: () => UsagePage(),
      binding: UsageBinding(),
    ),
  ];
}
