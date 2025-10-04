import 'package:buyerapp/core/utils/app_colors.dart';
import 'package:buyerapp/core/utils/assetpaths.dart';
import 'package:buyerapp/core/global_widget/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageOne extends StatefulWidget {
  const HomePageOne({super.key});

  @override
  State<HomePageOne> createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  final TextEditingController controller = TextEditingController();
  int _selectedIndex = 0;
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("Home Screen")),
    Center(child: Text("Shop Screen")),
    Center(child: Text("Wallet Screen")),
    Center(child: Text("Account Screen")),
  ];

  // Carousel Images
  final List<String> imgList = [
    Assetpaths.banner,
    Assetpaths.banner,
    Assetpaths.banner,
    Assetpaths.banner,
  ];

  // ListView images
  final List<Map<String, String>> listItems = const [
    {"image": Assetpaths.mask1, "subtitle": "All"},
    {"image": Assetpaths.mask2, "subtitle": "Fruits"},
    {"image": Assetpaths.mask3, "subtitle": "Vegetables"},
  ];

  // GridView images
  final List<Map<String, String>> gridItems = const [
    {"image": Assetpaths.Rectangle1, "title": "Apple", "subtitle": "Desc 1"},
    {"image": Assetpaths.Rectangle2, "title": "Carrot", "subtitle": "Desc 2"},
    {"image": Assetpaths.Rectangle3, "title": "Grapes", "subtitle": "Desc 3"},
    {"image": Assetpaths.Rectangle4, "title": "Bell Pepper", "subtitle": "Desc 4"},
    {"image": Assetpaths.Rectangle5, "title": "Tomato", "subtitle": "Desc 5"},
    {"image": Assetpaths.Rectangle6, "title": "Watermelon", "subtitle": "Desc 6"},
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
          ? SingleChildScrollView(
              child: Column(
                children: [
                  // 🔍 Search + Bulk Order Row
                  Padding(
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
                                  borderSide:
                                      BorderSide(color: AppColors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: AppColors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide:
                                      BorderSide(color: AppColors.white),
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
                  ),

                  // 🖼️ Carousel Slider
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 124,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: imgList.map((item) {
                      return Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: 312,
                            height: 124,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 10),

                  // 🔘 Dot Indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? AppColors.green
                              : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // Row for ListView + GridView
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ListView.builder
                        Expanded(
                          flex: 1,
                          child: SizedBox(
                            height: 400,
                            child: ListView.builder(
                              itemCount: listItems.length,
                              itemBuilder: (context, index) {
                                final item = listItems[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Container(
                                    width: 72,
                                    height: 93,
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          item['image']!,
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item['subtitle']!,
                                          style: const TextStyle(
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        // GridView.builder
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            height: 400,
                            child: GridView.builder(
                              itemCount: gridItems.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                childAspectRatio: 120 / 230,
                              ),
                              itemBuilder: (context, index) {
                                final gridItem = gridItems[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade300,
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        gridItem['image']!,
                                        width: 120,
                                        height: 106,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        gridItem['title']!,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        gridItem['subtitle']!,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        
                                        width: 119,
                                        height: 26,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffE2F925),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                          child: const Text(
                                            "Add",
                                            style: TextStyle(fontSize: 12, color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
        width: 375,
        height: 108,
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
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_rounded), label: "Account"),
          ],
        ),
      ),
    );
  }
}
