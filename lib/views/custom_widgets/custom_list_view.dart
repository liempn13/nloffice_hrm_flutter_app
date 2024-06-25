import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: title,
        backgroundColor: Colors.brown[300],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Action for back button
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                showSearchBar
                    ? TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(1),
                      ),
                SizedBox(height: 10),
                DefaultTabController(
                    length: tabLength,
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
                        tabs: tabList!)),
                Expanded(
                    child: TabBarView(
                  children: [],
                ))
              ],
            ),
          ),
        ],
      ),
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

  //get listview
  Widget _getListView() {
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
}
