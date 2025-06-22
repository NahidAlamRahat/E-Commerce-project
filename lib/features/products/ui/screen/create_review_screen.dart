import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class CreateReviewScreen extends StatelessWidget {
  const CreateReviewScreen({super.key});

  static String name = 'create-review-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(decoration:  InputDecoration(hintText: context.localizations.firstName),),
              const SizedBox(height: 24),
              TextFormField(decoration: InputDecoration(hintText: context.localizations.lastName),),
              const SizedBox(height: 24),
              TextFormField(maxLines: 6,),
              const SizedBox(height: 24),

              ElevatedButton(onPressed: (){}, child: const Text('Submit'))
        
            ],
          ),
        ),
      ),
    );
  }
}
