import 'package:ayursh/domain/model/loading_state.dart';
import 'package:ayursh/domain/model/response/category_detail_model.dart';
import 'package:ayursh/domain/model/response/doctor_model.dart';
import 'package:ayursh/domain/model/response/therapy_category_model.dart';
import 'package:ayursh/domain/repository/therapy_repo.dart';
import 'package:ayursh/domain/util/preference_util.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_detail_bloc.freezed.dart';
part 'category_detail_event.dart';
part 'category_detail_state.dart';

class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final TherapyRepository therapyRepository;
  final PreferenceUtil preferenceUtil;

  CategoryDetailBloc({required this.therapyRepository, required this.preferenceUtil}) : super(CategoryDetailState.initialize());

  @override
  Stream<CategoryDetailState> mapEventToState(CategoryDetailEvent event) async* {
    yield* event.map(initialize: (e) async* {
      List<TherapyCategoryModel> categories = [];

      if (e.type == "ayur") {
        categories = await preferenceUtil.getCategoryList();
      } else if (e.type == "physio") {
        categories = await preferenceUtil.getPhysioCategoryList();
      } else {
        print(await preferenceUtil.getCategoryList());
        categories = await preferenceUtil.getCategoryList();
        List<TherapyCategoryModel> category = await preferenceUtil.getPhysioCategoryList();
        categories.addAll(category);
      }
      yield state.copyWith(loadingState: LoadingState.isInitial, categories: categories);
    }, getCategoryDetail: (e) async* {
      final firstCatTitle = state.categories.isNotEmpty ? state.categories.first.title : "";
      yield state.copyWith(loadingState: LoadingState.isLoading, title: e.title ?? firstCatTitle);
      var response = await therapyRepository.getCategoryDetail(e.title ?? state.categories.first.title);
      yield* response.fold((error) async* {
        yield state.copyWith(loadingState: LoadingState.isCompleted, categoryDetailModel: null);
      }, (getCategoryResp) async* {
        if (getCategoryResp.success && getCategoryResp.categories.isNotEmpty) {
          yield state.copyWith(loadingState: LoadingState.isCompleted, categoryDetailModel: getCategoryResp.categories.first);
        } else {
          yield state.copyWith(loadingState: LoadingState.isCompleted, categoryDetailModel: null);
        }
      });
    });
  }
}
