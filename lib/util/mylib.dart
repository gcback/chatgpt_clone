library mylib;

export 'dart:math';
export "package:flutter/material.dart";
export 'package:flutter_hooks/flutter_hooks.dart';

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

part 'num_extensions.dart';

void useEffectOnce(void Function() callback) => useEffect(() {
      callback();
      return null;
    }, []);

// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
