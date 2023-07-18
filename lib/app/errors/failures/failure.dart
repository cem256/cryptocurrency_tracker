import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// A base class for all the failures in the app
@freezed
class Failure with _$Failure {
  const factory Failure.networkFailure() = _NetworkFailure;
  const factory Failure.unknownFailure() = _UnknownFailure;
  const factory Failure.nullResponseFaiure() = _NullResponseFaiure;
}
