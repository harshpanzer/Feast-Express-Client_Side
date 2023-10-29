import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/local_user.dart';
import 'orderProvider.dart';

class LocalUserProvider extends ChangeNotifier {
  late LocalUser _localUser;
  void addLocalUser(LocalUser localUser) {
    _localUser = localUser;
  }

  void addOrder(BuildContext context) {
    _localUser.lastOrders
        .add(Provider.of<OrderProvider>(context, listen: false).order);
    //TODO : Clear Order After Pay
    // Provider.of<OrderProvider>(context, listen: false).clearOrder();
    notifyListeners();
  }

  get localUser => _localUser;
}