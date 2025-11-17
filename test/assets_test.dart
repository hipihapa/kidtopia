import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:kidtopia/kidtopia/resources.dart';

void main() {
  test('assets assets test', () {
    expect(File(Assets.bg).existsSync(), isTrue);
    expect(File(Assets.c1).existsSync(), isTrue);
    expect(File(Assets.c2).existsSync(), isTrue);
    expect(File(Assets.c3).existsSync(), isTrue);
    expect(File(Assets.c5).existsSync(), isTrue);
    expect(File(Assets.coin).existsSync(), isTrue);
    expect(File(Assets.e1).existsSync(), isTrue);
    expect(File(Assets.e2).existsSync(), isTrue);
    expect(File(Assets.e3).existsSync(), isTrue);
    expect(File(Assets.joystick).existsSync(), isTrue);
    expect(File(Assets.p1).existsSync(), isTrue);
    expect(File(Assets.p2).existsSync(), isTrue);
  });
}
