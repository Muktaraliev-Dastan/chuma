import 'package:chum2/src/common/routes/router.dart';
import 'package:flutter/material.dart';

//либы
import 'package:flutter_bloc/flutter_bloc.dart';

//блоки
import 'package:chum2/src/features/home/bloc/home_products.dart';
import 'package:chum2/src/features/authentication/bloc/authentication_bloc.dart';

//репозитории
import 'package:chum2/src/common/data/repositories/product_repository/product_repository.dart';
import 'package:chum2/src/features/authentication/data/authentication_repository.dart';

//константы
import 'package:chum2/src/common/widgets/constants/theme.dart';


///главный класс приложения
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => AuthenticationBLoC(
        authenticationRepository: AuthenticationRepositoryImpl(),
      ),
      child: BlocProvider(
        lazy: false,
        create: (context) {
          return HomeProductBloc(productRepository: ProductRepository())
            ..add(HomeProductsRequested());
        },
        child: MaterialApp.router(
          routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Chum Caphe',
          theme: AppCustomTheme.of(context),
        ),
      ),
    );
  }
}
