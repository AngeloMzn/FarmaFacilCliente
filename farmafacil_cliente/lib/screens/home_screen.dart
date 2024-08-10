import 'package:farmafacil_cliente/components/category_button.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Text("barra de pesquisa"),
          Divider(
            color: ApplicationColors.alternate,
          ),
          Text(
            "Destaques",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          Text("Carrossel"),
          Text(
            "Categorias",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
          Divider(
            color: ApplicationColors.alternate,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child: CategoryButton(
                    icon: Icon(
                      Icons.abc,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child: CategoryButton(
                    icon: Icon(
                      Icons.female_rounded,
                      color: ApplicationColors.primaryDark,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child: CategoryButton(
                    icon: Icon(
                      Icons.monitor_heart,
                      color: ApplicationColors.primaryDark,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child: CategoryButton(
                    icon: Icon(
                      Icons.medication_liquid_rounded,
                      color: ApplicationColors.primaryDark,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4.0, right: 4.0),
                  child: CategoryButton(
                    icon: Icon(
                      Icons.health_and_safety_outlined,
                      color: ApplicationColors.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Produtos",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
