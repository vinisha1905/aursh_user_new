import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/custom_print.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:flutter/material.dart';

class CustomApiUi extends StatefulWidget {
  final ApiState state;
  final String? error;
  final List<Widget>? widgets;
  final RefreshCallback? onRefresh;
  final Widget? customWidget;
  final Widget? dataNotFoundWidget;
  final String? noDataFoundText;
  final String? noDataFoundSubText;
  final VoidCallback? onTryAgain;
  final bool? hidePullToRefresh;

  const CustomApiUi({
    required this.state,
    this.customWidget,
    this.dataNotFoundWidget,
    this.error,
    this.onTryAgain,
    this.widgets,
    this.noDataFoundText,
    this.noDataFoundSubText,
    this.onRefresh,
    this.hidePullToRefresh,
  });

  @override
  State<CustomApiUi> createState() => _CustomApiUiState();
}

class _CustomApiUiState extends State<CustomApiUi> {
  @override
  Widget build(BuildContext context) {
    switch (widget.state) {
      case ApiState.none:
        return Container();
      case ApiState.loading:
        return loadingWidget();
      case ApiState.error:
        return errorWidget(error: widget.error, onTryAgain: widget.onTryAgain);
      case ApiState.done:
        if (widget.customWidget != null) {
          if (widget.hidePullToRefresh == true) {
            return widget.customWidget ?? Container();
          } else {
            return RefreshIndicator(
              onRefresh: widget.onRefresh ?? () async {},
              child: widget.customWidget ?? Container(),
            );
          }
        } else {
          if ((widget.widgets ?? []).isEmpty) {
            return widget.dataNotFoundWidget ??
                noItemsFoundWidget(
                  title: widget.noDataFoundText,
                  subTitle: widget.noDataFoundSubText,
                );
          } else {
            if (widget.hidePullToRefresh == true) {
              return ListView(
                children: widget.widgets ?? [],
              );
            } else {
              return RefreshIndicator(
                onRefresh: widget.onRefresh ?? () async {},
                child: ListView(
                  children: widget.widgets ?? [],
                ),
              );
            }
          }
        }
    }
  }
}

class CustomApiUiPagination extends StatefulWidget {
  final ApiState state;
  final PaginationApiState paginationApiState;
  final Function(int length) onPageEnd;
  final String? error;
  final String? errorPagination;
  final List<Widget>? widgets;
  final RefreshCallback? onRefresh;
  final String? noDataFoundText;
  final VoidCallback? onTryAgain;

  const CustomApiUiPagination({
    required this.state,
    required this.paginationApiState,
    required this.onPageEnd,
    this.errorPagination,
    this.error,
    this.onTryAgain,
    this.widgets,
    this.noDataFoundText,
    this.onRefresh,
  });

  @override
  State<CustomApiUiPagination> createState() => _CustomApiUiPaginationState();
}

class _CustomApiUiPaginationState extends State<CustomApiUiPagination> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        customPrint("scrollController ===>>> END");

        if (widget.paginationApiState != PaginationApiState.loading && widget.paginationApiState != PaginationApiState.error && widget.paginationApiState != PaginationApiState.noDataFound) {
          widget.onPageEnd(widget.widgets?.length ?? 0);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.state) {
      case ApiState.none:
        return Container();
      case ApiState.loading:
        return loadingWidget();
      case ApiState.error:
        return errorWidget(error: widget.error, onTryAgain: widget.onTryAgain);
      case ApiState.done:
        if ((widget.widgets ?? []).isEmpty) {
          return noItemsFoundWidget(title: widget.noDataFoundText, onTryAgain: widget.onTryAgain);
        } else {
          return RefreshIndicator(
            onRefresh: widget.onRefresh ?? () async {},
            child: ListView(
              controller: scrollController,
              children: [
                ...(widget.widgets ?? []).map((e) => e),
                if (widget.paginationApiState == PaginationApiState.loading)
                  Container(
                    height: 180,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: loadingWidget(),
                  ),
                if (widget.paginationApiState == PaginationApiState.noDataFound)
                  Container(
                    height: 180,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: noItemsFoundWidget(
                      title: "More Items Not Found",
                      onTryAgain: () {
                        widget.onPageEnd(widget.widgets?.length ?? 0);
                      },
                    ),
                  ),
                if (widget.paginationApiState == PaginationApiState.error)
                  Container(
                    height: 180,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: errorWidget(
                      error: widget.errorPagination,
                      onTryAgain: () {
                        widget.onPageEnd(widget.widgets?.length ?? 0);
                      },
                    ),
                  ),
              ],
            ),
          );
        }
    }
  }
}

Widget loadingWidget({double? size, double? strokeWidth, double? value, Color? color}) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size ?? 24,
        width: size ?? 24,
        child: CircularProgressIndicator(
          value: value,
          color: color ?? primaryGreenColor,
          backgroundColor: color?.withOpacity(0.2) ?? primaryGreenColor.withOpacity(0.2),
          strokeWidth: strokeWidth ?? (size != null ? size / 6 : 4),
        ),
      ),
    ),
  );
}

Widget errorWidget({String? error, VoidCallback? onTryAgain}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          error ?? somethingWentWrong,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),
        if (onTryAgain != null) h(10),
        if (onTryAgain != null)
          OutlinedButton.icon(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: onTryAgain,
            label: Text("Try Again"),
          ),
      ],
    ),
  );
}

Widget noItemsFoundWidget({String? title, String? subTitle, VoidCallback? onTryAgain}) {
  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? "Data Not Found",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: secondaryColor),
        ),
        if (subTitle != null) h(8),
        if (subTitle != null)
          Text(
            subTitle,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        if (onTryAgain != null) h(10),
        if (onTryAgain != null)
          OutlinedButton.icon(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: onTryAgain,
            label: Text("Try Again"),
          ),
      ],
    ),
  );
}

Widget customInkWellColor(
    {required VoidCallback? onTap, BorderRadius? borderRadius, Color? color, required Widget child, EdgeInsetsGeometry padding = EdgeInsets.zero, EdgeInsetsGeometry margin = EdgeInsets.zero}) {
  return Material(
    color: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    child: Padding(
      padding: margin,
      child: InkWell(
        splashColor: color != null ? color.withOpacity(0.1) : primaryGreenColor.withOpacity(0.05),
        focusColor: color != null ? color.withOpacity(0.2) : primaryGreenColor.withOpacity(0.1),
        highlightColor: color != null ? color.withOpacity(0.2) : primaryGreenColor.withOpacity(0.1),
        borderRadius: borderRadius,
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    ),
  );
}
