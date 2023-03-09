import 'package:cat_breeds/ui/bloc/page/page_bloc.dart';
import 'package:cat_breeds/ui/pages/home_page.dart';
import 'package:cat_breeds/ui/pages/widgets/alerts.dart';
import 'package:cat_breeds/ui/pages/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  PageBloc? bloc;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc = BlocProvider.of<PageBloc>(context);
      bloc!.add(InitialPageEvent());
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FF),
      body: BlocConsumer<PageBloc, PageState>(
        listener: ((context, state) {
          if (state is ErrorState) {
            showError(context, "Error al cargar los datos");
          }
        }),
        builder: (context, state) {
          if (state is InitialState) {  
            return const Loader();
          }
          if (state is HomeState) {
            return HomePage(cats: state.cat);
          }
          return Container();
        },
      ),
    );
  }
}