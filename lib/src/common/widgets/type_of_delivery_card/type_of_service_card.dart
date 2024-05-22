///фреймворк
import 'package:flutter/material.dart';

///либы
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:l/l.dart';

///константы
import 'package:chum2/src/common/widgets/constants/theme.dart';

///внутреннние виджеты
import 'item_of_type_of_delivery_card.dart';

///сторонние виджеты
import 'package:chum2/src/common/widgets/custom_divider.dart';

//блоки
import 'package:chum2/src/features/authentication/bloc/authentication_bloc.dart';

//для тестов
import 'package:chum2/src/features/authentication/data/authentication_repository.dart';

//TODO: для тестов (использвал это как кнопки) переделал имплементацию но запутался, походу переделал не то
class TypeOfServiceCard extends StatefulWidget {
  const TypeOfServiceCard({Key? key}) : super(key: key);

  @override
  _TypeOfServiceCardState createState() => _TypeOfServiceCardState();
}

class _TypeOfServiceCardState extends State<TypeOfServiceCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    var authRep = AuthenticationRepositoryImpl();

    return Container(
      decoration: ShapeDecoration(
        shape: AppSizes.shapeBorderForElements,
        color: _theme.colorScheme.surface,
        shadows: const [
          AppSizes.boxShadowForCards,
        ],
      ),
      padding: AppSizes.paddingTypeOfDeliveryCard,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemOfDeliveryCard(
            iconPath: 'assets/icons/type_of_delivery_card/delivery.svg',
            label: 'Vận chuyển',
            function: () {

             context.read<AuthenticationBLoC>().add(const AuthenticationEvent.logOut());
            },
          ),
          const CustomDivider(
            height: 60,
            width: 2,
          ),
          ItemOfDeliveryCard(
            iconPath: 'assets/icons/type_of_delivery_card/take_away.svg',
            label: 'Lấy đi',
            function: () async {

              context.read<AuthenticationBLoC>().add(const AuthenticationEvent.signInWithGoogle());
            },
          ),
          const CustomDivider(
            height: 60,
            width: 2,
          ),
          ItemOfDeliveryCard(
            iconPath: 'assets/icons/type_of_delivery_card/in_cafe.svg',
            label: 'Trong quán',
            function: () {

              context.read<AuthenticationBLoC>().add(const AuthenticationEvent.emitUserState());
            },
          ),
        ],
      ),
    );
  }
}
