import 'package:cat_breeds/domain/entities/cat_entity.dart';
import 'package:cat_breeds/ui/bloc/page/page_bloc.dart';
import 'package:cat_breeds/ui/bloc/cat/cat_bloc.dart';
import 'package:cat_breeds/ui/pages/widgets/appbar_cat.dart';
import 'package:cat_breeds/ui/pages/widgets/cat_card.dart';
import 'package:cat_breeds/ui/pages/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  final List<Cat> cats;
  const HomePage({Key? key, required this.cats}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CatBloc? catBloc;
  PageBloc? pageBloc;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      catBloc = BlocProvider.of<CatBloc>(context);
      pageBloc = BlocProvider.of<PageBloc>(context);
      catBloc!.add(InitialCatEvent(cats: widget.cats));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const AppBarCat(text: "Cat Breeds",),
      body: BlocListener<CatBloc, CatState>(
        listener: (context, state) {
          if(state is SearchState){
            catBloc!.add(InitialCatEvent(cats: widget.cats));
            pageBloc!.add(FilteredCats(cats: state.cats));
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.07, 
                width: double.infinity,
                child: const SearchInput()
              ),

              SizedBox(
                height: size.height,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.cats.length,
                  itemBuilder: (BuildContext context, index) {
                    return CatCard(cat: widget.cats[index]);
                  }
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
