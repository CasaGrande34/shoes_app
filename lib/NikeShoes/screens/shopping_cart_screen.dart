import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app2/NikeShoes/screens/screens.dart';


const _buttonSize = 170.0;
const _buttonCircularSize = 60.0;

class ShoppingCart extends StatefulWidget {
  final NikeShoes? shoes;

  const ShoppingCart({Key? key, this.shoes}) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart>
    with SingleTickerProviderStateMixin {
  //*	--------------- *
  late AnimationController _controller;
  late Animation _animationButton1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _animationButton1 = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          0.2,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildPanel() {
    final size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeIn,
      builder: (BuildContext context, double value, Widget? child) {
        return Transform.translate(
          offset: Offset(0.0, value * size.height * 0.6),
          child: child,
        );
      },
      child: Container(
        height: size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.shoes!.images.first,
                    height: 120,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        widget.shoes!.model,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        '\$${widget.shoes!.currentPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
        color: Colors.transparent,
        child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Stack(
                      children: [
                        _buildPanel(),
                        Positioned(
                          left: size.width * 0.3,
                          bottom: 40,
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                            builder: (BuildContext context, double value,
                                Widget? child) {
                              return Transform.translate(
                                offset: Offset(0.0, value * size.height * 0.6),
                                child: child,
                              );
                            },
                            child: InkWell(
                              onTap: () {
                                _controller.forward();
                              },
                              child: Container(
                                width: (_buttonSize * _animationButton1.value)
                                    .clamp(_buttonCircularSize, _buttonSize),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: const [
                                      Icon(CommunityMaterialIcons.shopping,
                                          color: Colors.white),
                                      SizedBox(width: 10),
                                      Text(
                                        'Agregar al carrito',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}
