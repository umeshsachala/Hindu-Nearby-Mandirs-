import 'package:flutter/material.dart';
import '../widgets/temple_card.dart';
import '../widgets/temple_marker.dart';
import '../utils/app_colors.dart';

class NearbyMandirScreen extends StatefulWidget {
  const NearbyMandirScreen({super.key});

  @override
  State<NearbyMandirScreen> createState() => _NearbyMandirScreenState();
}

class _NearbyMandirScreenState extends State<NearbyMandirScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nearby Mandirs',
          style: TextStyle(
            fontSize: 22 * textScaleFactor,
            fontWeight: FontWeight.w400,
            color: AppColors.darkGrayColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.darkGrayColor),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'List',
              height: screenSize.height * 0.05,
            ),
            Tab(
              text: 'Map',
              height: screenSize.height * 0.05,
            ),
          ],
          labelStyle: TextStyle(
            fontSize: 16 * textScaleFactor,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 16 * textScaleFactor,
          ),
          indicatorWeight: 3,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTemplateList(),
          _buildMapView(),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Map placeholder
        Container(
          color: AppColors.mapLightGrayColor,
          child: Center(
            child: Text(
              'Map View',
              style: TextStyle(color: AppColors.lightGrayColor),
            ),
          ),
        ),
        // User location indicator
        const Center(
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromRGBO(100, 150, 255, 0.3),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        // Temple markers
        Positioned(
          top: screenSize.height * 0.05,
          left: screenSize.width * 0.25,
          child: const TempleMarker(),
        ),
        Positioned(
          top: screenSize.height * 0.2,
          left: screenSize.width * 0.6,
          child: const TempleMarker(),
        ),
        Positioned(
          top: screenSize.height * 0.15,
          right: screenSize.width * 0.2,
          child: const TempleMarker(),
        ),
        Positioned(
          bottom: screenSize.height * 0.3,
          left: screenSize.width * 0.2,
          child: const TempleMarker(),
        ),
        // Temple cards at bottom
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.semiTransparentBlack,
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: const TempleCard(
              name: 'Somnath Mandir',
              distance: '0.5 mil',
              hasLiveDarshan: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTemplateList() {
    return ListView(
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 60,
      ),
      children: const [
        TempleCard(name: 'Somnath Mandir', distance: '0.5 mil', hasLiveDarshan: true),
        TempleCard(name: 'Dwarkadhish Temple', distance: '1.2 mil'),
        TempleCard(name: 'Swaminarayan Mandir', distance: '2.3 mil', hasLiveDarshan: true),
        TempleCard(
            name: 'Shree Kashtabhanjan Dev Hanumanji Temple, Sarangpur', distance: '3.2 mil', hasLiveDarshan: true),
        TempleCard(name: 'Ambaji Mandir', distance: '3.8 mil'),
      ],
    );
  }
}
