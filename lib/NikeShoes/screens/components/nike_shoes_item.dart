import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import '../../models/nike_shoes.dart';

class NikeShoesItem extends StatefulWidget {
  final NikeShoes shoesItem;
  final VoidCallback onTap;

  const NikeShoesItem({
    Key? key,
    required this.shoesItem,
    required this.onTap,
  }) : super(key: key);

  @override
  State<NikeShoesItem> createState() => _NikeShoesItemState();
}

class _NikeShoesItemState extends State<NikeShoesItem>
    with SingleTickerProviderStateMixin {
  bool _isFav = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    //!No pude usar esta curva, no me deja enviarla como animate
    _curve = CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

    _colorAnimation =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _sizeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(tween: Tween(begin: 25.0, end: 40.0), weight: 50.0),
        TweenSequenceItem(tween: Tween(begin: 40.0, end: 25.0), weight: 50.0),
      ],
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          _isFav = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const itemHeight = 290.0;
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: SizedBox(
          height: itemHeight,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Hero(
                  tag: 'background_${widget.shoesItem.model}',
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(widget.shoesItem.color),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: (widget.shoesItem.modelNumber > 10)
                    ? const EdgeInsets.symmetric(horizontal: 10)
                    : const EdgeInsets.only(right: 50),
                child: Align(
                  alignment: (widget.shoesItem.modelNumber > 10)
                      ? Alignment.topCenter
                      : Alignment.topRight,
                  child: Hero(
                    tag: 'number_${widget.shoesItem.model}',
                    child: SizedBox(
                        height: itemHeight * 0.8,
                        child: Material(
                          color: Colors.transparent,
                          child: FittedBox(
                            child: Text(
                              widget.shoesItem.modelNumber.toString(),
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.05),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 90,
                height: itemHeight * 0.65,
                child: Hero(
                  tag: 'image_${widget.shoesItem.model}',
                  child: Image.asset(
                    widget.shoesItem.images.first,
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, _) {
                    return IconButton(
                      onPressed: () {
                        _isFav ? _controller.reverse() : _controller.forward();
                      },
                      icon: Icon(Icons.favorite, size: _sizeAnimation.value),
                      color: _colorAnimation.value,
                    );
                  },
                ),
              ),
              const Positioned(
                bottom: 33,
                right: 20,
                child: Icon(
                  CommunityMaterialIcons.shopping,
                  color: Colors.grey,
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.shoesItem.model,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$${widget.shoesItem.oldPrice.toString()}',
                        style: const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${widget.shoesItem.currentPrice.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
