import 'package:poruaa_core/data/repositories/user/user_repository.dart';
import 'package:poruaa_core/utils/result.dart';
import 'package:rxdart/rxdart.dart';

class LoadRepositoriesUseCase {
  final UserRepository _userRepository;
  bool _isLoading = false;
  bool _isLoaded = false;
  bool get isLoading => _isLoading;

  final BehaviorSubject<LoadStatus> _behaviorSubject = BehaviorSubject.seeded(
    LoadStatus.initial,
  );

  LoadRepositoriesUseCase(UserRepository userRepository)
    : _userRepository = userRepository;
  Stream<LoadStatus> get statusStream => _behaviorSubject.stream;

  Future load() async {
    if (_isLoaded || _isLoading) return;
    _isLoading = true;
    _behaviorSubject.add(LoadStatus.loading);
    var result = await _userRepository.load();
    if (result case Err()) {
      _isLoading = false;
      _behaviorSubject.add(LoadStatus.error);
      return;
    }
    _behaviorSubject.add(LoadStatus.loaded);
    _isLoading = false;
    _isLoaded = true;
  }
}

enum LoadStatus { initial, loading, loaded, error }
