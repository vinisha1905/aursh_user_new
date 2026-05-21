import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/blog_model.dart';
import 'package:ayursh/domain/model/response/config_model.dart';
import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:ayursh/domain/model/response/therapy_category_response.dart';
import 'package:ayursh/domain/model/response/user_review_model.dart';
import 'package:ayursh/domain/repository/onboarding_repository.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freshchat_sdk/freshchat_sdk.dart';
import 'package:freshchat_sdk/freshchat_user.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TherapyRepository therapyRepository;
  final OnboardingRepository onboardingRepository;
  final PreferenceUtil preferenceUtil;

  HomeBloc(
      {required this.therapyRepository,
      required this.onboardingRepository,
      required this.preferenceUtil})
      : super(HomeState.initialize());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.map(initialize: (e) async* {
      yield state.copyWith(loadingState: LoadingState.isInitial);
    }, getData: (e) async* {
      print("user phone number callleed");
      _handleGetProfile();
      yield* _handleFetchTherapyCategory();
      yield* _handleFetchPhysioTherapyCategory();
      yield* _handleFetchBlogs();
      yield* _handleFetchReviews();
      yield* _handleFetchConfigs();
    }, showAllCategories: (e) async* {
      if (e.isShowAll) {
        yield state.copyWith(
            categories: state.therapyCategoryResponse?.categories ?? []);
      } else {
        yield state.copyWith(categories: state.categories);
      }
    }, showAllPhysioCategories: (e) async* {
      if (e.isShowAll) {
        print(
            "yielding ${e.isShowAll}, ${state.physioTherapyCategoryResponse?.categories}");
        yield state.copyWith(
            physioCategories:
                state.physioTherapyCategoryResponse?.categories ?? []);
      } else {
        yield state.copyWith(physioCategories: state.physioCategories);
      }
    }, selectUserReviewPage: (e) async* {
      yield state.copyWith(selectedUserReview: e.index);
    }, updateLocation: (e) async* {
      await onboardingRepository.updateLocation(e.data);
    });
  }

  Stream<HomeState> _handleFetchTherapyCategory() async* {
    yield state.copyWith(loadingState: LoadingState.isLoading);
    var therapyCategoryResp = await therapyRepository.getCategories();
    yield* therapyCategoryResp.fold((error) async* {
      print(error);
      yield state.copyWith(loadingState: LoadingState.isCompleted);
    }, (response) async* {
      if (response.success) {
        // print(loginResponse.toString());
        var limitCategory;
        if (response.categories != null) {
          // if (response.categories!.length > 6) {
          //   limitCategory = response.categories!.take(6).toList();
          // } else {
          limitCategory = response.categories;
          // }
        } else {
          limitCategory = <TherapyCategoryModel>[];
        }
        await preferenceUtil.saveCategoryList(response.categories ?? []);
        yield state.copyWith(
            therapyCategoryResponse: response,
            categories: limitCategory,
            loadingState: LoadingState.isCompleted);
      } else {
        // print(loginResponse.message);
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }
    });
  }

  Stream<HomeState> _handleFetchBlogs() async* {
    var blogsResp = await therapyRepository.getBlogs();
    yield* blogsResp.fold((error) async* {
      print(error);
      yield state;
    }, (response) async* {
      if (response.success) {
        // print(loginResponse.toString());
        List<BlogModel> blogs = response.blogs ?? <BlogModel>[];
        if (response.blogs != null) {
          blogs = response.blogs!;
        }
        yield state.copyWith(blogs: blogs);
      } else {
        print(response.message);
        yield state;
      }
    });
  }

  Stream<HomeState> _handleFetchPhysioTherapyCategory() async* {
    yield state.copyWith(loadingState: LoadingState.isLoading);
    var therapyCategoryResp = await therapyRepository.getPhysioCategories();

    yield* therapyCategoryResp.fold((error) async* {
      print(error);
      yield state.copyWith(loadingState: LoadingState.isCompleted);
    }, (response) async* {
      if (response.success) {
        // print(loginResponse.toString());
        var limitCategory;
        if (response.categories != null) {
          // if (response.categories!.length > 6) {
          //   limitCategory = response.categories!.take(6).toList();
          // } else {
          limitCategory = response.categories;
          // }
        } else {
          limitCategory = <TherapyCategoryModel>[];
        }
        await preferenceUtil.savePhysioCategoryList(response.categories ?? []);

        print("yielding physio ${limitCategory.length}");
        yield state.copyWith(
          physioTherapyCategoryResponse: response,
          physioCategories: limitCategory,
          loadingState: LoadingState.isCompleted,
        );
      } else {
        // print(loginResponse.message);
        yield state.copyWith(loadingState: LoadingState.isCompleted);
      }
    });
  }

  Stream<HomeState> _handleFetchReviews() async* {
    var reviewsResp = await therapyRepository.getUserReviews();
    yield* reviewsResp.fold((error) async* {
      print(error);
      yield state;
    }, (response) async* {
      if (response.success) {
        // print(loginResponse.toString());
        List<UserReviewModel> reviews = response.reviews ?? <UserReviewModel>[];
        yield state.copyWith(reviews: reviews);
      } else {
        print(response.message);
        yield state;
      }
    });
  }

  Stream<HomeState> _handleFetchConfigs() async* {
    var configResponse = await onboardingRepository.getConfigs();
    yield* configResponse.fold((error) async* {
      print(error);
      yield state;
    }, (response) async* {
      if (response.success) {
        var configModel = response.configModel;
        await preferenceUtil.saveAppConfigs(configModel);
        yield state.copyWith(configModel: configModel);
      } else {
        print(response.message);
        yield state;
      }
    });
  }

  Future _handleGetProfile() async {
  var response = await onboardingRepository.getUserProfile();
  response.fold((error) {
  }, (response) async {
    if (response.success) {
      var profileModel = response.profileModel;
      FreshchatUser user = await Freshchat.getUser;
      user.setFirstName(profileModel.name ?? '');
      user.setEmail(profileModel.email ?? '');
      if (profileModel.phoneNumber != null &&
          profileModel.phoneNumber.length >= 10) {
        user.setPhone('', profileModel.phoneNumber);
      }

       Freshchat.setUser(user);
    }
  });
}

}
