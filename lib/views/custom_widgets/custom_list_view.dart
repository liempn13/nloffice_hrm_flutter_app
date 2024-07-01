import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:nloffice_hrm/views/custom_widgets/custom_text_form_field.dart';
import 'package:nloffice_hrm/views/custom_widgets/ui_spacer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CustomListView extends StatelessWidget {
  //
  final ScrollController? scrollController;
  final Widget? title;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final List<dynamic> dataSet;
  final bool isLoading;
  final bool hasError;
  final bool justList;
  final bool reversed;
  final int tabLength;
  final List<Tab>? tabList;
  final bool noScrollPhysics;
  final bool showSearchBar;
  final bool showTabBar;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  //
  final bool canRefresh;
  final RefreshController? refreshController;
  final Function? onRefresh;
  final Function? onLoading;
  final bool canPullUp;
  final double? separator;
  const CustomListView({
    required this.dataSet,
    this.scrollController,
    this.showSearchBar = false,
    this.showTabBar = false,
    this.title,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.isLoading = false,
    this.hasError = false,
    this.justList = true,
    this.reversed = false,
    this.noScrollPhysics = false,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    this.separatorBuilder,
    this.padding,
    this.tabLength = 0,
    this.tabList,
    //
    this.canRefresh = false,
    this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.canPullUp = false,
    this.separator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              showSearchBar
                  ? CustomTextFormField(
                      maxLines: 3,
                      hintText: 'search'.tr(),
                      prefixIcon: Icon(Icons.search),
                    )
                  //  border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20),
                  //         ),
                  : UiSpacer.emptySpace(),
              showTabBar ? tabView() : UiSpacer.emptySpace(),
              Expanded(
                  child: TabBarView(
                children: [],
              )),
              listView()
            ],
          ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return this.justList
  //       ? _getBody()
  //       : VStack(
  //           [
  //             this.title ?? UiSpacer.emptySpace(),
  //             _getBody(),
  //           ],
  //           crossAlignment: CrossAxisAlignment.start,
  //         );
  // }

  // Widget _getBody() {
  //   final contentBody = this.isLoading
  //       ? this.loadingWidget ?? LoadingShimmer()
  //       : this.hasError
  //           ? this.errorWidget ?? EmptyState(description: "There is an error")
  //           : (this.dataSet.isEmpty)
  //               ? this.emptyWidget ?? UiSpacer.emptySpace()
  //               : this.justList
  //                   ? _getListView()
  //                   : Expanded(
  //                       child: _getListView(),
  //                     );

  //   return this.canRefresh
  //       ? SmartRefresher(
  //           scrollDirection: this.scrollDirection,
  //           enablePullDown: true,
  //           enablePullUp: canPullUp,
  //           controller: this.refreshController!,
  //           onRefresh: this.onRefresh != null ? () => this.onRefresh!() : null,
  //           onLoading: this.onLoading != null ? () => this.onLoading!() : null,
  //           child: contentBody,
  //         )
  //       : contentBody;
  // }

  //Listview
  Widget listView() {
    return ListView.separated(
      controller: this.scrollController,
      padding: this.padding,
      shrinkWrap: true,
      reverse: this.reversed,
      physics: this.noScrollPhysics ? NeverScrollableScrollPhysics() : null,
      scrollDirection: this.scrollDirection,
      itemBuilder: this.itemBuilder,
      itemCount: this.dataSet.length,
      separatorBuilder: this.separatorBuilder ??
          (context, index) => this.scrollDirection == Axis.vertical
              ? UiSpacer.verticalSpace(space: separator ?? 20.0)
              : UiSpacer.horizontalSpace(space: separator ?? 20.0),
    );
  }

  //Tab
  Widget tabView() {
    return DefaultTabController(
        length: this.tabLength,
        child: TabBar(
            labelColor: Colors.white,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                  )
                ]),
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: this.tabList!));
  }
}
