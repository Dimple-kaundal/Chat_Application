
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onpressed;
  final String? text;
  final Widget?child;
  const CustomButton({super.key,
  required this.onpressed,
  this.text,
  this.child}):assert (text !=null|| child!=null,"Either text or child must be provided");

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onpressed==null?null:()async{
        await onpressed?.call();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.black87,
        padding: EdgeInsets.symmetric(
          vertical: 16
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          
        )
      ),
      
      
      
       child: child??Text(text!,
       style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.bold
       ))),
    );
  }
}