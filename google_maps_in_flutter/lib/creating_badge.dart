import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class BadgeHandler{
  void createBadge(image){
    badges.Badge(
      showBadge: true,
      onTap:() {},
      badgeContent: Image(image: image),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.circle,
        //badgeColor: Colors.black,
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.black, width: 2),

      ),
    );

  }
}