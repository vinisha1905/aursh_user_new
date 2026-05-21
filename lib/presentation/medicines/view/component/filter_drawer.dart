import 'package:ayursh/domain/constants.dart';
import 'package:ayursh/domain/util/size_utils.dart';
import 'package:ayursh/presentation/medicines/models/get_product_model.dart';
import 'package:ayursh/presentation/widget/api_state_widgets.dart';
import 'package:ayursh/presentation/widget/custom_button.dart';
import 'package:ayursh/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../view_model/medicines_vm.dart';

class FilterDrawer extends StatefulWidget {
  final PagingController<int, ProductResult> pagingController;
  const FilterDrawer({required this.pagingController});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      width: width(context, 0.85),
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 16),
                      child: Text(
                        "Filter",
                        style: style16500Secondary,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 4,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: CustomApiUi(
                state: context.watch<MedicinesVM>().getMenuListApiState,
                error: context.watch<MedicinesVM>().errorGetMenuList,
                hidePullToRefresh: true,
                onTryAgain: () => context.read<MedicinesVM>().getMenuList(),
                customWidget: buildUi(),
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(vertical: 12).copyWith(top: 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  w(16),
                  Expanded(
                    child: customButton(
                      onTap: () {
                        context.read<MedicinesVM>().onTapClearFilter();
                        Navigator.pop(context);
                        widget.pagingController.refresh();
                      },
                      isOutLine: true,
                      height: 40,
                      name: "Clear",
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      fontSize: 14,
                    ),
                  ),
                  w(16),
                  Expanded(
                    child: customButton(
                      onTap: () {
                        Navigator.pop(context);
                        widget.pagingController.refresh();
                      },
                      height: 40,
                      name: "Apply",
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      fontSize: 14,
                    ),
                  ),
                  w(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildUi() {
    return ListView(
      padding: paddingH,
      children: [
        customFilterComponent(
          title: "Shop By Manufacturer",
          list: context.watch<MedicinesVM>().manufacturerList,
          onSelect: (e) {
            context.read<MedicinesVM>().onTapManufacturerSelect(e);
          },
        ),
        customFilterComponent(
          title: "Shop By Medicines",
          list: context.watch<MedicinesVM>().medicinesList,
          onSelect: (e) {
            context.read<MedicinesVM>().onTapMedicinesSelect(e);
          },
        ),
        customFilterComponent(
          title: "Shop By Category",
          list: context.watch<MedicinesVM>().categoryList,
          onSelect: (e) {
            context.read<MedicinesVM>().onTapCategorySelect(e);
          },
        ),
      ],
    );
  }

  customFilterComponent({required String title, required List<FilterModel> list, required Function(FilterModel e) onSelect}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        h(12),
        Text(
          title,
          style: style14600Secondary,
        ),
        h(12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            ...list.map(
              (e) {
                bool isSelected = e.isSelected;

                return customInkWellColor(
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    onSelect(e);
                  },
                  child: Ink(
                    height: 27,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: isSelected ? primaryGreenColor : grey300Color),
                      borderRadius: BorderRadius.circular(6),
                      color: isSelected ? primaryGreenColor : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          e.title ?? "",
                          style: (isSelected ? style12400White : style12400Secondary),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        h(12),
      ],
    );
  }
}
