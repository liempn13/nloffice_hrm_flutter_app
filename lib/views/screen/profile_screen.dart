import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
              pinned: true, delegate: CustomSliverPersistentHeaderDelegate(onActionTap: (){}))
        ],
      ),
    );
  }
}

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final double _maxExtent = 160;
  final VoidCallback onActionTap;

  CustomSliverPersistentHeaderDelegate({
    required this.onActionTap,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    debugPrint(shrinkOffset.toString());
    return Container(
      color: Colors.cyanAccent,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(
                //little padding
                -(shrinkOffset > _maxExtent - 20
                        ? _maxExtent - 20
                        : shrinkOffset) /
                    _maxExtent,
                0),
            child: const Text('Panahon'),
          ),

          // here provide actions
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: onActionTap,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(
      covariant CustomSliverPersistentHeaderDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
