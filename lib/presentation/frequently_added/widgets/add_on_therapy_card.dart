import 'package:ayursh/application/therapy_detail/therapy_detail_bloc.dart';
import 'package:ayursh/domain/model/response/add_on_therapy.dart';
import 'package:ayursh/domain/model/response/add_on_therapy_post.dart';
import 'package:ayursh/domain/model/response/pricing_option_model.dart';
import 'package:ayursh/presentation/frequently_added/widgets/add_on_therapy_button.dart';
import 'package:ayursh/presentation/therapy_detail/therapy_detail_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:ayursh/utils/app_extentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectedPreviouslyModel {
  final String therapyTitle;
  final PricingOptionModel selectedOption;
  final int sessionDurationInMin;
  final double offerPrice;
  final ServiceType serviceType;
  final ServicePart servicePart;
  final int selectedIndex;
  final int selectedDurationIndex;

  SelectedPreviouslyModel(
      {required this.therapyTitle,
      required this.selectedOption,
      required this.sessionDurationInMin,
      required this.offerPrice,
      required this.serviceType,
      required this.servicePart,
      required this.selectedIndex,
      required this.selectedDurationIndex});
}

class TherapyCard extends StatefulWidget {
  final AddOnTherapy therapy;
  final SelectedPreviouslyModel? selectedPreviously;
  final Function(
      AddOnTherapyPost? therapyPost,
      SelectedPreviouslyModel? selectedPreviously,
      String? removeTherapyTitle)? onSelect;

  const TherapyCard(this.therapy, this.onSelect, this.selectedPreviously,
      {Key? key})
      : super(key: key);

  @override
  State<TherapyCard> createState() => _TherapyCardState();
}

class _TherapyCardState extends State<TherapyCard> {
  late List<PricingOptionModel> options;
  PricingOptionModel? selectedOption;
  late double offerPrice;
  int? sessionDurationInMin;
  int selectedDurationIndex = 0;
  var serviceType = ServiceType.Full;
  var servicePart = ServicePart.None;

  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    options = widget.therapy.pricingOptions;

    if (widget.selectedPreviously != null) {
      serviceType = widget.selectedPreviously!.serviceType;
      servicePart = widget.selectedPreviously!.servicePart;
      offerPrice = widget.selectedPreviously!.offerPrice;
      selectedOption = widget.selectedPreviously!.selectedOption;
      sessionDurationInMin = widget.selectedPreviously!.sessionDurationInMin;
      selectedIndex = widget.selectedPreviously!.selectedIndex;
      selectedDurationIndex = widget.selectedPreviously!.selectedDurationIndex;
    } else {
      if ((widget.therapy.pricePerSessionHalfBody != null &&
          widget.therapy.pricePerSessionHalfBody != 0)) {
        serviceType = ServiceType.Part;
        servicePart = ServicePart.Body;
      }
      if (widget.therapy.pricePerSessionPerKnee != null &&
          widget.therapy.pricePerSessionPerKnee != 0) {
        serviceType = ServiceType.Part;
        servicePart = ServicePart.Knee;
      }
    }

    calculatePricingAndDuration();
  }

  increment() {
    if (selectedIndex == options.length - 1) {
      callback("inc");
      return;
    } else {
      selectedIndex++;
      selectedOption = options[selectedIndex];
      callback("inc");
    }

    setState(() {});
  }

  decrement() {
    if (selectedIndex == 0) {
      selectedIndex--;
      selectedOption = null;
      callback("dec");
    } else {
      selectedIndex--;
      selectedOption = options[selectedIndex];
      callback("dec");
    }
    setState(() {});
  }

  callback(String op) {
    calculatePricingAndDuration();
    if (selectedOption != null) {
      widget.onSelect!(
          AddOnTherapyPost(
            offerPrice,
            sessionDurationInMin!,
            selectedOption!.count,
            widget.therapy.title,
            selectedOption!.count,
            widget.therapy.imageUrl,
            widget.therapy.name,
            serviceType,
            servicePart,
          ),
          SelectedPreviouslyModel(
              therapyTitle: widget.therapy.title,
              selectedOption: selectedOption!,
              sessionDurationInMin: sessionDurationInMin!,
              offerPrice: offerPrice,
              serviceType: serviceType,
              servicePart: servicePart,
              selectedIndex: selectedIndex,
              selectedDurationIndex: selectedDurationIndex),
          null);
    } else {
      widget.onSelect!(null, null, widget.therapy.title);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 0.75,
              color: Colors.grey,
            )),
        width: 200,
        child: Column(children: [
          _photoWidget(widget.therapy),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.therapy.englishName!,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          if (widget.therapy.title.contains("ayursh_jeevottama")) ...[
            SizedBox(height: 10),
            Container(
              height: 36,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12, right: 12),
                scrollDirection: Axis.horizontal,
                itemCount: durations.length,
                itemBuilder: (ctx, index) {
                  return _durationWidget(
                      widget.therapy,
                      index,
                      index == selectedDurationIndex,
                      index == durations.length - 1);
                },
              ),
            ),
          ] else if (servicePart != ServicePart.None) ...[
            SizedBox(height: 10),
            Container(
              height: 36,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 12, right: 12),
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (ctx, index) {
                  return _serviceTypeWidget(widget.therapy, index);
                },
              ),
            ),
          ],
          SizedBox(height: 10),
          Spacer(),
          Text("${Constant.formatCurrency(offerPrice.display())}",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, fontSize: 17)),
          if (widget.onSelect != null) ...[
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AddOnTherapyButton(
                    title: "Add",
                    onTap: (type) {
                      if (type == "increment")
                        increment();
                      else
                        decrement();
                    },
                    qty: selectedOption?.count ?? 0),
              ],
            ),
          ],
          SizedBox(height: 15),
        ]),
      ),
    );
  }

  Widget _photoWidget(AddOnTherapy therapyDetail) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: therapyDetail.imageUrl,
            progressIndicatorBuilder: (ctx, url, downloadProgess) {
              return Center(
                  child:
                      CircularProgressIndicator(color: AppColors.darkYellow));
            },
            width: double.infinity,
            fit: BoxFit.fill,
            height: 120,
          ),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          therapyDetail.name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ))))),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.4),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          therapyDetail.name,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                        ),
                      ))))),
          Positioned.fill(
              child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                      ),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "$sessionDurationInMin minutes",
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontSize: 10.5,
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      )))))
        ],
      ),
    );
  }

  Widget _serviceTypeWidget(AddOnTherapy addOnTherapy, int index) {
    bool isSelected = false;
    var serviceTypeText = '';
    if (index == 0 && serviceType == ServiceType.Part) {
      isSelected = true;
    }
    if (index == 1 && serviceType == ServiceType.Full) {
      isSelected = true;
    }

    if (servicePart == ServicePart.Body) {
      if (index == 0) {
        serviceTypeText = 'Half Body';
      } else {
        serviceTypeText = 'Full Body';
      }
    } else {
      if (index == 0) {
        serviceTypeText = 'One Knee';
      } else {
        serviceTypeText = 'Two Knees';
      }
    }
    return InkWell(
      onTap: () {
        if (isSelected) {
          return;
        }
        serviceType = index == 0 ? ServiceType.Part : ServiceType.Full;
        calculatePricingAndDuration();
        callback("inc");
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.only(right: 12),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.darkBlue),
              color: isSelected ? AppColors.darkBlue : Colors.white),
          child: Center(
            child: TextWidget(
              text: serviceTypeText,
              fontSize: 12,
              height: 16,
              textColor: isSelected ? Colors.white : AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _durationWidget(
      AddOnTherapy therapyDetail, int index, bool isSelected, bool isLast) {
    int duration = durations[index];

    // var durationText = duration == 60 ? '1 Session' : '$quantity Sessions';

    return InkWell(
      onTap: () {
        sessionDurationInMin = durations[index];
        selectedDurationIndex = index;
        calculatePricingAndDuration();
        callback("inc");
      },
      child: Padding(
        padding: EdgeInsets.only(right: isLast == false ? 12 : 0),
        child: Container(
          width: 100,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              border: Border.all(color: AppColors.darkBlue),
              color: isSelected ? AppColors.darkBlue : Colors.white),
          child: Center(
            child: TextWidget(
              text: "$duration minutes",
              fontSize: 12,
              height: 16,
              textColor: isSelected ? Colors.white : AppColors.darkBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  calculatePricingAndDuration() {
    var pricingOption;
    if (selectedOption == null) {
      pricingOption = widget.therapy.pricingOptions.first;
    } else {
      pricingOption = selectedOption!;
    }

    sessionDurationInMin = widget.therapy.sessionDurationInMin;

    offerPrice = serviceType == ServiceType.Full
        ? pricingOption.offerPrice
        : pricingOption.offerPriceHalfBody;

    if (servicePart == ServicePart.Body) {
      if (serviceType == ServiceType.Part) {
        sessionDurationInMin = widget.therapy.sessionDurationInMinHalfBody;
      } else {
        sessionDurationInMin = widget.therapy.sessionDurationInMinFullBody;
      }
    } else {
      sessionDurationInMin = widget.therapy.sessionDurationInMin;
    }

    if (widget.therapy.title.contains("ayursh_jeevottama")) {
      sessionDurationInMin = durations[selectedDurationIndex];
      offerPrice = _getJevottamaOptionsPrice();
    }

    // callback("inc");
    setState(() {});
  }

  double _getJevottamaOptionsPrice() {
    // ONLY CALL THIS METHOD WHEN THERAPY IS  -- jeevottama-ayurvedic

    final pricingOption = selectedOption ?? widget.therapy.pricingOptions.first;

    final _d = selectedDurationIndex;

    switch (_d) {
      case 0:
        offerPrice = pricingOption.offerPriceOption1;
        break;
      case 1:
        offerPrice = pricingOption.offerPriceOption2;
        break;
      case 2:
        offerPrice = pricingOption.offerPriceOption3;
        break;
    }

    return offerPrice;
  }

// calculateSessionDuration() {

//   if (servicePart == ServicePart.Body) {
//     partSessionDuration = therapyDetail.sessionDurationInMinHalfBody;
//     fullSessionDuration = therapyDetail.sessionDurationInMinFullBody;
//   } else if (servicePart == ServicePart.Knee) {
//     partSessionDuration = therapyDetail.sessionDurationInMin;
//     fullSessionDuration = therapyDetail.sessionDurationInMin;
//   }
// }
}
