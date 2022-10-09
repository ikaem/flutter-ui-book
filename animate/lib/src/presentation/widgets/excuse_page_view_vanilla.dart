import 'package:animate/src/models/excuse.dart';
import 'package:animate/src/presentation/widgets/excuse_card.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';

class ExcusePageViewVanilla extends StatelessWidget {
  const ExcusePageViewVanilla({
    super.key,
    this.excuses = const [],
    this.currentExcuse = 0,
  });

  final List<Excuse> excuses;
  final int currentExcuse;

  @override
  Widget build(BuildContext context) {
    // this could be null, or it could throw error becuase out of bounds if emtpy excuse
    // final selectedExcuse = excuses[currentExcuse];
    final selectedExcuse = excuses.isNotEmpty ? excuses[currentExcuse] : null;

// this is with the package
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
        // multiple example - when do these happen
        // aha, so the second animation always defines the exit animation - it will be used only for exit
        // so in this example, we should have two animations on the exitz
        return FadeTransition(
          opacity: Tween<double>(
            begin: 1.0,
            end: 0.0,
          ).animate(secondaryAnimation),
          child: ScaleTransition(
            scale: Tween<double>(
              // max value at begin since we know that on exit we will have an excuse, so value is max
              begin: 1.0,
              end: 0.0,
            ).animate(secondaryAnimation),
            child: SlideTransition(
              position: Tween<Offset>(
                // also note that we do have to end at the screen after the animation ends
                end: Offset.zero,
                begin: const Offset(
                  1.5,
                  0.0,
                ),
              ).animate(primaryAnimation),
              child: child,
            ),
          ),
        );

        // just two animations - entry and exit
        // return SlideTransition(
        //   // note the offset here how it is specified - nothing is done directly
        //   position: Tween<Offset>(
        //     begin: Offset.zero,
        //     end: const Offset(1.5, 0.0),
        //   ).animate(secondaryAnimation),
        //   // we are setting child on the slide transition
        //   child: FadeTransition(
        //     opacity: Tween<double>(
        //       begin: 0.0,
        //       end: 1.0,
        //     ).animate(primaryAnimation),
        //     // thios is child provider by the transion builder
        //     child: child,
        //   ),
        // );
      },
      child: ExcuseCard(
        key: ValueKey(selectedExcuse!.id),
        excuse: selectedExcuse,
      ),
    );

// this is with implicit, purpose built widget built into flutter for handling animations easier
    // return AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 500),

    //   // this is optional transiton vuilder - default is cross fade
    //   // transitionBuilder: (Widget child, Animation<double> animation) {
    //   //   log("this is animation value: ${animation.value}"); // from 1 to 0 or other way around
    //   //   return ScaleTransition(
    //   //     scale: animation,
    //   //     child: child,
    //   //   );
    //   // },
    //   child: ExcuseCard(
    //     key: ValueKey(selectedExcuse!.id),
    //     excuse: selectedExcuse,
    //   ),
    // );

    // return ExcuseCard(
    //     key: ValueKey(selectedExcuse!.id), excuse: selectedExcuse);
  }
}
