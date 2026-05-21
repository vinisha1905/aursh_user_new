// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(RemoteMessage remoteMessage) newNotification,
    required TResult Function(NotificationModel notification) setIsRead,
    required TResult Function() fetchNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(RemoteMessage remoteMessage)? newNotification,
    TResult? Function(NotificationModel notification)? setIsRead,
    TResult? Function()? fetchNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(RemoteMessage remoteMessage)? newNotification,
    TResult Function(NotificationModel notification)? setIsRead,
    TResult Function()? fetchNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NewNotification value) newNotification,
    required TResult Function(_SetIsRead value) setIsRead,
    required TResult Function(_FetchNotifications value) fetchNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NewNotification value)? newNotification,
    TResult? Function(_SetIsRead value)? setIsRead,
    TResult? Function(_FetchNotifications value)? fetchNotifications,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NewNotification value)? newNotification,
    TResult Function(_SetIsRead value)? setIsRead,
    TResult Function(_FetchNotifications value)? fetchNotifications,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationEventCopyWith<$Res> {
  factory $NotificationEventCopyWith(
          NotificationEvent value, $Res Function(NotificationEvent) then) =
      _$NotificationEventCopyWithImpl<$Res, NotificationEvent>;
}

/// @nodoc
class _$NotificationEventCopyWithImpl<$Res, $Val extends NotificationEvent>
    implements $NotificationEventCopyWith<$Res> {
  _$NotificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'NotificationEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(RemoteMessage remoteMessage) newNotification,
    required TResult Function(NotificationModel notification) setIsRead,
    required TResult Function() fetchNotifications,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(RemoteMessage remoteMessage)? newNotification,
    TResult? Function(NotificationModel notification)? setIsRead,
    TResult? Function()? fetchNotifications,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(RemoteMessage remoteMessage)? newNotification,
    TResult Function(NotificationModel notification)? setIsRead,
    TResult Function()? fetchNotifications,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NewNotification value) newNotification,
    required TResult Function(_SetIsRead value) setIsRead,
    required TResult Function(_FetchNotifications value) fetchNotifications,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NewNotification value)? newNotification,
    TResult? Function(_SetIsRead value)? setIsRead,
    TResult? Function(_FetchNotifications value)? fetchNotifications,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NewNotification value)? newNotification,
    TResult Function(_SetIsRead value)? setIsRead,
    TResult Function(_FetchNotifications value)? fetchNotifications,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements NotificationEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$NewNotificationImplCopyWith<$Res> {
  factory _$$NewNotificationImplCopyWith(_$NewNotificationImpl value,
          $Res Function(_$NewNotificationImpl) then) =
      __$$NewNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RemoteMessage remoteMessage});
}

/// @nodoc
class __$$NewNotificationImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$NewNotificationImpl>
    implements _$$NewNotificationImplCopyWith<$Res> {
  __$$NewNotificationImplCopyWithImpl(
      _$NewNotificationImpl _value, $Res Function(_$NewNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remoteMessage = null,
  }) {
    return _then(_$NewNotificationImpl(
      null == remoteMessage
          ? _value.remoteMessage
          : remoteMessage // ignore: cast_nullable_to_non_nullable
              as RemoteMessage,
    ));
  }
}

/// @nodoc

class _$NewNotificationImpl implements _NewNotification {
  const _$NewNotificationImpl(this.remoteMessage);

  @override
  final RemoteMessage remoteMessage;

  @override
  String toString() {
    return 'NotificationEvent.newNotification(remoteMessage: $remoteMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewNotificationImpl &&
            (identical(other.remoteMessage, remoteMessage) ||
                other.remoteMessage == remoteMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, remoteMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewNotificationImplCopyWith<_$NewNotificationImpl> get copyWith =>
      __$$NewNotificationImplCopyWithImpl<_$NewNotificationImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(RemoteMessage remoteMessage) newNotification,
    required TResult Function(NotificationModel notification) setIsRead,
    required TResult Function() fetchNotifications,
  }) {
    return newNotification(remoteMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(RemoteMessage remoteMessage)? newNotification,
    TResult? Function(NotificationModel notification)? setIsRead,
    TResult? Function()? fetchNotifications,
  }) {
    return newNotification?.call(remoteMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(RemoteMessage remoteMessage)? newNotification,
    TResult Function(NotificationModel notification)? setIsRead,
    TResult Function()? fetchNotifications,
    required TResult orElse(),
  }) {
    if (newNotification != null) {
      return newNotification(remoteMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NewNotification value) newNotification,
    required TResult Function(_SetIsRead value) setIsRead,
    required TResult Function(_FetchNotifications value) fetchNotifications,
  }) {
    return newNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NewNotification value)? newNotification,
    TResult? Function(_SetIsRead value)? setIsRead,
    TResult? Function(_FetchNotifications value)? fetchNotifications,
  }) {
    return newNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NewNotification value)? newNotification,
    TResult Function(_SetIsRead value)? setIsRead,
    TResult Function(_FetchNotifications value)? fetchNotifications,
    required TResult orElse(),
  }) {
    if (newNotification != null) {
      return newNotification(this);
    }
    return orElse();
  }
}

abstract class _NewNotification implements NotificationEvent {
  const factory _NewNotification(final RemoteMessage remoteMessage) =
      _$NewNotificationImpl;

  RemoteMessage get remoteMessage;
  @JsonKey(ignore: true)
  _$$NewNotificationImplCopyWith<_$NewNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetIsReadImplCopyWith<$Res> {
  factory _$$SetIsReadImplCopyWith(
          _$SetIsReadImpl value, $Res Function(_$SetIsReadImpl) then) =
      __$$SetIsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NotificationModel notification});
}

/// @nodoc
class __$$SetIsReadImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$SetIsReadImpl>
    implements _$$SetIsReadImplCopyWith<$Res> {
  __$$SetIsReadImplCopyWithImpl(
      _$SetIsReadImpl _value, $Res Function(_$SetIsReadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notification = null,
  }) {
    return _then(_$SetIsReadImpl(
      null == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as NotificationModel,
    ));
  }
}

/// @nodoc

class _$SetIsReadImpl implements _SetIsRead {
  const _$SetIsReadImpl(this.notification);

  @override
  final NotificationModel notification;

  @override
  String toString() {
    return 'NotificationEvent.setIsRead(notification: $notification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetIsReadImpl &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetIsReadImplCopyWith<_$SetIsReadImpl> get copyWith =>
      __$$SetIsReadImplCopyWithImpl<_$SetIsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(RemoteMessage remoteMessage) newNotification,
    required TResult Function(NotificationModel notification) setIsRead,
    required TResult Function() fetchNotifications,
  }) {
    return setIsRead(notification);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(RemoteMessage remoteMessage)? newNotification,
    TResult? Function(NotificationModel notification)? setIsRead,
    TResult? Function()? fetchNotifications,
  }) {
    return setIsRead?.call(notification);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(RemoteMessage remoteMessage)? newNotification,
    TResult Function(NotificationModel notification)? setIsRead,
    TResult Function()? fetchNotifications,
    required TResult orElse(),
  }) {
    if (setIsRead != null) {
      return setIsRead(notification);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NewNotification value) newNotification,
    required TResult Function(_SetIsRead value) setIsRead,
    required TResult Function(_FetchNotifications value) fetchNotifications,
  }) {
    return setIsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NewNotification value)? newNotification,
    TResult? Function(_SetIsRead value)? setIsRead,
    TResult? Function(_FetchNotifications value)? fetchNotifications,
  }) {
    return setIsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NewNotification value)? newNotification,
    TResult Function(_SetIsRead value)? setIsRead,
    TResult Function(_FetchNotifications value)? fetchNotifications,
    required TResult orElse(),
  }) {
    if (setIsRead != null) {
      return setIsRead(this);
    }
    return orElse();
  }
}

abstract class _SetIsRead implements NotificationEvent {
  const factory _SetIsRead(final NotificationModel notification) =
      _$SetIsReadImpl;

  NotificationModel get notification;
  @JsonKey(ignore: true)
  _$$SetIsReadImplCopyWith<_$SetIsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchNotificationsImplCopyWith<$Res> {
  factory _$$FetchNotificationsImplCopyWith(_$FetchNotificationsImpl value,
          $Res Function(_$FetchNotificationsImpl) then) =
      __$$FetchNotificationsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchNotificationsImplCopyWithImpl<$Res>
    extends _$NotificationEventCopyWithImpl<$Res, _$FetchNotificationsImpl>
    implements _$$FetchNotificationsImplCopyWith<$Res> {
  __$$FetchNotificationsImplCopyWithImpl(_$FetchNotificationsImpl _value,
      $Res Function(_$FetchNotificationsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchNotificationsImpl implements _FetchNotifications {
  const _$FetchNotificationsImpl();

  @override
  String toString() {
    return 'NotificationEvent.fetchNotifications()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchNotificationsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(RemoteMessage remoteMessage) newNotification,
    required TResult Function(NotificationModel notification) setIsRead,
    required TResult Function() fetchNotifications,
  }) {
    return fetchNotifications();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(RemoteMessage remoteMessage)? newNotification,
    TResult? Function(NotificationModel notification)? setIsRead,
    TResult? Function()? fetchNotifications,
  }) {
    return fetchNotifications?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(RemoteMessage remoteMessage)? newNotification,
    TResult Function(NotificationModel notification)? setIsRead,
    TResult Function()? fetchNotifications,
    required TResult orElse(),
  }) {
    if (fetchNotifications != null) {
      return fetchNotifications();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NewNotification value) newNotification,
    required TResult Function(_SetIsRead value) setIsRead,
    required TResult Function(_FetchNotifications value) fetchNotifications,
  }) {
    return fetchNotifications(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NewNotification value)? newNotification,
    TResult? Function(_SetIsRead value)? setIsRead,
    TResult? Function(_FetchNotifications value)? fetchNotifications,
  }) {
    return fetchNotifications?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NewNotification value)? newNotification,
    TResult Function(_SetIsRead value)? setIsRead,
    TResult Function(_FetchNotifications value)? fetchNotifications,
    required TResult orElse(),
  }) {
    if (fetchNotifications != null) {
      return fetchNotifications(this);
    }
    return orElse();
  }
}

abstract class _FetchNotifications implements NotificationEvent {
  const factory _FetchNotifications() = _$FetchNotificationsImpl;
}

/// @nodoc
mixin _$NotificationState {
  LoadingState get loadingState => throw _privateConstructorUsedError;
  List<NotificationModel> get notifications =>
      throw _privateConstructorUsedError;
  String? get fcmToken => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationStateCopyWith<NotificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationStateCopyWith<$Res> {
  factory $NotificationStateCopyWith(
          NotificationState value, $Res Function(NotificationState) then) =
      _$NotificationStateCopyWithImpl<$Res, NotificationState>;
  @useResult
  $Res call(
      {LoadingState loadingState,
      List<NotificationModel> notifications,
      String? fcmToken});
}

/// @nodoc
class _$NotificationStateCopyWithImpl<$Res, $Val extends NotificationState>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? notifications = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_value.copyWith(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationStateImplCopyWith<$Res>
    implements $NotificationStateCopyWith<$Res> {
  factory _$$NotificationStateImplCopyWith(_$NotificationStateImpl value,
          $Res Function(_$NotificationStateImpl) then) =
      __$$NotificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoadingState loadingState,
      List<NotificationModel> notifications,
      String? fcmToken});
}

/// @nodoc
class __$$NotificationStateImplCopyWithImpl<$Res>
    extends _$NotificationStateCopyWithImpl<$Res, _$NotificationStateImpl>
    implements _$$NotificationStateImplCopyWith<$Res> {
  __$$NotificationStateImplCopyWithImpl(_$NotificationStateImpl _value,
      $Res Function(_$NotificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? notifications = null,
    Object? fcmToken = freezed,
  }) {
    return _then(_$NotificationStateImpl(
      loadingState: null == loadingState
          ? _value.loadingState
          : loadingState // ignore: cast_nullable_to_non_nullable
              as LoadingState,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationModel>,
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotificationStateImpl implements _NotificationState {
  const _$NotificationStateImpl(
      {required this.loadingState,
      required final List<NotificationModel> notifications,
      required this.fcmToken})
      : _notifications = notifications;

  @override
  final LoadingState loadingState;
  final List<NotificationModel> _notifications;
  @override
  List<NotificationModel> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final String? fcmToken;

  @override
  String toString() {
    return 'NotificationState(loadingState: $loadingState, notifications: $notifications, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingState,
      const DeepCollectionEquality().hash(_notifications), fcmToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      __$$NotificationStateImplCopyWithImpl<_$NotificationStateImpl>(
          this, _$identity);
}

abstract class _NotificationState implements NotificationState {
  const factory _NotificationState(
      {required final LoadingState loadingState,
      required final List<NotificationModel> notifications,
      required final String? fcmToken}) = _$NotificationStateImpl;

  @override
  LoadingState get loadingState;
  @override
  List<NotificationModel> get notifications;
  @override
  String? get fcmToken;
  @override
  @JsonKey(ignore: true)
  _$$NotificationStateImplCopyWith<_$NotificationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
