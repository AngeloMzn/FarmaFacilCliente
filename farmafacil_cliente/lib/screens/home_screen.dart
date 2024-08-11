import 'package:farmafacil_cliente/components/category_button.dart';
import 'package:farmafacil_cliente/database/product_operations.dart';
import 'package:farmafacil_cliente/models/product.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

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
            Container(
              height: 200,
              child: CarouselView(
                padding: EdgeInsets.all(8),
                itemExtent: 200,
                children: [
                  Image.network(
                    "https://www.designi.com.br/images/preview/12709839.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://www.designi.com.br/images/preview/10279963.jpg",
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    "https://www.designi.com.br/images/preview/10612630.jpg",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
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
                    return Text("não tem produtos :(");
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: ListView.builder(
                        itemCount: produtos.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 20,
                            height: 20,
                            child: Text(
                              "${produtos[index].code}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          );
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
