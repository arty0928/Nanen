import 'package:flutter/material.dart';
import 'package:nanen/src/constants/sizes.dart';
import 'package:nanen/src/constants/text_strings.dart';

import 'widgets/dashboard_appBar.dart';
import 'widgets/dashboard_categories.dart';
import 'widgets/dashboard_searchBox.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; // Dark Mode

    return Scaffold(
      body: Scaffold(
        appBar: DashboardAppBar(
          isDark: isDark,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Heading
                Text(
                  tDashboardTitle,
                  style: txtTheme.bodyMedium,
                ),
                Text(
                  tDashboardHeading,
                  style: txtTheme.displayMedium,
                ),
                const SizedBox(
                  height: tDashboardPadding,
                ),

                //Search Box
                DashboardSearchBox(txtThem: txtTheme),
                const SizedBox(
                  height: tDashboardPadding,
                ),

                //Categories
                DashboardCategories(txtTheme: txtTheme),
                const SizedBox(
                  height: tDashboardPadding,
                ),

                //Banners
                // DashboardBanners(txtTheme: txtTheme),
                const SizedBox(
                  height: tDashboardPadding,
                ),

                //Top Course
                Text(tDashboardTopCourses,
                    style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2)),
                // DashboardTopCourses(txtTheme : txtTheme, isDark : isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
