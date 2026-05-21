import 'package:ayursh/application/support/support_bloc.dart';
import 'package:ayursh/domain/model/response/profile_model.dart';
import 'package:ayursh/presentation/util/app_colors.dart';
import 'package:ayursh/presentation/widget/loading_widget.dart';
import 'package:ayursh/presentation/widget/primary_button_widget.dart';
import 'package:ayursh/presentation/widget/route_wrapper.dart';
import 'package:ayursh/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SupportArguments {
  final ProfileModel profile;

  const SupportArguments(this.profile);
}

class SupportScreen extends StatefulWidget with RouteWrapper {
  static final String routName = '/support';
  final SupportArguments arguments;

  const SupportScreen({Key? key, required this.arguments}) : super(key: key);

  @override
  SupportScreenState createState() {
    return SupportScreenState();
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<SupportBloc>()
        ..add(SupportEvent.initialize(arguments.profile)),
      child: this,
    );
  }
}

class SupportScreenState extends State<SupportScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<SupportBloc, SupportState>(listener: (ctx, state) {
        if (state.result != null) {
          state.result!.fold((l) => Constant.showError(l),
              (r) => Navigator.of(context).pop(true));
        }
      }, listenWhen: (state1, state2) {
        return state1.result != state2.result;
      }, builder: (ctx, state) {
        return Stack(
          children: [
            Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text('Support'),
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.arrow_back_rounded,
                          color: AppColors.darkGray)),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Happy to help!!!',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: Constant.fontMedium)),
                        SizedBox(height: 20),
                        Text(
                            'If you have any kind of queries, please reach out to us, our team will get back to you within 24 hours',
                            style: TextStyle(color: Colors.black, height: 1.3)),
                        SizedBox(height: 32),
                        TextField(
                          controller: _messageController,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 20,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          decoration: InputDecoration(
                            hintText: 'Write here (min 30 characters)',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 16),
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
                        SizedBox(height: 26),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                          child: PrimaryButtonWidget(
                              title: 'Submit',
                              onTap: () {
                                String message = _messageController.text.trim();
                                if (message.length < 30) {
                                  Constant.showError(
                                      'Minimum 30 characters are required');
                                  return;
                                }
                                context
                                    .read<SupportBloc>()
                                    .add(SupportEvent.sendSupport(message));
                              }),
                        )
                      ],
                    ),
                  ),
                )),
            LoadingWidget(loadingState: state.loadingState)
          ],
        );
      }),
    );
  }
}
