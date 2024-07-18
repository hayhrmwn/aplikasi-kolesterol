import 'package:flutter/material.dart';

class Toggle extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;

  const Toggle({Key? key, required this.isOn, required this.onToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Show Daily Average',
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Container(
            width: 40,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isOn ? const Color(0xFF41A190) : Colors.grey[300],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  left: isOn ? 20 : 0,
                  right: isOn ? 0 : 20,
                  child: InkWell(
                    onTap: onToggle,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: (child, animation) {
                        return RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(animation),
                          child: child,
                        );
                      },
                      child: isOn
                          ? Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.white,
                              key: UniqueKey(),
                            )
                          : Icon(
                              Icons.circle,
                              size: 20,
                              color: Colors.grey[600],
                              key: UniqueKey(),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
