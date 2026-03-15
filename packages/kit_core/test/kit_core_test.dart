import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Example class to test
typedef Callback = void Function();

class ExampleService {
  final Callback callback;
  ExampleService(this.callback);
  void doSomething() {
    callback();
  }
}

class MockCallback extends Mock {
  void call();
}

void main() {
  group('ExampleService', () {
    test('calls callback when doSomething is called', () {
      final mockCallback = MockCallback();
      final service = ExampleService(mockCallback.call);

      service.doSomething();

      verify(mockCallback.call()).called(1);
    });
  });
}
