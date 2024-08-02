import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'package:lanarsnavbarflutter/body_home.dart';
import 'package:lanarsnavbarflutter/theme/app_theme.dart';
import 'package:lanarsnavbarflutter/theme/custom_colors_theme.dart';
import 'package:lanarsnavbarflutter/tooltip/clipper_border_painter.dart';
import 'package:lanarsnavbarflutter/tooltip/nav_bar_clipper.dart';
import 'package:lanarsnavbarflutter/tooltip/widget_size.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> childrenItem = [
    Container(height: 40, width: 100, color: Colors.yellow),
    Container(height: 40, width: 100, color: Colors.blue),
    Container(height: 40, width: 100, color: Colors.orange),
  ];

  final List<Widget> bodies = [
    BodyHome(title: 'Zero'),
    BodyHome(title: 'One'),
    BodyHome(title: 'Two'),
    BodyHome(title: 'Three'),
    BodyHome(title: 'Four'),
    BodyHome(title: 'Five'),
    BodyHome(title: 'Six'),
    BodyHome(title: 'Seven'),
  ];

  final List<NavigatorItemModel> navigatorItem = [
    NavigatorItemModel(
      title: 'Home',
      // iconColor: Colors.white,
      titleStyle: TextStyle(fontSize: 12),
      child: Icon(
        Icons.wallet,
        color: Colors.white,
        size: 24,
      ),
      activeChild: Icon(
        Icons.wallet,
        color: Colors.green,
        size: 24,
      ),
    ),
    NavigatorItemModel(
      title: 'Market',
      icon: Icons.balcony_outlined,
      titleStyle: TextStyle(fontSize: 12),
      // iconColor: Colors.white,
    ),
    NavigatorItemModel(
      title: 'Instant Convert',
      // iconColor: Colors.white,
      titleStyle: TextStyle(fontSize: 12),
      width: 110,
    ),
    NavigatorItemModel(
      title: 'Earn',
      icon: Icons.earbuds_rounded,
      // iconColor: Colors.white,
      titleStyle: TextStyle(fontSize: 12),
    ),
    NavigatorItemModel(
      title: 'Wallet',
      icon: Icons.wallet,
      // iconColor: Colors.white,
      titleStyle: TextStyle(fontSize: 12),
    ),
  ];
  int index = 0;
  var isChildrenItemTapped = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.get(isLight: true),
      darkTheme: AppTheme.get(isLight: false),
      home: MyHomePage(
        title: 'Animated Navigation Bottom Bar',
        onTapItem: (value) {
          /* change navigator item text syle */
          isChildrenItemTapped = true;
          var fontWeight =
              isChildrenItemTapped ? FontWeight.bold : FontWeight.bold;
          if (value == 2) {
            navigatorItem[2] = NavigatorItemModel(
              title: 'Instant Convert 1',
              // iconColor: Colors.white,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: fontWeight,
              ),
              width: 112,
            );
          } else if (value == 3) {
            navigatorItem[2] = NavigatorItemModel(
              title: 'Auto Invest',
              // iconColor: Colors.white,
              titleStyle: TextStyle(
                fontSize: 12,
                fontWeight: fontWeight,
              ),
              width: 112,
            );
          } else if (value == 4) {
            navigatorItem[2] = NavigatorItemModel(
              title: 'Trade',
              // iconColor: Colors.white,
              titleStyle: TextStyle(fontSize: 12, fontWeight: fontWeight),
              width: 112,
            );
          }
          setState(() {
            index = value;
          });
          print(index);
        },
        onTapMenu: (value) {
          isChildrenItemTapped = false;
          navigatorItem[2] = navigatorItem[2].copyWith(
            titleStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          );
          setState(() {
            index = value;
          });
          print(index);
        },
        childrenItemMenu: childrenItem,
        body: bodies[index],
        navigatorItem: navigatorItem,
      ),
      // home: ManualBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
    required this.title,
    required this.onTapItem,
    required this.onTapMenu,
    required this.childrenItemMenu,
    required this.body,
    required this.navigatorItem,
  }) : super(key: key);

  final String title;
  final Function(int) onTapItem;
  final Function(int) onTapMenu;
  final List<Widget> childrenItemMenu;
  final List<NavigatorItemModel> navigatorItem;
  final Widget body;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var _bottomNavIndex = 0;
  var _isItemTapped = false;

  late AnimationController _controller;
  late Animation<double> _animation;
  Size? childSize;

  GlobalKey targetKey = GlobalKey();
  bool isTooltipVisible = false;
  Offset targetPosition = Offset.zero;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _setRelativePosition();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
        reverseCurve: Curves.linear,
      ),
    );
  }

  void _setRelativePosition() {
    final RenderBox? renderBox =
        targetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        targetPosition = position;
        isTooltipVisible = true;
      });
    }
  }

  void _setVisibility(bool value) async {
    if (value) {
      isVisible = value;
      _controller.forward();
    } else {
      await _controller.reverse();
      isVisible = value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColorsTheme>()!;
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Stack(
            children: [
              /* this will be the child from parent that call this class */
              // NavigationScreen(iconList[_bottomNavIndex]),
              widget.body,
              /*  */
              Visibility(
                visible: isVisible,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, (1 - _animation.value) * 200),
                child: Stack(
                  children: [
                    Visibility(
                      visible: isVisible,
                      child: Positioned(
                        left: 15,
                        right: 15,
                        bottom: (MediaQuery.of(context).size.height -
                                targetPosition.dy) +
                            2.6,
                        child: Align(
                          alignment: Alignment(0, 0.562),
                          child: CustomPaint(
                            painter: ClipperBorderPainter(),
                            child: Container(
                              height: (childSize?.height ?? 0) + 3,
                              width: (childSize?.width ?? 0) + 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Positioned(
                        left: 16,
                        right: 16,
                        bottom: (MediaQuery.of(context).size.height -
                                targetPosition.dy) +
                            4,
                        child: ClipPath(
                          clipper: NavBarClipper(),
                          child: WidgetSize(
                            onChange: (value) {
                              setState(() {
                                childSize = value;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                // direction: Axis,
                                children: List.generate(
                                    widget.childrenItemMenu.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      _setVisibility(false);
                                      setState(() {
                                        _isItemTapped = true;
                                      });
                                      widget.onTapItem(index + 2);
                                    },
                                    child: widget.childrenItemMenu[index],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Visibility(
            visible: !isVisible,
            child: Container(
              padding: const EdgeInsets.only(
                top: 18,
                // left: 18,
                // right: 18,
              ),
              height: 70,
              // width: 70,
              child: FittedBox(
                key: targetKey,
                child: FloatingActionButton(
                  splashColor: Colors.transparent,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.brightness_3,
                    color: AppTheme.colorGray,
                  ),
                  onPressed: () {
                    _setVisibility(true);
                    _setRelativePosition();
                  },
                ),
              ),
            ),
          ),
          Visibility(
            visible: isVisible,
            child: Container(
              padding: const EdgeInsets.only(
                top: 18,
                // left: 18,
                // right: 18,
              ),
              height: 70,
              // width: 70,
              child: FittedBox(
                child: FloatingActionButton(
                  splashColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.close,
                    color: AppTheme.colorGray,
                  ),
                  onPressed: () {
                    _setVisibility(false);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        isTooltipActive: isVisible,
        itemCount: widget.navigatorItem.length,
        height: 62,
        gapWidth: 0,
        tabBuilder: (int index, bool isActive) {
          if (_isItemTapped) isActive = false;

          return widget.navigatorItem[index].copyWith(
            isActive: isActive,
            iconColor: colors.notActiveNavigationBarColor,
            iconActiveColor: colors.activeNavigationBarColor,
          );
        },
        backgroundColor: colors.bottomNavigationBarBackgroundColor,
        activeIndex: _bottomNavIndex,
        splashColor: colors.activeNavigationBarColor,
        notchSmoothness: NotchSmoothness.defaultEdge,
        splashRadius: 0,
        notchMargin: 1,
        scaleFactor: 0.1,
        gapLocation: GapLocation.none,
        // leftCornerRadius: 32,
        // rightCornerRadius: 32,
        onTap: (index) {
          /* not tap mid */
          var temp = index;
          var isThroughMid = index > widget.childrenItemMenu.length + 1 ~/ 2;
          if (isThroughMid) temp += widget.childrenItemMenu.length - 1;
          if (widget.navigatorItem.length % 2 == 1 &&
              widget.navigatorItem.length ~/ 2 == index) {
            return;
          }
          widget.onTapMenu(temp);
          setState(() {
            _isItemTapped = false;
            _bottomNavIndex = index;
          });
        },
        // hideAnimationController: _hideBottomBarAnimationController,
        shadow: BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.black.withOpacity(0.24),
        ),
      ),
    );
  }
}
