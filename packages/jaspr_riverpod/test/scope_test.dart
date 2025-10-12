@TestOn('vm')
library;

import 'package:jaspr/server.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:jaspr_test/jaspr_test.dart';

void main() {
  group('ProviderScope', () {
    testComponents('can be shared between multiple trees', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      for (var i = 1; i <= 2; i++) {
        // Without a root container, each scope creates its own providers.
        tester.pumpComponent(ProviderScope(child: _IncrementAndGet()));
        expect(find.text('1'), findsOneComponent);

        // With a fixed root scope, state is shared between independently-mounted components.
        tester.pumpComponent(ProviderScope(customRoot: container, child: _IncrementAndGet()));
        expect(find.text('$i'), findsOneComponent);
      }
    });
  });
}

final class _SharedState extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
}

final _provider = NotifierProvider(_SharedState.new);

final class _IncrementAndGet extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => _GetAndIncrementState();
}

final class _GetAndIncrementState extends State<_IncrementAndGet> {
  @override
  void initState() {
    super.initState();
    context.read(_provider.notifier).increment();
  }

  @override
  Component build(BuildContext context) {
    return text(context.read(_provider).toString());
  }
}
