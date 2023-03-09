import 'package:cat_breeds/domain/entities/cat_entity.dart';
import 'package:cat_breeds/ui/pages/widgets/appbar_cat.dart';
import 'package:cat_breeds/ui/pages/widgets/detail_indicator.dart';
import 'package:cat_breeds/ui/pages/widgets/detail_info.dart';
import 'package:cat_breeds/ui/pages/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context)?.settings.arguments! as Map;
    Cat cat = arguments['cat'];

    return Scaffold(
      appBar: AppBarCat(text: cat.name!,),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height:size.height,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [             
                SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Center(
                    child: FadeInImage(
                      image: NetworkImage(cat.imageCat!),
                      fit: BoxFit.fill,
                      placeholder: const AssetImage("assets/images/loading.png"),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/error.png',
                          fit: BoxFit.fitWidth
                        );
                      },
                    ),
                  ),
                ),
                  
                SizedBox(
                  height:size.height * 0.4,
                  child: SingleChildScrollView(
                    child: Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min, 
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                                    
                          const SizedBox(height: 10),
                          
                          TextWidget(text: cat.description!),
                                  
                          const SizedBox(height: 5),
                        
                          DetailInfo(title: "Origin", text: cat.origin!),
                          DetailInfo(title: "Life Span", text: '${cat.lifeSpan} years'),
                                        
                          const SizedBox(height: 5),
                        
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const TextWidget(text: "Hypoallergenic"),
                              cat.hypoallergenic == 0 
                                ? const TextWidget(text: "No") 
                                : const TextWidget(text: "Yes"),
                            ],
                          ),
                                        
                          const SizedBox(height: 5),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width * 0.3,
                                child: const TextWidget(text: "Temperament")
                              ),
                              Expanded(
                                child: Text(
                                  cat.temperament!, 
                                  softWrap: true, 
                                  maxLines: 3, 
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    fontFamily: 'TitilliumWeb', 
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                )
                              ),
                            ],
                          ),
                        
                          const SizedBox(height: 5,),
                        
                          DetailIndicator(title: "Intelligence", value: cat.intelligence!),
                          DetailIndicator(title: "Adaptability", value: cat.adaptability!),
                          DetailIndicator(title: "Affection Level", value: cat.affectionLevel!),
                          DetailIndicator(title: "Health Issues", value: cat.healthIssues!),
                          DetailIndicator(title: "Social Needs", value: cat.socialNeeds!),
                          DetailIndicator(title: "Dog Friendly", value: cat.dogFriendly!),
                          DetailIndicator(title: "Stranger Friendly", value: cat.strangerFriendly!),
                          DetailIndicator(title: "Child Friendly", value: cat.childFriendly!),
                                      
                        ],),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      )
    );

  }
}