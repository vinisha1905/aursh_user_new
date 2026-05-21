import 'package:alice/alice.dart';
import 'package:alice/model/alice_configuration.dart';
import 'package:ayursh/application/about_us/about_us_bloc.dart';
import 'package:ayursh/application/address/address_bloc.dart';
import 'package:ayursh/application/auth_bloc/auth_bloc.dart';
import 'package:ayursh/application/book_appointment/book_appointment_bloc.dart';
import 'package:ayursh/application/book_therapy_time/book_therapy_time_bloc.dart';
import 'package:ayursh/application/booking_user_consultation/booking_user_consultation_bloc.dart';
import 'package:ayursh/application/booking_user_therapy/booking_user_therapy_bloc.dart';
import 'package:ayursh/application/category_detail/category_detail_bloc.dart';
import 'package:ayursh/application/chat/chat_bloc.dart';
import 'package:ayursh/application/consultation_booking_detail/consultation_booking_detail_bloc.dart';
import 'package:ayursh/application/consultation_checkout/consultation_checkout_bloc.dart';
import 'package:ayursh/application/doctor/doctor_bloc.dart';
import 'package:ayursh/application/doctor_detail/doctor_detail_bloc.dart';
import 'package:ayursh/application/home/home_bloc.dart';
import 'package:ayursh/application/login/login_bloc.dart';
import 'package:ayursh/application/main/main_bloc.dart';
import 'package:ayursh/application/my_bookings/my_bookings_bloc.dart';
import 'package:ayursh/application/notification/notification_bloc.dart';
import 'package:ayursh/application/otp_validation/otp_validation_bloc.dart';
import 'package:ayursh/application/payment_history/payment_history_bloc.dart';
import 'package:ayursh/application/profile/profile_bloc.dart';
import 'package:ayursh/application/quiz/quiz_bloc.dart';
import 'package:ayursh/application/rate_us/rate_us_bloc.dart';
import 'package:ayursh/application/search_doctor/search_doctor_bloc.dart';
import 'package:ayursh/application/search_therapy/search_therapy_bloc.dart';
import 'package:ayursh/application/sign_up/index.dart';
import 'package:ayursh/application/tems_and_conditions/terms_and_conditions_bloc.dart';
import 'package:ayursh/application/therapy_checkout/therapy_checkout_bloc.dart';
import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/api_client/consultation_api_client.dart';
import 'package:ayursh/domain/api_client/onboarding_api_client.dart';
import 'package:ayursh/domain/api_client/payment_api_client.dart';
import 'package:ayursh/domain/api_client/therapy_api_client.dart';
import 'package:ayursh/domain/repository/consultation_repository.dart';
import 'package:ayursh/domain/repository/consultation_repository_impl.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/repository/onboarding_repository_impl.dart';
import 'package:ayursh/domain/repository/payment_repository.dart';
import 'package:ayursh/domain/repository/payment_repository_impl.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:ayursh/domain/repository/therapy_repo_impl.dart';
import 'package:ayursh/domain/util/db_helper.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:ayursh/presentation/about_us/about_us_screen.dart';
import 'package:ayursh/presentation/about_us_detail/about_us_detail_screen.dart';
import 'package:ayursh/presentation/audio_call/audio_call_screen.dart';
import 'package:ayursh/presentation/book_appointment/book_appointment_screen.dart';
import 'package:ayursh/presentation/book_therapy_time/book_therapy_time_screen.dart';
import 'package:ayursh/presentation/booked_therapy_detail/booked_therapy_detail_screen.dart';
import 'package:ayursh/presentation/booking_user_consultation/booking_user_consultation_screen.dart';
import 'package:ayursh/presentation/booking_user_therapy/booking_user_therapy_screen.dart';
import 'package:ayursh/presentation/cancel_consultation_success/cancel_consultation_success_screen.dart';
import 'package:ayursh/presentation/category_detail/category_detail_screen.dart';
import 'package:ayursh/presentation/chat/chat_screen.dart';
import 'package:ayursh/presentation/chat/video_player_screen.dart';
import 'package:ayursh/presentation/consultation_booking_detail/consultation_booking_detail_screen.dart';
import 'package:ayursh/presentation/consultation_checkout/consultation_checkout_screen.dart';
import 'package:ayursh/presentation/doctor_detail/doctor_detail_screen.dart';
import 'package:ayursh/presentation/doctor_list/doctor_list_screen.dart';
import 'package:ayursh/presentation/frequently_added/frequently_added_screen.dart';
import 'package:ayursh/presentation/login/login_screen.dart';
import 'package:ayursh/presentation/main/main_screen.dart';
import 'package:ayursh/presentation/maintenance/maintenance_screen.dart';
import 'package:ayursh/presentation/medicines/view_model/search_product_vm.dart';
import 'package:ayursh/presentation/notification/notification_screen.dart';
import 'package:ayursh/presentation/onboarding/onboarding_screen.dart';
import 'package:ayursh/presentation/otp_validation/otp_validation_screen.dart';
import 'package:ayursh/presentation/page_my_bookings/medicine_booking_list/view_model/medicine_booking_vm.dart';
import 'package:ayursh/presentation/payment_history/payment_history_screen.dart';
import 'package:ayursh/presentation/payment_success/payment_success_screen.dart';
import 'package:ayursh/presentation/pdf_view/pdf_view_screen.dart';
import 'package:ayursh/presentation/photo_view/photo_view_screen.dart';
import 'package:ayursh/presentation/quiz/quiz_screen.dart';
import 'package:ayursh/presentation/quiz_result/quiz_result_screen.dart';
import 'package:ayursh/presentation/rate_us/rate_us_screen.dart';
import 'package:ayursh/presentation/rate_us_success/rate_us_success_screen.dart';
import 'package:ayursh/presentation/refer_and_earn/refer_and_earn.dart';
import 'package:ayursh/presentation/search_doctor/search_doctor_screen.dart';
import 'package:ayursh/presentation/search_therapy/search_therapy_screen.dart';
import 'package:ayursh/presentation/sign_up/sign_up_screen.dart';
import 'package:ayursh/presentation/support/support_screen.dart';
import 'package:ayursh/presentation/term_and_policy/privacy_and_policy_screen.dart';
import 'package:ayursh/presentation/term_and_policy/term_and_service_screen.dart';
import 'package:ayursh/presentation/terms_and_conditions/terms_and_conditions_screen.dart';
import 'package:ayursh/presentation/therapy_checkout/therapy_checkout_screen.dart';
import 'package:ayursh/presentation/therapy_detail/therapy_detail_screen.dart';
import 'package:ayursh/presentation/trending_blog_detail/trending_blog_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/video_call/video_call_screen.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
// import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'application/booked_therapy_detail/booked_therapy_detail_bloc.dart';
import 'application/support/support_bloc.dart';
import 'domain/model/response/notification_model.dart';
import 'presentation/medicines/view_model/cart_vm.dart';
import 'presentation/medicines/view_model/medicines_vm.dart';

var getIt = GetIt.instance;
// final facebookAppEvents = FacebookAppEvents();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  initializeDateFormatting('en_IN');
  FirebaseRemoteConfig.instance.ensureInitialized();
  registerOtherStuff();
  registerApiClients();
  registerRepositories();
  registerBlocs();
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // status bar color
  // ));

  runApp(MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  var dbHelper = DbHelper();
  await dbHelper.open();
  var data = message.data;
  var title = data['title'] ?? '';
  var body = data['body'] ?? '';
  var timestamp = data['timestamp'] ?? DateTime.now().toString();
  var bookingId = data['booking_id'] ?? '';
  var notification = NotificationModel(0, title, body, timestamp, bookingId);
  await dbHelper.insert(notification);
}

void registerOtherStuff() {
  Alice alice =
      Alice(configuration: AliceConfiguration(showNotification: true));
  GetIt.I.registerLazySingleton<Alice>(() => alice);

  Dio dio = Dio();
  dio.interceptors.add(new InterceptorsWrapper(onResponse: (response, handler) {
    return handler.next(response);
  }, onRequest: (options, request) async {
    String token =
        "Bearer " + await getIt.get<PreferenceUtil>().getAccessToken();
    options.headers["Authorization"] = token;
    print("Auth token - ${token}");
    request.next(options);
  }));
  // dio.interceptors.add(alice.getDioInterceptor());
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerSingletonAsync<PreferenceUtil>(() async {
    final preferenceUtil = PreferenceUtil();
    await preferenceUtil.init();
    return preferenceUtil;
  });

  getIt.registerSingletonAsync<DbHelper>(() async {
    final dbHelper = DbHelper();
    await dbHelper.open();
    return dbHelper;
  });

  getIt.registerSingletonAsync<FirebaseApp>(() async {
    var firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  });
}

void registerApiClients() {
  getIt.registerLazySingleton<OnboardingApiClient>(
      () => OnboardingApiClient(getIt.get<Dio>()));

  getIt.registerLazySingleton<TherapyApiClient>(
      () => TherapyApiClient(getIt.get<Dio>()));

  getIt.registerLazySingleton<ConsultationApiClient>(
      () => ConsultationApiClient(getIt.get<Dio>()));

  getIt.registerLazySingleton<PaymentApiClient>(
      () => PaymentApiClient(getIt.get<Dio>()));
}

void registerRepositories() {
  getIt.registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl(getIt.get<OnboardingApiClient>()));

  getIt.registerLazySingleton<TherapyRepository>(
      () => TherapyRepositoryImpl(getIt.get<TherapyApiClient>()));

  getIt.registerLazySingleton<ConsultationRepository>(
      () => ConsultationRepositoryImpl(getIt.get<ConsultationApiClient>()));

  getIt.registerLazySingleton<PaymentRepository>(
      () => PaymentRepositoryImpl(getIt.get<PaymentApiClient>()));
}

void registerBlocs() {
  getIt.registerFactory<LoginBloc>(
      () => LoginBloc(onboardingRepo: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<SignUpBloc>(
      () => SignUpBloc(onboardingRepo: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<OtpValidationBloc>(() => OtpValidationBloc(
      onboardingRepo: getIt.get<OnboardingRepository>(),
      preferenceUtil: getIt.get<PreferenceUtil>()));
  getIt.registerLazySingleton<MainBloc>(() => MainBloc());
  getIt.registerFactory<HomeBloc>(() => HomeBloc(
      therapyRepository: getIt.get<TherapyRepository>(),
      onboardingRepository: getIt.get<OnboardingRepository>(),
      preferenceUtil: getIt.get<PreferenceUtil>()));
  getIt.registerFactory<SearchTherapyBloc>(() =>
      SearchTherapyBloc(therapyRepository: getIt.get<TherapyRepository>()));
  getIt.registerFactory<DoctorBloc>(() =>
      DoctorBloc(consultationRepository: getIt.get<ConsultationRepository>()));
  getIt.registerLazySingleton<MyBookingsBloc>(
      () => MyBookingsBloc(onboardingRepo: getIt.get<OnboardingRepository>()));
  getIt.registerLazySingleton<AuthBloc>(
      () => AuthBloc(preferenceUtil: getIt.get<PreferenceUtil>()));
  getIt.registerFactory<ProfileBloc>(
      () => ProfileBloc(onboardingRepo: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<SearchDoctorBloc>(() => SearchDoctorBloc(
      consultationRepository: getIt.get<ConsultationRepository>()));
  getIt.registerFactory<DoctorDetailBloc>(() => DoctorDetailBloc(
      consultationRepository: getIt.get<ConsultationRepository>()));
  getIt.registerFactory<BookAppointmentBloc>(() => BookAppointmentBloc(
      consultationRepository: getIt.get<ConsultationRepository>(),
      onboardingRepository: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<BookingUserConsultationBloc>(() =>
      BookingUserConsultationBloc(
          onboardingRepository: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<ConsultationCheckoutBloc>(() =>
      ConsultationCheckoutBloc(
          paymentRepository: getIt.get<PaymentRepository>(),
          onboardingRepository: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<CategoryDetailBloc>(() => CategoryDetailBloc(
      therapyRepository: getIt.get<TherapyRepository>(),
      preferenceUtil: getIt.get<PreferenceUtil>()));
  getIt.registerFactory<TherapyDetailBloc>(() => TherapyDetailBloc(
      therapyRepository: getIt.get<TherapyRepository>(),
      preferenceUtil: getIt.get<PreferenceUtil>()));
  getIt.registerFactory<BookedTherapyDetailBloc>(() => BookedTherapyDetailBloc(
      onboardingRepository: getIt.get<OnboardingRepository>(),
      prefs: getIt.get<PreferenceUtil>()));
  getIt.registerFactory<BookingUserTherapyBloc>(() => BookingUserTherapyBloc(
      onboardingRepository: getIt.get<OnboardingRepository>()));
  getIt.registerFactory<TermsAndConditionsBloc>(() => TermsAndConditionsBloc(
      therapyRepository: getIt.get<TherapyRepository>()));
  getIt.registerFactory<BookTherapyTimeBloc>(() => BookTherapyTimeBloc(
      therapyRepository: getIt.get<TherapyRepository>(),
      onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<TherapyCheckoutBloc>(() => TherapyCheckoutBloc(
      paymentRepository: getIt.get<PaymentRepository>(),
      onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<ConsultationBookingDetailBloc>(() =>
      ConsultationBookingDetailBloc(
          preferenceUtil: getIt.get<PreferenceUtil>(),
          consultationRepository: getIt.get<ConsultationRepository>(),
          onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<PaymentHistoryBloc>(() => PaymentHistoryBloc(
      onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<AboutUsBloc>(() =>
      AboutUsBloc(onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<SupportBloc>(() =>
      SupportBloc(onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<QuizBloc>(
      () => QuizBloc(onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerLazySingleton<AddressBloc>(() => AddressBloc());

  getIt.registerFactory<ChatBloc>(() => ChatBloc(
      firebaseApp: getIt.get<FirebaseApp>(),
      onboardingRepository: getIt.get<OnboardingRepository>(),
      preferenceUtil: getIt.get<PreferenceUtil>()));

  getIt.registerLazySingleton<NotificationBloc>(() => NotificationBloc(
      dbHelper: getIt.get<DbHelper>(),
      preferenceUtil: getIt.get<PreferenceUtil>(),
      onboardingRepository: getIt.get<OnboardingRepository>()));

  getIt.registerFactory<RateUsBloc>(() =>
      RateUsBloc(onboardingRepository: getIt.get<OnboardingRepository>()));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  // @override
  // Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
  //   switch (state) {
  //     case AppLifecycleState.resumed:
  //
  //       print("app in resumed");
  //       break;
  //     case AppLifecycleState.inactive:
  //       print("app in inactive");
  //       break;
  //     case AppLifecycleState.paused:
  //       print("app in paused");
  //       break;
  //     case AppLifecycleState.detached:
  //       print("app in detached");
  //       break;
  //   }
  // }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MedicinesVM>(create: (context) => MedicinesVM()),
        ChangeNotifierProvider<MedicineBookingVM>(
            create: (context) => MedicineBookingVM()),
        ChangeNotifierProvider<CartVM>(create: (context) => CartVM()),
        ChangeNotifierProvider<SearchProductVM>(
            create: (context) => SearchProductVM()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GetIt.I.get<TermsAndConditionsBloc>()),
          BlocProvider(create: (context) => GetIt.I.get<ProfileBloc>()),
        ],
        child: FutureBuilder(
          future: Init._().init(context),
          builder: (ctx, snapshot) {
            if (snapshot.hasData && snapshot.data.toString().isNotEmpty) {
              return MaterialApp(
                navigatorKey: getIt.get<Alice>().getNavigatorKey(),
                debugShowCheckedModeBanner: false,
                supportedLocales: [
                  Locale("en"),
                ],
                localizationsDelegates: [
                  CountryLocalizations.delegate,
                ],
                title: 'Ayursh',
                theme: ThemeData(
                  useMaterial3: false,
                  appBarTheme: AppBarTheme(
                      backgroundColor: Colors.white,
                      titleTextStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500)),
                  primaryColor: Colors.white,
                  unselectedWidgetColor: Colors.white,
                  fontFamily: 'Roboto',
                  buttonTheme: ButtonThemeData(
                      buttonColor: AppColors.darkYellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                ),
                initialRoute: snapshot.data.toString(),
                routes: {
                  LoginScreen.routName: (ctx) => LoginScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments
                              as LoginArguments?)
                      .wrappedRoute(ctx),
                  SignUpScreen.routName: (ctx) =>
                      SignUpScreen().wrappedRoute(ctx),
                  OtpValidationScreen.routName: (ctx) => OtpValidationScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as OtpValidationArguments)
                      .wrappedRoute(ctx),
                  MainScreen.routName: (ctx) => MainScreen().wrappedRoute(ctx),
                  TermAndServiceScreen.routName: (ctx) =>
                      TermAndServiceScreen(),
                  PrivacyAndPolicyScreen.routName: (ctx) =>
                      PrivacyAndPolicyScreen(),
                  OnboardingScreen.routName: (ctx) => OnboardingScreen(),
                  MaintenanceScreen.routName: (ctx) => MaintenanceScreen(),
                  SearchTherapyScreen.routName: (ctx) =>
                      SearchTherapyScreen().wrappedRoute(ctx),
                  DoctorListScreen.routName: (ctx) => DoctorListScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as DoctorListArguments)
                      .wrappedRoute(ctx),
                  SearchDoctorScreen.routName: (ctx) =>
                      SearchDoctorScreen().wrappedRoute(ctx),
                  DoctorDetailScreen.routName: (ctx) => DoctorDetailScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as DoctorDetailArguments)
                      .wrappedRoute(ctx),
                  BookAppointmentScreen.routName: (ctx) =>
                      BookAppointmentScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as BookAppointmentArguments)
                          .wrappedRoute(ctx),
                  BookingUserConsultationScreen.routName: (ctx) =>
                      BookingUserConsultationScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as BookingUserConsultationArguments)
                          .wrappedRoute(ctx),
                  ConsultationCheckoutScreen.routName: (ctx) =>
                      ConsultationCheckoutScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as ConsultationCheckoutArguments)
                          .wrappedRoute(ctx),
                  PaymentSuccessScreen.routName: (ctx) => PaymentSuccessScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as PaymentSuccessArguments),
                  CategoryDetailScreen.routName: (ctx) => CategoryDetailScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as CategoryDetailArguments)
                      .wrappedRoute(ctx),
                  TherapyDetailScreen.routName: (ctx) => TherapyDetailScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as TherapyDetailArguments)
                      .wrappedRoute(ctx),
                  TrendingBlogDetailScreen.routName: (ctx) =>
                      TrendingBlogDetailScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as TrendingBlogDetailArguments),
                  BookedTherapyDetailScreen.routName: (ctx) =>
                      BookedTherapyDetailScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as BookedTherapyDetailArguments)
                          .wrappedRoute(ctx),
                  PdfViewScreen.routName: (ctx) => PdfViewScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as PdfViewArguments),
                  FrequentlyAddedScreen.routName: (ctx) =>
                      FrequentlyAddedScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as FrequentlyAddedArgs),
                  BookingUserTherapyScreen.routName: (ctx) =>
                      BookingUserTherapyScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as BookingUserTherapyArguments)
                          .wrappedRoute(ctx),
                  TermsAndConditionsScreen.routName: (ctx) =>
                      TermsAndConditionsScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as TermsAndConditionsArguments)
                          .wrappedRoute(ctx),
                  BookTherapyTimeScreen.routName: (ctx) =>
                      BookTherapyTimeScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as BookTherapyTimeArguments)
                          .wrappedRoute(ctx),

                  TherapyCheckoutScreen.routName: (ctx) =>
                      TherapyCheckoutScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as TherapyCheckoutArguments)
                          .wrappedRoute(ctx),

                  ConsultationBookingDetailScreen.routName: (ctx) =>
                      ConsultationBookingDetailScreen(
                              arguments: ModalRoute.of(ctx)!.settings.arguments!
                                  as ConsultationBookingDetailArguments)
                          .wrappedRoute(ctx),

                  CancelConsultationSuccessScreen.routName: (ctx) =>
                      CancelConsultationSuccessScreen(
                          doctorName: ModalRoute.of(ctx)!.settings.arguments!
                              as String),

                  PaymentHistoryScreen.routName: (ctx) =>
                      PaymentHistoryScreen().wrappedRoute(ctx),

                  AboutUsScreen.routName: (ctx) =>
                      AboutUsScreen().wrappedRoute(ctx),

                  AboutUsDetailScreen.routName: (ctx) => AboutUsDetailScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as AboutUsDetailArguments),

                  SupportScreen.routName: (ctx) => SupportScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as SupportArguments)
                      .wrappedRoute(context),

                  QuizScreen.routName: (ctx) =>
                      QuizScreen().wrappedRoute(context),

                  QuizResultScreen.routName: (ctx) => QuizResultScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as QuizResultArguments),

                  ChatScreen.routName: (ctx) => ChatScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as ChatArguments)
                      .wrappedRoute(context),

                  PhotoViewScreen.routName: (ctx) => PhotoViewScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as PhotoViewArguments),

                  NotificationScreen.routName: (ctx) => NotificationScreen(),
                  ReferAndEarn.routName: (ctx) => ReferAndEarn(),

                  AudioCallScreen.routName: (ctx) => AudioCallScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as AudioCallArguments),

                  VideoCallScreen.routName: (ctx) => VideoCallScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as VideoCallArguments),

                  RateUsScreen.routName: (ctx) => RateUsScreen(
                          arguments: ModalRoute.of(ctx)!.settings.arguments!
                              as RateUsArguments)
                      .wrappedRoute(context),

                  RateUsSuccessScreen.routName: (ctx) => RateUsSuccessScreen(),
                  // BookingScreen1.routName: (ctx) => BookingScreen1(),
                  VideoPlayerScreen.routName: (ctx) => VideoPlayerScreen(
                      arguments: ModalRoute.of(ctx)!.settings.arguments!
                          as VideoPlayerArguments),
                },
                // onGenerateRoute: (settings) {
                //   final arguments = settings.arguments;
                //   switch (settings.name) {
                //     case '/users':
                //       if (arguments is String) {
                //         // the details page for one specific user
                //         return UserDetails(arguments);
                //       }
                //       else {
                //         // a route showing the list of all users
                //         return UserList();
                //       }
                //     default:
                //       return null;
                //   }
                // },
              );
            } else {
              return MaterialApp(home: Container(color: Colors.white));
            }
          },
        ),
      ),
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future<String> init(BuildContext context) async {
    await GetIt.I.allReady();
    var preferenceUtil = GetIt.I.get<PreferenceUtil>();
    var accessToken = await preferenceUtil.getAccessToken();
    var expiryTime = await preferenceUtil.getExpiryTime();
    var currentTime = DateTime.now().millisecondsSinceEpoch;
    var isFistTimeOpenApp = await preferenceUtil.isFirstTimeOpenApp();
    initFreshChat();
    var route;
    if (isFistTimeOpenApp) {
      await preferenceUtil.saveFirstTimeOpenApp();
      route = OnboardingScreen.routName;
    } else {
      if (accessToken.isNotEmpty && expiryTime > currentTime) {
        route = MainScreen.routName;
      } else {
        route = LoginScreen.routName;
      }
    }
    return route;
  }

  Future<void> initFreshChat() async {
    Freshchat.init(Constant.freshChatAppId, Constant.freshChatAppKey,
        Constant.freshChatDomain,
        cameraCaptureEnabled: true,
        gallerySelectionEnabled: true,
        responseExpectationEnabled: true);
  }
}
