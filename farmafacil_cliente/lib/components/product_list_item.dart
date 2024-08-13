import 'package:farmafacil_cliente/models/product.dart';
import 'package:farmafacil_cliente/theme/application_colors.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text("imagem"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          color: ApplicationColors.primaryText,
                          fontSize: 19,
                        ),
                      ),
                      Text(
                        product.category,
                        style: TextStyle(
                          color: ApplicationColors.primaryText,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  product.initialPrice.toString(),
                  style: TextStyle(
                    color: ApplicationColors.primary,
                    fontWeight: FontWeight.w300,
                    fontSize: 26,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
