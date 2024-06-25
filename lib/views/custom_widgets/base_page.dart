import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nloffice_hrm/constant/internet_connect.dart';
import 'package:nloffice_hrm/views/custom_widgets/ui_spacer.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:nloffice_hrm/views/screen/no_connection_page.dart';
import 'package:provider/provider.dart';

import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final bool showCart;
  final Function? onBackPressed;
  final String? title;
  final Widget body;
  final Widget? bottomSheet;
  final Widget? fab;
  final bool isLoading;
  final bool extendBodyBehindAppBar;
  final double? elevation;
  final Color? appBarItemColor;
  final Color? backgroundColor;
  final Color? appBarColor;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final List<Widget>? actions;
  final AppBar? appBar;

  BasePage({
    this.showAppBar = false,
    this.showLeadingAction = false,
    this.leading,
    this.showCart = false,
    this.onBackPressed,
    this.title = "",
    required this.body,
    this.bottomSheet,
    this.fab,
    this.isLoading = false,
    this.appBarColor,
    this.elevation,
    this.extendBodyBehindAppBar = false,
    this.appBarItemColor,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.actions,
    this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    context.watch<ConnectivityProvider>().initialise(context);

    final isConnected = context.watch<ConnectivityProvider>().isConnected;
    return SafeArea(
      child: isConnected != true
          ? const NoInternetScreen()
          : Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: widget.backgroundColor ??
                  Theme.of(context).colorScheme.surface,
              extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
              appBar: widget.showAppBar
                  ? widget.appBar ??
                      AppBar(
                        actions: widget.actions,
                        backgroundColor:
                            widget.appBarColor ?? context.primaryColor,
                        automaticallyImplyLeading: widget.showLeadingAction,
                        elevation: widget.elevation,
                        leading: widget.showLeadingAction
                            ? widget.leading ??
                                IconButton(
                                  icon: const Icon(
                                    FlutterIcons.arrow_right_fea,
                                  ),
                                  onPressed: (widget.onBackPressed != null)
                                      ? () => widget.onBackPressed!()
                                      : () => Navigator.pop(context),
                                )
                            : null,
                        title: Text(
                          "${widget.title}",
                        ),
                      )
                  : null,
              body: VStack(
                [
                  //
                  widget.isLoading
                      ? LinearProgressIndicator()
                      : UiSpacer.emptySpace(),
                  //
                  widget.body.expand(),
                ],
              ),
              bottomNavigationBar: widget.bottomNavigationBar,

              bottomSheet: widget.bottomSheet,
              floatingActionButton: widget.fab,
              // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            ),
    );
  }
}
