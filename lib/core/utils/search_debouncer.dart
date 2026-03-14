import 'dart:async';

// --------------debouncer class----------------
// ------------debouncer is used to  only finish search if the user stopped typing for 300 milliseconds-------------
// ------------ it cancels the search if the user started typing again---------------
// ------------ this helps with safe guarding the requests ---------------------

class SearchDebouncer {
  SearchDebouncer({this.duration = const Duration(milliseconds: 300)});

  final Duration duration;
  Timer? _timer;

  Future<void> run(final Future<void> Function() action) async {
    _timer?.cancel();
    final Completer<void> completer = Completer<void>();
    _timer = Timer(duration, () {
      completer.complete();
    });
    await completer.future;
    await action();
  }

  void cancel() => _timer?.cancel();
}
