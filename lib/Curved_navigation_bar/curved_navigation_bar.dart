import 'package:flutter/material.dart';
import 'package:login_page/Constants/app_colors.dart';
import 'package:login_page/Constants/app_constants.dart';
import 'package:login_page/Curved_navigation_bar/nav_button.dart';
import 'package:login_page/Curved_navigation_bar/nav_custom_painter.dart';

typedef _LetIndexPage = bool Function(int value);

class TabItem {
  String iconUrl;
  String title;

  TabItem(this.iconUrl, this.title);
}

class CurvedNavigationBar extends StatefulWidget {
  final List<TabItem> items;
  final int index;
  final Color? buttonBackgroundColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final ValueChanged<int>? onTap;
  final _LetIndexPage letIndexChange;
  final Curve animationCurve;
  final Duration animationDuration;
  final double barHeight;
  final double iconHeight;

  CurvedNavigationBar({
    Key? key,
    required this.items,
    this.index = 0,
    this.buttonBackgroundColor,
    this.foregroundColor,
    this.backgroundColor = Colors.transparent,
    this.iconColor,
    this.onTap,
    _LetIndexPage? letIndexChange,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.barHeight = 64.0,
    this.iconHeight = 24.0,
  })  : letIndexChange = letIndexChange ?? ((_) => true),
        assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= barHeight && barHeight <= 75.0),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  late double _startingPos;
  int _endingIndex = 0;
  late double _pos;
  double _buttonHide = 0;
  late String _icon;
  late AnimationController _animationController;
  late int _length;

  @override
  void initState() {
    super.initState();
    _icon = widget.items[widget.index].iconUrl;
    _length = widget.items.length;
    _pos = widget.index / _length;
    _startingPos = widget.index / _length;
    _animationController = AnimationController(vsync: this, value: _pos);
    _animationController.addListener(() {
      setState(() {
        _pos = _animationController.value;
        final endingPos = _endingIndex / widget.items.length;
        final middle = (endingPos + _startingPos) / 2;
        if ((endingPos - _pos).abs() < (_startingPos - _pos).abs()) {
          _icon = widget.items[_endingIndex].iconUrl;
        }
        _buttonHide =
            (1 - ((middle - _pos) / (_startingPos - middle)).abs()).abs();
      });
    });
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _startingPos = _pos;
      _endingIndex = widget.index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Theme.of(context).primaryColor.withOpacity(0.5);
    return Container(
      color: widget.backgroundColor ?? Theme.of(context).backgroundColor,
      height: widget.barHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Positioned(
            bottom: -40 - (64.0 - (widget.barHeight)),
            left: Directionality.of(context) == TextDirection.rtl
                ? null
                : _pos * size.width,
            right: Directionality.of(context) == TextDirection.rtl
                ? _pos * size.width
                : null,
            width: size.width / _length,
            child: Center(
              child: Transform.translate(
                offset: Offset(
                  0,
                  -(1 - _buttonHide) * 80,
                ),
                child: Material(
                  color: widget.buttonBackgroundColor ?? AppColors.primaryColor,
                  type: MaterialType.circle,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(_icon,
                        color: Colors.white, height: widget.iconHeight),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (64.0 - widget.barHeight),
            child: CustomPaint(
              painter: NavCustomPainter(
                  _pos,
                  _length,
                  widget.foregroundColor ?? AppColors.primaryColor!,
                  Directionality.of(context)),
              child: Container(
                height: widget.barHeight,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0 - (64.0 - widget.barHeight),
            // ignore: sized_box_for_whitespace
            child: Container(
                height: 64.0,
                child: Row(
                    children: widget.items.map((item) {
                  return NavButton(
                    onTap: _buttonTap,
                    position: _pos,
                    length: _length,
                    // index: widget.index,
                    index: widget.items.indexOf(item),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(item.iconUrl,
                            color: widget.iconColor ??
                                Theme.of(context).primaryColor,
                            height: widget.iconHeight),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item.title,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }).toList())),
          ),
        ],
      ),
    );
  }

  void setPage(int index) {
    _buttonTap(index);
  }

  void _buttonTap(int index) {
    if (!widget.letIndexChange(index)) {
      return;
    }
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    final newPosition = index / _length;
    setState(() {
      _startingPos = _pos;
      _endingIndex = index;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    });
  }
}
