import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class AlternatingStep extends EasyStep {
  AlternatingStep({
    required final String title,
    required final bool isLocked,
    required final Color primary,
    required final Color outline,
  }) : super(
         customStep: CircleAvatar(
           radius: 8,
           backgroundColor: isLocked ? outline : primary,
         ),
         customTitle: SizedBox(
           width: 100,
           child: Text(
             title,
             textAlign: TextAlign.center,
             maxLines: 2,
             overflow: TextOverflow.ellipsis,
             style: TextStyle(
               color: isLocked ? outline : primary,
               fontSize: 12,
               fontWeight: FontWeight.w500,
             ),
           ),
         ),
       );
}
