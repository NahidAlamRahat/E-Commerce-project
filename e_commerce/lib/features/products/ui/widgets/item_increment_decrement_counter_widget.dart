import 'package:e_commerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ItemIncrementDecrementCounterWidget extends StatefulWidget {
  const ItemIncrementDecrementCounterWidget(
      {super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<ItemIncrementDecrementCounterWidget> createState() =>
      _ItemIncrementDecrementCounterWidgetState();
}

class _ItemIncrementDecrementCounterWidgetState
    extends State<ItemIncrementDecrementCounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Wrap(
          spacing: 12,
          children: [
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
            Text(
              '$count',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
      padding: const EdgeInsets.all(4),
      child: Icon(icon),
    );
  }
}
