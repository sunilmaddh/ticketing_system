import 'package:get_it/get_it.dart';
import 'package:ticketing_system/utils/navigator_service.dart';
final locator = GetIt.instance;
void setupLocator() {
  locator.registerSingleton(NavigatorService());
}
