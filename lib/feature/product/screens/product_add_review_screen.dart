import 'package:e_commerce/core/widgets/show_snack_Bar.dart';
import 'package:e_commerce/feature/product/controller/add_review_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductAddReviewScreen extends StatefulWidget {
  const ProductAddReviewScreen({super.key, required this.id});

  final String id;

  static String name = '/ProductAddReview';

  @override
  State<ProductAddReviewScreen> createState() => _ProductAddReviewScreenState();
}

class _ProductAddReviewScreenState extends State<ProductAddReviewScreen> {
  final AddReviewController _addReviewController = AddReviewController();
  final TextEditingController _reviewController = TextEditingController();
  int ratingCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Add Reviews', style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder:
                    (context, _) => const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  ratingCount = rating.toInt();
                },
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _reviewController,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Write Review',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GetBuilder(
                init: _addReviewController,
                builder: (controller) {
                  return controller.inProgress == true
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                    onPressed: () {
                      if (_reviewController.text.trim().isNotEmpty) {
                        addReview();
                      } else {
                        showSnackBarMessage(
                          context,
                          'Place write somthing',
                          true,
                        );
                      }
                    },
                    child: Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addReview() async {
    bool isSuccess = await _addReviewController.apiCall({
      "product": widget.id,
      "comment": _reviewController.text.trim(),
      "rating": ratingCount,
    });
    if(isSuccess){
      showSnackBarMessage(context, 'Add review successfully');
    }else{
      showSnackBarMessage(context, _addReviewController.errorMessage,true);
    }
  }
}
