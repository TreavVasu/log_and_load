import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:loginpage/screens/Workstation.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}




class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);

    animation = Tween<double>(begin: 0, end: 2 * math.pi)
        .chain(CurveTween(curve: Curves.bounceIn))
        .animate(curvedAnimation);
     /* ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
*/
    animController.forward();
  }

  /*
  * Here is the place that serves as Boilerplate code
  * as one can believe it to be
  * you just have to change the body element by the class
  * which you are interested in calling
  * weather it be
  *
  * Defaults like :
  * ImageRotation()->FadeTransition(angle->opacity)
  * ImageRotation()->SizeTransition(angle->sizefactor)
  * ImageRotation()->RotationTransition(angle->turns)
  *
  * replacing the child element gives the animation
  * to that element which is passed onto child
  *
  * */
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ImageRotation(
          child: ImageAnim(animation: animation,),
          angle: animation,
          //axis: Axis.horizontal,
        )
    );
  }

  void dispose() {
    animController.dispose();
    super.dispose();
  }
}

/*
* Here Resides the animation Builder Implementing it is
* easy
* first block varibles taken
* second declared variables
* build method to call animation and specify the element to be
* in child
* */


class ImageRotation extends StatelessWidget {

  ImageRotation({
    @required this.child,
    @required this.angle,
  });

  final Widget child;
  final Animation<double> angle;


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context,child){
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}




class ImageAnim extends StatelessWidget {
  Animation<double> animation;


  ImageAnim({
    @required this.animation,
  });
  @override
  Widget build(BuildContext context) {

    return Container(
      child:Workstation() ,
      );
  }
}
