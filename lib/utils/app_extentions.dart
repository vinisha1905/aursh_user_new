import 'package:dartz/dartz.dart';

extension EitherHelpers<L, R> on Either<L, R> {
  R? toRight() {
    return toOption().toNullable();
  }
}

extension DoubleDisplay on double {
  static RegExp regex = RegExp(r"([.]*0)(?!.*\d)");

  String display() {
    return this.toString().replaceAll(regex, '');
  }
}
