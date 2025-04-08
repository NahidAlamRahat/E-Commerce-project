import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ItemCounterWidget extends StatefulWidget {
  const ItemCounterWidget(
      {super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<ItemCounterWidget> createState() =>
      _ItemIncrementDecrementCounterWidgetState();
}

class _ItemIncrementDecrementCounterWidgetState
    extends State<ItemCounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          spacing: 12,
          children: [
             InkWell(
               onTap: (){
                 if(count<=1) return;
                  count--;
                  widget.onChange(count);
                  setState(() {});

              },
              child: const CustomIconButton(
                icon: Icons.remove,
              ),
            ),
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            InkWell(
              onTap: (){
                if(count>=20) return;
                  count++;
                widget.onChange(count);

                setState(() {});
              },
              child: const CustomIconButton(
                icon: Icons.add,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.themeColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Icon(icon,size: 20,),
      ),
    );
  }
}
