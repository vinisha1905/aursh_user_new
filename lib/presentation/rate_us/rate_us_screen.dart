import 'package:ayursh/application/rate_us/rate_us_bloc.dart';
import 'package:ayursh/presentation/rate_us_success/rate_us_success_screen.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/line_divider_widget.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/presentation/widget/text_widget.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

class RateUsArguments {
  final String bookingId;
  final String therapyName;
  final String therapistName;
  final String therapistImageUrl;

  RateUsArguments(this.bookingId, this.therapyName, this.therapistName,
      this.therapistImageUrl);
}

class RateUsScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/rate_us';
  final RateUsArguments arguments;

  const RateUsScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  RateUsScreenState createState() {
    return RateUsScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<RateUsBloc>()
        ..add(RateUsEvent.initialize(arguments.bookingId, arguments.therapyName,
            arguments.therapistName, arguments.therapistImageUrl)),
      child: this,
    );
  }
}

class RateUsScreenState extends State<RateUsScreen> {
  late TextEditingController _therapyController;
  late TextEditingController _therapistController;

  @override
  void initState() {
    super.initState();
    _therapyController = TextEditingController();
    _therapistController = TextEditingController();
  }

  @override
  void dispose() {
    _therapyController.dispose();
    _therapistController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(
        color: AppColors.darkGray,
        fontSize: 16,
        fontWeight: Constant.fontMedium);
    return SafeArea(
      child:
          BlocConsumer<RateUsBloc, RateUsState>(listener: (ctx, state) async {
        if (state.isSuccess == true) {
          await Navigator.of(context).pushNamed(RateUsSuccessScreen.routName);
          Navigator.of(context).pop(true);
        }
      }, builder: (ctx, state) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('Rate Us'),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: double.infinity,
                          height: 16,
                          color: AppColors.offWhite),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Rate The Therapy', style: headerStyle),
                                  Expanded(
                                      child: Text(
                                    state.therapyName ?? '',
                                    style: TextStyle(
                                        color: AppColors.darkGray,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.end,
                                  ))
                                ],
                              ),
                              SizedBox(height: 16),
                              Text('How effective was the therapy?',
                                  style: headerStyle),
                              SizedBox(height: 18),
                              _therapyPointWidget(state),
                              SizedBox(height: 18),
                              LineDividerWidget(),
                              SizedBox(height: 18),
                              Text('Care to share more about it?',
                                  style: headerStyle),
                              SizedBox(height: 16),
                              TextField(
                                controller: _therapyController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.multiline,
                                minLines: 5,
                                maxLines: 20,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: 'Write here',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                          width: double.infinity,
                          height: 16,
                          color: AppColors.offWhite),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rate The Therapist', style: headerStyle),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipOval(
                                      child: Container(
                                    width: 56,
                                    height: 56,
                                    child: AspectRatio(
                                        aspectRatio: 1,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              state.therapistImageUrl ?? '',
                                          width: 56,
                                          height: 56,
                                          fit: BoxFit.cover,
                                          errorWidget: (ctx, a, b) {
                                            return Container(
                                              color: AppColors.grayLight,
                                            );
                                          },
                                        )),
                                  )),
                                  Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 14),
                                        child: TextWidget(
                                            text: state.therapistName ?? '',
                                            fontSize: 12,
                                            height: 16,
                                            fontWeight: Constant.fontMedium,
                                            textColor: AppColors.darkGray)),
                                  )
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                  'How was your overall experience with the therapist?',
                                  style: headerStyle),
                              SizedBox(height: 18),
                              _therapistPointWidget(state),
                              SizedBox(height: 18),
                              LineDividerWidget(),
                              SizedBox(height: 18),
                              Text('Tell us more', style: headerStyle),
                              SizedBox(height: 16),
                              TextField(
                                controller: _therapistController,
                                keyboardType: TextInputType.multiline,
                                textInputAction: TextInputAction.done,
                                minLines: 5,
                                maxLines: 20,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                decoration: InputDecoration(
                                  hintText: 'Write here',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(height: 26),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: PrimaryButtonWidget(
                            title: 'Submit Feedback',
                            onTap: () {
                              context.read<RateUsBloc>().add(RateUsEvent.submit(
                                  _therapyController.text.trim(),
                                  _therapistController.text.trim()));
                            }),
                      )
                    ],
                  ),
                )),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }

  Widget _therapyPointWidget(RateUsState state) {
    return Row(
      children: [
        _starWidget(true, 1, state),
        _starWidget(true, 2, state),
        _starWidget(true, 3, state),
        _starWidget(true, 4, state),
        _starWidget(true, 5, state),
      ],
    );
  }

  Widget _therapistPointWidget(RateUsState state) {
    return Row(
      children: [
        _starWidget(false, 1, state),
        _starWidget(false, 2, state),
        _starWidget(false, 3, state),
        _starWidget(false, 4, state),
        _starWidget(false, 5, state),
      ],
    );
  }

  Widget _starWidget(bool isTherapy, int pointValue, RateUsState state) {
    var isActive = false;
    if (isTherapy) {
      isActive = pointValue <= (state.therapyPoint ?? 0);
    } else {
      isActive = pointValue <= (state.therapistPoint ?? 0);
    }
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (isTherapy) {
              context
                  .read<RateUsBloc>()
                  .add(RateUsEvent.setTherapyPoint(pointValue));
            } else {
              context
                  .read<RateUsBloc>()
                  .add(RateUsEvent.setTherapistPoint(pointValue));
            }
          },
          child: Container(
            width: 32,
            height: 31,
            child: SvgPicture.asset(
                isActive
                    ? 'assets/icons/ic_star_active.svg'
                    : 'assets/icons/ic_star_inactive.svg',
                fit: BoxFit.fill),
          ),
        ),
        SizedBox(width: 12)
      ],
    );
  }
}
