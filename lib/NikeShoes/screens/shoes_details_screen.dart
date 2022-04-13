import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:shoes_app2/NikeShoes/screens/components/components.dart';
import 'package:shoes_app2/NikeShoes/screens/screens.dart';


class NikeShoesDetails extends StatelessWidget {
  //!Datos de la zapatilla.
  final NikeShoes nikeshoes;

  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  //!Constructor.
  NikeShoesDetails({
    Key? key,
    required this.nikeshoes,
  }) : super(key: key);

//?Metodo que abre el ShoppingCart
  Future<void> _openShoppingCart(BuildContext context) async {
    //!El metodo cambia el valor de la variable.
    notifierButtonsVisible.value = false;
    //!Esperamos a la navegacion a ShoppingCart
    await Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      //!El PageRouteBuilder tiene 2 animaciones y el context
      pageBuilder: (_, animation1, __) {
        //!FadeTransition trabaja con opacity
        //!Podemos retornar
        return FadeTransition(
          opacity: animation1,
          child: ShoppingCart(
            shoes: nikeshoes,
          ),
        );
      },
    ));
    notifierButtonsVisible.value = true;
  }

  //!Widget Carousel
  Widget _buildCarousel(BuildContext context) {
    //!variable de medidas.
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.55,
      child: Stack(
        children: [
          //
          Positioned.fill(
            child: Hero(
              tag: 'background_${nikeshoes.model}',
              child: Container(
                color: Color(nikeshoes.color),
              ),
            ),
          ),
          //!Numero que aparece arriba.
          //!Posicionamiento
          Positioned.fill(
            left: 70,
            right: 70,
            bottom: 300,
            child: Hero(
              tag: 'number_${nikeshoes.model}',
              child: Material(
                color: Colors.transparent,
                child: ShakeTransition(
                  axis: Axis.vertical,
                  curve: Curves.elasticInOut,
                  duration: const Duration(milliseconds: 1400),
                  offset: 20,
                  child: FittedBox(
                    child: Text(
                      //!texto que muestra el numero arriba de la zapatilla.
                      nikeshoes.modelNumber.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.05),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //!cambio de imagenes de la zapatilla.
          PageView.builder(
            //!cantidad de la lista imagen de la clase NikeShoes.
            itemCount: nikeshoes.images.length,
            itemBuilder: ((context, index) {
              //?Una variable tiene almacenada logica?
              //!tomamos el indice del itemBuilder para generar la logica.
              //!la logica esta funcionando como tag unico del Hero.
              final tag = index == 0
                  ? 'image_${nikeshoes.model}'
                  : 'image_${nikeshoes.model}_$index';
              return Container(
                alignment: Alignment.center,
                child: ShakeTransition(
                  axis: Axis.vertical,
                  offset: 15,
                  curve: Curves.bounceIn,
                  //!otra vez utilizamos el index para generar logica.
                  //!dejamos de reproducir la animacion en la navegacion de la
                  //! lista de imagenes cuando es diferente de la primer imagen = 0.
                  duration: index == 0
                      ? const Duration(milliseconds: 1000)
                      : Duration.zero,
                  child: Hero(
                    tag: tag,
                    //!Las zapas.
                    child: Image.asset(
                      nikeshoes.images[index],
                      height: 250,
                      width: 250,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  } //!Widget Carousel

  //!Metodo Build de la pagina NikeShoesDetails
  @override
  Widget build(BuildContext context) {
    //!Metodo que da la orden de posicionarse luego de que se ejecute el metodo
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset(
            'assets/logonike/LOGONIKE.png',
            height: 28,
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //!CAROUSEL
                  _buildCarousel(context),

                  //!TEXTS
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ShakeTransition(
                          duration: const Duration(milliseconds: 1600),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                nikeshoes.model,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 19,
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '\$${nikeshoes.oldPrice.toString()}',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      '\$${nikeshoes.currentPrice.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const ShakeTransition(
                          child: Text(
                            'AVAILABLE SIZES',
                            style: TextStyle(fontSize: 11),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // _ShoesSizeItem
                        ShakeTransition(
                          axis: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              _ShoesSizeItem(text: '6'),
                              _ShoesSizeItem(text: '7'),
                              _ShoesSizeItem(text: '9'),
                              _ShoesSizeItem(text: '10'),
                              _ShoesSizeItem(text: '12'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'DESCRIPTION',
                          style: TextStyle(fontSize: 11),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //!FloatingButtons
            ValueListenableBuilder<bool>(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      FloatingActionButton(
                          heroTag: 'fav_1',
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      const Spacer(),
                      FloatingActionButton(
                        heroTag: 'fav_2',
                        backgroundColor: Colors.black,
                        child:
                            const Icon(CommunityMaterialIcons.shopping_outline),
                        onPressed: () {
                          _openShoppingCart(context);
                        },
                      ),
                    ],
                  ),
                ),
                valueListenable: notifierButtonsVisible,
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    left: 0,
                    right: 0,
                    bottom: value ? 0.0 : -kToolbarHeight * 1.5,
                    child: child!,
                  );
                }),
          ],
        ));
  }
}

class _ShoesSizeItem extends StatelessWidget {
  final String text;

  const _ShoesSizeItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Text(
        'US $text',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 11,
        ),
      ),
    );
  }
}
