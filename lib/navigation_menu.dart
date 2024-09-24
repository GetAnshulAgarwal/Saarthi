import 'package:bhoo_saarthi/pages/Buyer/crop_request_page.dart';
import 'package:bhoo_saarthi/pages/Buyer/marketplace_page.dart';
import 'package:bhoo_saarthi/pages/Buyer/payment_history_page.dart';
import 'package:bhoo_saarthi/pages/Buyer/profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'home'),
            NavigationDestination(
                icon: Icon(Iconsax.book_saved), label: 'contract'),
            NavigationDestination(icon: Icon(Iconsax.wallet), label: 'wallet'),
            NavigationDestination(
                icon: Icon(Iconsax.profile), label: 'profile'),
          ],
        ),
      ),
      body: Obx(
        () => controller.pages[controller.selectedIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final pages = [
    const MarketplacePage(),
    const CropRequestPage(),
    const PaymentHistoryPage(),
    const ProfilePage()
  ];
}
