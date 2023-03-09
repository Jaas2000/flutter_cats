import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_breeds/domain/entities/cat_entity.dart';
import 'package:cat_breeds/ui/pages/widgets/detail_info.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CatCard extends StatelessWidget {
  final Cat cat;
  
  const CatCard({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, 'detail',
            arguments: {'cat': cat});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), 
          color: Colors.teal[100]
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),

        child: Column(
          children: [

            DetailInfo(title: cat.name!, text: "Mas..."),

            const SizedBox(height: 8),
            
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                imageUrl: cat.imageCat!,
                imageBuilder: (context, imageProvider) => Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: Lottie.asset(
                    'assets/lotties/loading.json',
                    width: 300, 
                    height: 300,
                    fit: BoxFit.fill
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.cancel_presentation_outlined,
                  size: 300.0,
                ),
              ),
            ),

            const SizedBox(height: 8),

            DetailInfo(title: 'Origin: ${cat.origin}', text: 'Intelligence: ${cat.intelligence}')
          ],
        ),
      ),
    );
  }
}