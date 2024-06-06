import 'package:package_info_plus/package_info_plus.dart';

class Version {
  Version._internal();

  static final Version _singleton = Version._internal();

  PackageInfo? _packageInfo;

  factory Version() => _singleton;

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  PackageInfo? get packageInfo => _packageInfo;
}
