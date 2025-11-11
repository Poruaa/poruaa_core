import 'package:flutter/services.dart';
// import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:poruaa_core/utils/sound_effect.dart';

/// Provides haptic feedback for better user interaction
class Haptic {
  static String hapticType = 'none';

  /// Light haptic feedback - for subtle interactions like button taps
  static void light() {
    if (hapticType == 'none') {
      return;
    }
    if (hapticType == 'sound') {
      // FlutterPlatformAlert.playAlertSound();
      SoundEffect.playClickSound();
    }
    if (hapticType == 'haptic') {
      HapticFeedback.lightImpact();
    }
  }

  /// Medium haptic feedback - for more noticeable interactions
  static void medium() {
    HapticFeedback.mediumImpact();
  }

  /// Heavy haptic feedback - for important actions like retake exam
  static void heavy() {
    HapticFeedback.heavyImpact();
  }

  /// Selection haptic feedback - for selection changes
  static void selection() {
    HapticFeedback.selectionClick();
  }

  /// Success haptic feedback - for successful actions
  static void success() {
    HapticFeedback.lightImpact();
  }

  /// Error haptic feedback - for error states
  static void error() {
    HapticFeedback.heavyImpact();
  }
}
