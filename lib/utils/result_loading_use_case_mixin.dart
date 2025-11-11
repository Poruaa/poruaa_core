import 'dart:async';
import 'package:poruaa_core/utils/result.dart';

mixin ResultLoadingUseCaseMixin {
  bool _loaded = false;
  FutureOr<Result>? result;

  Future<Result<dynamic>> execute(
    FutureOr<Result<dynamic>> Function() call,
  ) async {
    var loading = this.result;
    if (loading != null) {
      await loading;
      this.result = null;
      return Result.ok(null);
    }
    if (_loaded) {
      this.result = null;
      return Result.ok(null);
    }
    var result = call();
    this.result = result;
    result = await result;
    if (result case Ok()) {
      _loaded = true;
    }
    this.result = null;
    return result;
  }
}
