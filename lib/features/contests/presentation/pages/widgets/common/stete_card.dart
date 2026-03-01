import 'package:flutter/material.dart';
import 'package:skill_bit/core/theme/theme.dart';

class StatCard extends StatelessWidget { 

  const StatCard({
    super.key,
    required this.imagePath,
    required this.topText,
    required this.bottomText,
  
  });
  final String imagePath; 
  final String topText;  
  final String bottomText;

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: 120,
     // height: 100,
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
        
        border: Border.all(color: context.colorScheme.tertiary, width: 1),
        
        boxShadow: <BoxShadow>[
          BoxShadow(
            
            color: context.colorScheme.onPrimary.withValues(alpha: .25),
            offset: const Offset(0, 4),
            blurRadius: 4,
           
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath, height:40, width:40),
          4.heightBox,
          Text(topText, style: context.textTheme.displayMedium?.copyWith(color: context.colorScheme.onSurface)),
          Text(bottomText, style:  context.textTheme.displayMedium?.copyWith(
              color: context.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
          }
       