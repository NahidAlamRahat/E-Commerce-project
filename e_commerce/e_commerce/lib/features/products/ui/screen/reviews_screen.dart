import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/features/products/ui/screen/create_review_screen.dart';
import 'package:e_commerce/features/products/ui/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  static String name = 'reviews-screen';

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Card(
                    child: ListTile(
                      titleTextStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w600,
                          color: Colors.black
                      ),
                      title: Text('Nahid Rahat'),
                      subtitle: Text(
                          '''Dedicated mobile app developer specializing in Flutter, with strong expertise in state management.'''),
                      leading: Icon(Icons.person_outline),
                    ),
                  ),
                );
              },
            ),
          ),
          BottomBar(
            sizeBoxWidth: 56,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
              backgroundColor: AppColors.themeColor,
              onPressed: () {
                Navigator.pushNamed(context, CreateReviewScreen.name);
              },
              child: const Icon(Icons.add, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
