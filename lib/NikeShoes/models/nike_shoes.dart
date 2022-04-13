
class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeShoes({
    required this.model,
    required this.oldPrice,
    required this.currentPrice,
    required this.images,
    required this.modelNumber,
    required this.color,
  });
}

//Lista de zapatillas
final shoes = <NikeShoes>[
  NikeShoes(
    model: 'Nike Air MAX 200',
    oldPrice: 39.967,
    currentPrice: 31.955,
    images: [
      'assets/nike_air_max_200_grises/Max1.png',
      'assets/nike_air_max_200_grises/Max2.png',
      'assets/nike_air_max_200_grises/Max3.png',
    ],
    modelNumber: 200,
    color: 0xfff6f6f6,
  ),

//*	--------------- *
  NikeShoes(
    model: 'Nike Air Zoom Pegasus 38',
    oldPrice: 26.625,
    currentPrice: 21.999,
    images: [
      'assets/nike_air_zoom_pegasus_rojas/Pegasus1.png',
      'assets/nike_air_zoom_pegasus_rojas/Pegasus2.png',
      'assets/nike_air_zoom_pegasus_rojas/Pegasus3.png',
      'assets/nike_air_zoom_pegasus_rojas/Pegasus4.png',
    ],
    modelNumber: 38,
    color: 0xffFEEFEF,
  ),
//*	--------------- *
  NikeShoes(
    model: 'Nike Jordan Retro 4',
    oldPrice: 36.455,
    currentPrice: 30.555,
    images: [
      'assets/nike_jordan_4_retro_amarillas/JordanRetro1.png',
      'assets/nike_jordan_4_retro_amarillas/JordanRetro2.png',
      'assets/nike_jordan_4_retro_amarillas/JordanRetro3.png',
    ],
    modelNumber: 4,
    color: 0xffFCF5EB,
  ),

//*	--------------- *
  NikeShoes(
    model: 'Nike MD runner 2',
    oldPrice: 17.599,
    currentPrice: 14.999,
    images: [
      'assets/nike_md_runner_2_azules/MDRunner1.png',
      'assets/nike_md_runner_2_azules/MDRunner2.png',
      'assets/nike_md_runner_2_azules/MDRunner3.png',
      'assets/nike_md_runner_2_azules/MDRunner4.png',
    ],
    modelNumber: 2,
    color: 0xffEDF3FE,
  ),
];
