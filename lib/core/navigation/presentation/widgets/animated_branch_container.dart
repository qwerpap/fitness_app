import 'package:fitness_app/core/navigation/constants/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

/*
Я не смог понять, какой из вариантов создания анимированного StatefulShellBranch
потенциально будет оптимизированнее, поэтому пока оставлю и этот виджет.

Надо будет еще протестировать с ипользованием DevTools когда экраны будут заполненны данными и работать с сетью.
На том этапе обнаружатся нюансы и можно будет наверняка решить.

Что бы использовать этот медот, надо в body ScaffoldWithNavBar вставить
  AnimatedBranchContainer(
    currentIndex: widget.navigationShell.currentIndex,
    children: widget.children,
  ),
  
  И соответственно избавиться от PageView и его контроллера.
*/

class AnimatedBranchContainer extends StatelessWidget {
  const AnimatedBranchContainer({
    super.key,
    required this.currentIndex,
    required this.children,
  });

  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.mapIndexed(
        (int index, Widget navigator) {
          return AnimatedSlide(
            offset: currentIndex == index
                ? const Offset(0, 0)
                : index > currentIndex
                    ? const Offset(1, 0)
                    : const Offset(-1, 0),
            duration: NavigationConstants.swipeAnimationDuration,
            curve: NavigationConstants.swipeAnimationCurve,
            child: _branchNavigatorWrapper(index, navigator),
          );
        },
      ).toList(),
    );
  }

  Widget _branchNavigatorWrapper(int index, Widget navigator) => IgnorePointer(
        ignoring: index != currentIndex,
        child: TickerMode(
          enabled: index == currentIndex,
          child: navigator,
        ),
      );
}
