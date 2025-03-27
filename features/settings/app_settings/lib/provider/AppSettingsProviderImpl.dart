import 'package:injectable/injectable.dart';

import 'AppSettingsProvider.dart';

@Injectable(as: AppSettingsProvider, env: [Environment.prod])
class ProdAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "English";
  }

  @override
  String themeType() {
    return "dark";
  }
}

@Injectable(as: AppSettingsProvider, env: [Environment.dev])
class DevAppSettingsProviderImpl extends AppSettingsProvider {
  @override
  String getAppLanguage() {
    return "English";
  }

  @override
  String themeType() {
    return "light";
  }
}
