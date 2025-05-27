import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/app_color.dart';
import '../../../../app/asset_path.dart';
import '../../../../core/widgets/show_snack_Bar.dart';
import '../../../product/widgets/increment_decrement_count_widget.dart';
import '../../model/card_model.dart';
import '../controller/product_card_controller.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.cardModel,
    required this.quantity,
  });

  final CardModel cardModel;
  final Function(int count) quantity;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  final RxBool _deleteInProgress = false.obs;


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100,
        width: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            '${widget.cardModel.photo}',
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(AssetsPath.noImage),
                ),
              );
            },
          ),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cardModel.title ?? 'Unknown product',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text('Color: ${widget.cardModel.color}', style: TextStyle(fontSize: 10)),
                    SizedBox(width: 8),
                    Text('Size: ${widget.cardModel.size}', style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () =>  Visibility(
              visible: _deleteInProgress.value == false,
              replacement: const CircularProgressIndicator(),
              child: IconButton(
                onPressed: () async {
                  _deleteInProgress.value = true;
                  final bool isSuccess = await Get.find<ProductCardController>()
                      .removeFromCart(widget.cardModel);
                  _deleteInProgress.value = false;
                  if (isSuccess == false) {
                    showSnackBarMessage(
                      context,
                      Get.find<ProductCardController>().removeFromCartErrorMessage!,
                      true,
                    );
                  }
                },
                icon: const Icon(Icons.delete_outline,color: Colors.grey,),
              ),
            ),
          ),
          SizedBox(height: 8)
        ],
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '৳${widget.cardModel.currentPrice}',
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          IncrementDecrementCountWidget(
            count: widget.cardModel.quantity??0,
            quantity: (count) {
              widget.quantity(count);
            },
          ),
        ],
      ),
    );
  }
}
