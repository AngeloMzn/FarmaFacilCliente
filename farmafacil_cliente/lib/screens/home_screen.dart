import 'package:farmafacil_cliente/components/carousel.dart';
import 'package:farmafacil_cliente/components/category_button.dart';
import 'package:farmafacil_cliente/components/product_list_item.dart';
import 'package:farmafacil_cliente/database/product_operations.dart';
import 'package:farmafacil_cliente/models/product.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Destaques",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8),
              child: Carousel(),
            ),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CategoryButton(
                        hint: "Ordem alfabética",
                        icon: Icon(
                          Icons.abc,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CategoryButton(
                        hint: "Saúde feminina",
                        icon: Icon(
                          Icons.female_rounded,
                          color: ApplicationColors.primaryDark,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CategoryButton(
                        hint: "naosei",
                        icon: Icon(
                          Icons.monitor_heart,
                          color: ApplicationColors.primaryDark,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CategoryButton(
                        hint: "naosei",
                        icon: Icon(
                          Icons.medication_liquid_rounded,
                          color: ApplicationColors.primaryDark,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: CategoryButton(
                        hint: "naosei",
                        icon: Icon(
                          Icons.health_and_safety_outlined,
                          color: ApplicationColors.primaryDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Produtos",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 20,
              ),
            ),
            FutureBuilder(
              future: ProductOperations().getAll(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.hasData) {
                  debugPrint("Resultado: ${snapshot.data.toString()}");
                  List<Product>? produtos = snapshot.data;

                  if (produtos == null || produtos.length == 0) {
                    return Column(
                      children: [
                        Icon(
                          Icons.sentiment_dissatisfied,
                          color: ApplicationColors.primary,
                        ),
                        Text("Não há produtos."),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: ListView.builder(
                        itemCount: produtos.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return ProductListItem(product: produtos[index]);
                        },
                      ),
                    );
                  }
                }
                return CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
