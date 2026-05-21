import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/business/therapy_booking_info.dart';
import 'package:ayursh/domain/model/response/add_on_therapy.dart';
import 'package:ayursh/domain/model/response/add_on_therapy_post.dart';
import 'package:ayursh/domain/model/response/therapy_detail_model.dart';
import 'package:ayursh/presentation/booking_user_therapy/booking_user_therapy_screen.dart';
import 'package:ayursh/presentation/frequently_added/widgets/add_on_therapy_card.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/app_extentions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class FrequentlyAddedArgs {
  final TherapyBookingInfo therapyBookingInfo;
  final TherapyDetailModel therapyDetails;
  final TherapyDetailState therapyDetailState;

  const FrequentlyAddedArgs({
    required this.therapyBookingInfo,
    required this.therapyDetails,
    required this.therapyDetailState,
  });
}

class FrequentlyAddedScreen extends StatefulWidget {
  static final String routName = '/frequently_added';
  final FrequentlyAddedArgs arguments;

  const FrequentlyAddedScreen({Key? key, required this.arguments})
      : super(key: key);

  @override
  FrequentlyAddedScreenState createState() {
    return FrequentlyAddedScreenState();
  }
}

class FrequentlyAddedScreenState extends State<FrequentlyAddedScreen>
    with AutomaticKeepAliveClientMixin {
  late ScrollController scrollController;
  List<AddOnTherapy> physioTherapies = [];
  List<AddOnTherapy> ayurvedicTherapies = [];
  late String mainTherapyCategory;

  var hasAyurvedicSubcategories = false;
  var hasPhysioSubcategories = false;

  calculateHeightOfSections(String type) {
    if (type.contains("ayur")) {
      for (final item in ayurvedicTherapies) {
        if (item.title.contains("jeevottama-ayurvedic")) {
          hasAyurvedicSubcategories = true;
        }

        if ((item.pricePerSessionHalfBody != null &&
            item.pricePerSessionHalfBody != 0)) {
          hasAyurvedicSubcategories = true;
          break;
        }
        if (item.pricePerSessionPerKnee != null &&
            item.pricePerSessionPerKnee != 0) {
          hasAyurvedicSubcategories = true;
          break;
        }
      }
    } else if (type.contains("physio")) {
      for (final item in physioTherapies) {
        if ((item.pricePerSessionHalfBody != null &&
            item.pricePerSessionHalfBody != 0)) {
          hasPhysioSubcategories = true;
          break;
        }
        if (item.pricePerSessionPerKnee != null &&
            item.pricePerSessionPerKnee != 0) {
          hasPhysioSubcategories = true;
          break;
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    total = widget.arguments.therapyBookingInfo.totalAmountOfSessions;

    final _addOns = widget.arguments.therapyDetailState.finderResponse?.data
        ?.locations?[0].addOnTherapies;

    physioTherapies = _addOns
            ?.where((element) => element.category.contains("physio"))
            .toList() ??
        [];
    ayurvedicTherapies = _addOns
            ?.where((element) => element.category.contains("ayur"))
            .toList() ??
        [];

    mainTherapyCategory = widget.arguments.therapyDetails.category;

    calculateHeightOfSections("ayur");
    calculateHeightOfSections("physio");
  }

  bool refreshing = false;

  void refreshScreen() async {
    print("AYURSH refreshing screen!");
    refreshing = true;

    setState(() {});
    await Future.delayed(Duration(
      milliseconds: 100,
    ));

    refreshing = false;
    updateAddOnTherapies(null, null, null, true);

    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              floatingActionButton: refreshing
                  ? Container(height: 0)
                  : Container(
                      padding: EdgeInsets.only(bottom: 65),
                      child: Stack(
                        children: [
                          Container(
                            child: FloatingActionButton(
                              child: Icon(Icons.shopping_cart,
                                  color: Colors.white),
                              backgroundColor: AppColors.darkYellow,
                              onPressed: () {
                                showModalSheet(() async {
                                  refreshScreen();
                                });
                              },
                            ),
                          ),
                          Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: "${therapies.length + 1}",
                                  fontSize: 14,
                                  height: 19,
                                ),
                              )),
                        ],
                      ),
                    ),
              backgroundColor: AppColors.offWhite,
              appBar: AppBar(
                title: Text('Frequently added together'),
                leading: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_rounded,
                        color: AppColors.darkGray)),
              ),
              body: refreshing
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      child: Column(children: [
                        if (mainTherapyCategory.contains("physio")) ...[
                          _buildPhysioTherapiesList(context),
                          SizedBox(height: 20),
                          _buildAyurvedaTherapiesList(context),
                        ] else ...[
                          _buildAyurvedaTherapiesList(context),
                          SizedBox(height: 20),
                          _buildPhysioTherapiesList(context),
                        ],
                        SizedBox(height: 180),
                      ]),
                    )),
          Positioned(
            left: 0,
            right: 0,
            bottom: 12,
            child: _continueWidget(),
          ),
          // LoadingWidget(loadingState: state.loadingState)
        ],
      ),
    );
  }

  Container _buildAyurvedaTherapiesList(BuildContext context) {
    return Container(
      child: ayurvedicTherapies.isEmpty
          ? SizedBox(height: 0)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Frequently added ayurveda therapies",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: hasAyurvedicSubcategories ? 330 : 330,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final item in ayurvedicTherapies)
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: TherapyCard(
                              item,
                              (th, prev, removeTherapyTitle) {
                                updateAddOnTherapies(
                                    th, prev, removeTherapyTitle);
                              },
                              previouslySelected.firstWhereOrNull(
                                  (e) => e.therapyTitle == item.title),
                            ),
                          ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Container _buildPhysioTherapiesList(BuildContext context) {
    return Container(
      child: physioTherapies.isEmpty
          ? SizedBox(height: 0)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text("Frequently added physiotherapies",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 17, fontWeight: FontWeight.bold)),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: hasPhysioSubcategories ? 330 : 280,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final item in physioTherapies)
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: TherapyCard(
                              item,
                              (th, prev, removeTherapyTitle) {
                                updateAddOnTherapies(
                                    th, prev, removeTherapyTitle);
                              },
                              previouslySelected.firstWhereOrNull(
                                  (e) => e.therapyTitle == item.title),
                            ),
                          ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  updateAddOnTherapies(
      [AddOnTherapyPost? th,
      SelectedPreviouslyModel? prevModel,
      String? removeTherapyTitle,
      bool? refresh = false]) {
    if (th != null) {
      final index = therapies
          .indexWhere((element) => element.therapyTitle == th.therapyTitle);

      if (index != -1) {
        therapies.removeAt(index);
      }

      therapies.add(th);
    } else {
      if (removeTherapyTitle != null || refresh == true) {
        therapies.removeWhere(
            (element) => element.therapyTitle == removeTherapyTitle);
      }
    }

    if (prevModel != null) {
      final indexOfPreviously = previouslySelected.indexWhere(
          (element) => element.therapyTitle == prevModel.therapyTitle);
      if (indexOfPreviously != -1) {
        previouslySelected.removeAt(indexOfPreviously);
      }
      previouslySelected.add(prevModel);
    } else {
      if (removeTherapyTitle != null || refresh == true) {
        print("AYURSH removing prev..");
        previouslySelected.removeWhere(
            (element) => element.therapyTitle == removeTherapyTitle);
        print("AYURSH removing prev ${previouslySelected.length}..");
      }
    }

    print("updated Therapies.length ${therapies.length}");

    total = widget.arguments.therapyBookingInfo.totalAmountOfSessions;
    therapies.forEach((element) {
      total = total + element.amountPayable;
    });

    setState(() {});
  }

  showModalSheet(Function refresh) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return Column(
              children: [
                Container(
                  height: 50,
                  color: AppColors.darkYellow,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Text("Selected Therapies",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white, fontSize: 18)),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.cancel_outlined, color: Colors.white),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 20),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(children: [
                    _buildCartItem(null, setModalState, refresh),
                    for (int i = 0; i < therapies.length; i++)
                      _buildCartItem(therapies[i], setModalState, refresh),
                  ]),
                )),
                Container(height: 20),
              ],
            );
          });
        });
  }

  Widget _buildCartItem(
      AddOnTherapyPost? item, Function setModalState, Function refresh) {
    final count = item == null
        ? int.parse(widget
            .arguments.therapyBookingInfo.sessionSelectedInfo.totalSession!)
        : item.totalSessions;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 120,
            child: Image.network(
              item == null
                  ? widget.arguments.therapyDetails.imageUrl
                  : item.imageUrl,
            )),
        SizedBox(width: MediaQuery.of(context).size.width / 20),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              item == null ? widget.arguments.therapyDetails.name : item.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 20),

            TextWidget(
                text:
                    "${item == null ? '${Constant.formatCurrency(widget.arguments.therapyBookingInfo.totalAmountOfSessions.display())}' : Constant.formatCurrency(item.amountPayable.display())}",
                fontSize: 16,
                height: 18,
                textColor: Colors.black),
            SizedBox(height: 5),
            // if (item != null)
            Row(
              children: [
                TextWidget(
                    text: "$count ${count == 1 ? "Session" : "Sessions"}",
                    fontSize: 12,
                    height: 17,
                    textColor: Colors.black),
                SizedBox(width: 10),
                TextWidget(
                    text:
                        "${item == null ? widget.arguments.therapyBookingInfo.therapyDuration : '${item.sessionDurationInMin}-Minutes'}",
                    fontSize: 12,
                    height: 17,
                    textColor: Colors.black),
                SizedBox(width: 10),
                TextWidget(
                    text: item == null
                        ? widget.arguments.therapyBookingInfo.serviceType ?? ''
                        : item.servicePart == ServicePart.Body &&
                                item.serviceType == ServiceType.Part
                            ? "Half Body"
                            : item.servicePart == ServicePart.Body &&
                                    item.serviceType == ServiceType.Full
                                ? 'Full Body'
                                : item.servicePart == ServicePart.Knee &&
                                        item.serviceType == ServiceType.Part
                                    ? 'One Knee'
                                    : item.servicePart == ServicePart.Knee &&
                                            item.serviceType == ServiceType.Full
                                        ? 'Two Knee'
                                        : '',
                    fontSize: 12,
                    height: 17,
                    textColor: Colors.black),
              ],
            ),
          ]),
        ),
        item == null
            ? Container()
            : Container(
                width: MediaQuery.of(context).size.width / 12,
                child: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    therapies.removeWhere(
                        (e) => item.therapyTitle == e.therapyTitle);
                    previouslySelected.removeWhere(
                        (e) => item.therapyTitle == e.therapyTitle);
                    refresh();
                    setModalState(() {});
                    // _key.currentState!.refresh();
                  },
                ),
              ),
      ]),
    );
  }

  List<AddOnTherapyPost> therapies = [];
  List<SelectedPreviouslyModel> previouslySelected = [];

  double total = 0;

  Widget _continueWidget() {
    return GestureDetector(
      onTap: () {
        final updatedTherapyBookingInfo = widget.arguments.therapyBookingInfo
            .copyWithAddOnTherapies(
                therapies,
                widget.arguments.therapyBookingInfo.totalAmountOfSessions,
                total);

        Navigator.of(context).pushNamed(BookingUserTherapyScreen.routName,
            arguments: BookingUserTherapyArguments(updatedTherapyBookingInfo));
      },
      child: Material(
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(left: 12, right: 12),
          padding: EdgeInsets.only(left: 12, right: 12),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: AppColors.darkYellow),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                      "${therapies.length + 1} ${(therapies.length) == 0 ? "Item" : "Items"}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: Constant.fontMedium,
                      )),
                  SizedBox(height: 6),
                  Text("${Constant.formatCurrency(total.display())}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: Constant.fontMedium,
                      ))
                ],
              ),
              Spacer(),
              Text('Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // void _showError(String error) {
  //   Fluttertoast.showToast(
  //       msg: error,
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.white70,
  //       textColor: AppColors.darkBlue,
  //       fontSize: 12.0);
  // }

  double pricePerSession(TherapyDetailState state) {
    double pricePerSession = state.serviceType == ServiceType.Full
        ? state.selectedPricingOption!.oldPrice /
            state.selectedPricingOption!.count
        : state.selectedPricingOption!.oldPriceHalfBody /
            state.selectedPricingOption!.count;
    return pricePerSession;
  }

  int sessionDurationInMin(TherapyDetailState state) {
    int sessionDurationInMin = 0;
    if (state.servicePart == ServicePart.Body) {
      if (state.serviceType == ServiceType.Part) {
        sessionDurationInMin =
            state.therapyDetailModel?.sessionDurationInMinHalfBody ?? 0;
      } else {
        sessionDurationInMin =
            state.therapyDetailModel?.sessionDurationInMinFullBody ?? 0;
      }
    } else {
      sessionDurationInMin =
          state.therapyDetailModel?.sessionDurationInMin ?? 0;
    }

    return sessionDurationInMin;
  }

  @override
  bool get wantKeepAlive => true;
}
