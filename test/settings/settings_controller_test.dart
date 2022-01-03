import 'package:assisstant_test/src/settings/settings_controller.dart';
import 'package:assisstant_test/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeSettingsService with SettingsService {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    _themeMode = theme;
  }
}

void main() {
  group('ServiceController.updateThemeMode should', () {
    test('inform the service of the value', () async {
      final service = FakeSettingsService();
      final controller = SettingsController(service);
      await controller.loadSettings();

      controller.updateThemeMode(ThemeMode.dark);
      expect(controller.themeMode, ThemeMode.dark);
      expect(service._themeMode, ThemeMode.dark);
    });
  });
}
