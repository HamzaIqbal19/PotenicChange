import 'package:flutter/material.dart';

class animation extends StatefulWidget {
  @override
  _animationState createState() => _animationState();
}

class _animationState extends State<animation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isBottomSheetVisible = false;
  bool _isPopUpVisible = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleBottomSheet() {
    setState(() {
      _isBottomSheetVisible = !_isBottomSheetVisible;
      if (_isBottomSheetVisible)
        _animationController.forward();
      else
        _animationController.reverse();
    });
  }

  void _togglePopUp() {
    setState(() {
      _isPopUpVisible = !_isPopUpVisible;
      if (_isPopUpVisible)
        _animationController.forward();
      else
        _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transition Example'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _toggleBottomSheet,
              child: Text('Toggle Bottom Sheet'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _togglePopUp,
              child: Text('Toggle Pop-up'),
            ),
            SizedBox(height: 16.0),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(0.0, 100.0 * (1.0 - _animation.value)),
                    child: child,
                  ),
                );
              },
              child: Visibility(
                visible: _isBottomSheetVisible,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Colors.blue,
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Bottom Sheet',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.scale(
                    scale: _animation.value,
                    child: child,
                  ),
                );
              },
              child: Visibility(
                visible: _isPopUpVisible,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Pop-up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
