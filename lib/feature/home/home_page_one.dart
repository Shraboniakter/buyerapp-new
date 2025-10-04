import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/core/utils/assetpaths.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:flutter/material.dart';


class HomePageOne extends StatefulWidget {
  const HomePageOne({super.key});

  @override
  State<HomePageOne> createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  final TextEditingController controller = TextEditingController();
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("Home Screen")),
    Center(child: Text("Shop Screen")),
    Center(child: Text("Wallet Screen")),
    Center(child: Text("Account Screen")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  // Search Field
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 40,
                      child: TextFormField(
                        controller: controller,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: AppColors.grey1,
                          ),
                          prefixIcon: Icon(Icons.search, size: 20),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  // Bulk Order Button
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          print("Bulk Order pressed!");
                        },
                        child: CustomTextPoppins(
                          text: "Bulk Order",
                          size: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : _screens[_selectedIndex],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextPoppins(
              text: "Delivery by tomorrow 6 AM Onwards",
              size: 12,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 3),
            CustomTextPoppins(
              text: "Tue , Aug 05",
              size: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Image.asset(Assetpaths.frame, height: 36, width: 36),
                SizedBox(width: 8),
                Image.asset(Assetpaths.frame3, height: 36, width: 36),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        width: 375, // fixed width
        height: 108, // fixed height
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.green,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 2,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.update), label: "Updates"),
            BottomNavigationBarItem(icon: Icon(Icons.shopify), label: "Shop"),
            BottomNavigationBarItem(
              icon: Icon(Icons.wallet),
              label: "Wallet",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Account"),
          ],
        ),
      ),
    );
  }
}
