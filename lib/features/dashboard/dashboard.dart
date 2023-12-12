import 'package:dashboard/color/constant_color.dart';
import 'package:dashboard/features/homepage/controller/home_controller.dart';
import 'package:dashboard/features/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final HomeController homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          elevation: 0,
          backgroundColor: blue,
          title: const Text('Dashboard'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Image.asset('images/dashboard/Ellipse 2.png', width: 75),
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              color: blue,
              height: 135,
              width: double.infinity,
              child: Center(
                child: Text(
                  'My Dashboard',
                  style: style(white, 35, FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 90),
              child: Wrap(
                runSpacing: 15,
                alignment: WrapAlignment.center,
                direction: Axis.horizontal,
                verticalDirection: VerticalDirection.down,
                children: [
                  dataPenilaian(),
                  dataPerhitungan(),
                  dataKriteria(),
                  dataHasilAkhir(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            Image.asset('images/dashboard/Group 84 (1).png'),
            Positioned(
              top: 40,
              left: 50,
              child: InkWell(
                onTap: () => Get.to(() => const HomePage()),
                child: const Icon(Icons.home, color: white, size: 35),
              ),
            ),
            const Positioned(
              top: 40,
              right: 50,
              child: Icon(Icons.person, color: white, size: 35),
            ),
          ],
        ));
  }

  Card dataPenilaian() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('images/dashboard-2/Action_Edit.png', height: 50),
            const Gap(10),
            Text(
              'Data Penilaian',
              style: style(Colors.black54, 17, FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Card dataHasilAkhir() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('images/dashboard-2/Vector (2).png', height: 50),
            const Gap(10),
            Text(
              'Data Hasil Akhir',
              style: style(Colors.black54, 17, FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Card dataKriteria() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset('images/dashboard-2/Vector (1).png', height: 50),
            const Gap(10),
            Text(
              'Data Kriteria',
              style: style(Colors.black54, 17, FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }

  Card dataPerhitungan() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.asset('images/dashboard-2/Vector.png', height: 60),
            const Gap(10),
            Text(
              'Data perhitungan',
              style: style(Colors.black54, 17, FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
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
                    'Esa Unggul',
                    style: style(white, 20, FontWeight.w400),
                  ),
                  Text('admin', style: style(white, 15, FontWeight.w400)),
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
                  'images/dashboard-2/Action_Edit.png',
                  height: 27,
                ),
                const Gap(15),
                Text(
                  'Data Penilaian',
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
                  'images/dashboard-2/Vector.png',
                  height: 27,
                ),
                const Gap(15),
                Text(
                  'Data Perhitungan',
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
                  'images/dashboard-2/Vector (1).png',
                  height: 27,
                ),
                const Gap(15),
                Text(
                  'Data Kriteria',
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
                  'images/dashboard-2/Vector (2).png',
                  height: 20,
                ),
                const Gap(13),
                Text(
                  'Data Hasil Akhir',
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
