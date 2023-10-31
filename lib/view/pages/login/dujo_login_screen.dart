import 'package:excelkarror_application/helper/shared_pref_helper.dart';
import 'package:excelkarror_application/view/pages/login/widgets/login_screenDegin.dart';
import 'package:excelkarror_application/view/pages/search/search_batchYear/search_batch_year.dart';
import 'package:excelkarror_application/view/widgets/fonts/google_monstre.dart';
import 'package:excelkarror_application/view/widgets/fonts/google_poppins.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/schoo_selection_controller/school_class_selection_controller.dart';
import '../../../controllers/userCredentials/user_credentials.dart';
import '../../../widgets/login_button.dart';

class DujoLoginScren extends StatelessWidget {
  SchoolClassSelectionController schoolClassSelectionController =
      Get.put(SchoolClassSelectionController());
  DujoLoginScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const LoginScreenDesign(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GoogleMonstserratWidgets(
                  text: 'Welcome To'.tr,
                  letterSpacing: 2,
                  fontsize: 25,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleMonstserratWidgets(
                      text: 'Excel',
                      fontsize: 25,
                      color: const Color.fromARGB(255, 230, 18, 3),
                      fontWeight: FontWeight.bold,
                    ),
                    GoogleMonstserratWidgets(
                      text: 'Karror',
                      fontsize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    UserCredentialsController.schoolId =
                        've41eJzSngUudqeqMeZrK0OUvDS2';
                    await SharedPreferencesHelper.setString(
                        SharedPreferencesHelper.schoolIdKey,
                        UserCredentialsController.schoolId ?? "");
                    await Get.find<SchoolClassSelectionController>()
                        .fetchBatachDetails();
                    if (context.mounted) {
                      await showSearch(
                          context: context, delegate: SearchBatchYearBar());
                    }
                  },
                  child: loginButtonWidget(
                    height: 60,
                    width: 180,
                    text: 'Login'.tr,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GooglePoppinsWidgets(text: "Developed by", fontsize: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/leptonlogo.png'))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GoogleMonstserratWidgets(
                              text: "Lepton Communications",
                              fontsize: 13,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
