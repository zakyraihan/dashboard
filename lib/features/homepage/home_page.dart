import 'package:dashboard/color/constant_color.dart';
import 'package:dashboard/features/homepage/controller/home_controller.dart';
import 'package:dashboard/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        drawer: Drawer(
          width: 265,
          backgroundColor: blue,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _menuDrawer(),
                  InkWell(
                    onTap: () async => await homeC.signOut(),
                    child: Column(
                      children: [
                        const Divider(color: white, thickness: 2),
                        const Gap(20),
                        Container(
                          padding: const EdgeInsets.only(bottom: 27),
                          child: Row(
                            children: [
                              const Icon(Icons.logout, color: orange, size: 36),
                              const Gap(15),
                              Text(
                                'Logout',
                                style: GoogleFonts.copse(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: blue,
          title: const Text('Home'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  banner(),
                  const Gap(36),
                  searchBar(),
                  const Gap(17),
                  Image.asset('images/dashboard/Top 3 Students.png',
                      width: 200),
                  const Gap(32),
                  top3students(),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Stack(
          children: [
            Image.asset('images/dashboard/Group 84 (1).png'),
            const Positioned(
              top: 40,
              left: 50,
              child: Icon(Icons.home, color: white, size: 35),
            ),
            Positioned(
              top: 40,
              right: 50,
              child: IconButton(
                onPressed: () => Get.to(const ProfileScreen()),
                icon: const Icon(
                  Icons.person,
                  color: white,
                  size: 35,
                ),
              ),
            ),
          ],
        ));
  }

  SingleChildScrollView top3students() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'images/dashboard/Ellipse 2.png',
                    height: 100,
                  ),
                  Text(
                    'You\n20210801346\nTeknik Informatika\nTahun Lulusan\n2023\nIPK 4.00',
                    textAlign: TextAlign.center,
                    style: style(Colors.black, 15, FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'images/dashboard/Group 27565.png',
                    height: 100,
                  ),
                  Text(
                    'Syamsul Bahri\n20210801356\nTeknik Informatika\nTahun Lulusan\n2023\nIPK 3.99',
                    textAlign: TextAlign.center,
                    style: style(Colors.black, 15, FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'images/dashboard/Group 27570.png',
                    height: 100,
                  ),
                  Text(
                    'Habrizi\n20210801346\nTeknik Informatika\nTahun Lulusan\n2023\nIPK 3.98',
                    textAlign: TextAlign.center,
                    style: style(Colors.black, 15, FontWeight.w500),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextField searchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, color: abu, size: 27),
        hintText: 'Search Nik',
        hintStyle: style(abu, 17, FontWeight.normal),
      ),
    );
  }

  Container banner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueAccent.shade100,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: style(white, 30, FontWeight.w400),
              ),
              Text(
                'Widya Febry',
                style: style(white, 30, FontWeight.w400),
              ),
              const Gap(20),
              Text('“ congratulations,\non getting first place”',
                  style: style(white, 17, FontWeight.w400)),
            ],
          ),
          Image.asset('images/dashboard/Ellipse 2.png', height: 130),
        ],
      ),
    );
  }

  Container _menuDrawer() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('images/dashboard/Ellipse 2.png', width: 75),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Widya Febry',
                      style: style(white, 20, FontWeight.w400),
                    ),
                    Text('Graduates in 2023',
                        style: style(white, 15, FontWeight.w400)),
                  ],
                )
              ],
            ),
          ),
          const Divider(color: white, thickness: 2),
          const Gap(20),
          Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'images/dashboard/User Profile.png',
                    height: 40,
                  ),
                  const Gap(15),
                  Text(
                    'Graduates in 2023',
                    style: style(
                      white,
                      18,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(27),
              Row(
                children: [
                  Image.asset(
                    'images/dashboard/File Lock.png',
                    height: 40,
                  ),
                  const Gap(15),
                  Text(
                    'Transkip Nilai',
                    style: style(
                      white,
                      18,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(27),
              Row(
                children: [
                  Image.asset(
                    'images/dashboard/File Lock.png',
                    height: 40,
                  ),
                  const Gap(15),
                  Text(
                    'Surat Keterangan\nLulus',
                    style: style(
                      white,
                      18,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Gap(27),
              Row(
                children: [
                  Image.asset(
                    'images/dashboard/File Lock.png',
                    height: 40,
                  ),
                  const Gap(15),
                  Text(
                    'Riwayat Mengulang',
                    style: style(
                      white,
                      18,
                      FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
