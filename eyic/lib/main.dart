import 'package:eyic/firebase_options.dart';
import 'package:eyic/global/colors.dart';
import 'package:eyic/screens/auth_view/signin_view.dart';
import 'package:eyic/screens/auth_view/signup_view.dart';
import 'package:eyic/screens/feedback/feedback_view.dart';
import 'package:eyic/screens/mentee/chat_view/chat_view.dart';
import 'package:eyic/screens/mentee/community_view/community_view.dart';
import 'package:eyic/screens/mentee/connections_page/connections_page.dart';
import 'package:eyic/screens/mentee/contact_us_view/contact_us_view.dart';
import 'package:eyic/screens/mentee/courses_view/courses_view.dart';
import 'package:eyic/screens/mentee/courses_view/widgets/each_course.dart';
//import '../garbage/course_detail_view.dart';
import 'package:eyic/screens/mentee/home_view/mentee_home_view.dart';
import 'package:eyic/screens/mentee/profile_view/profile_view.dart';
import 'package:eyic/screens/mentor/mentor_home_view.dart';
import 'package:eyic/screens/programs/programs_view.dart';
import 'package:eyic/screens/perks_view/perks_view.dart';
import 'package:eyic/screens/report_abuse/report_abuse_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:eyic/screens/testing_view/testing_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'landing_view.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const RootWidget(),
  );
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //backgroundColor: bgColor,
        fontFamily: "Poppins",
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xffff6b00),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          title: '/',
          page: () => const LandingView(),
        ),
        GetPage(
          name: "/mentor_dashboard",
          title: 'Mentor Dashboard',
          page: () => const MentorDashboardView(),
        ),
        GetPage(
          name: "/dashboard",
          title: 'Dashboard',
          page: () => const MenteeDashboardView(),
        ),
        GetPage(
          name: "/feedback_form",
          title: 'feedback Form',
          page: () => const FeedbackView(),
        ),
        GetPage(
          name: "/abuse",
          title: 'abuse',
          page: () => const ReportAbuseView(),
        ),
        GetPage(
          name: "/sign_in",
          title: 'Sign In',
          page: () => const SignInView(),
        ),
        GetPage(
          name: "/sign_up",
          title: 'Sign Up',
          page: () => const SignUpView(),
        ),
        GetPage(
          name: "/community",
          title: 'Community',
          page: () => const CommunityView(),
        ),
        GetPage(
          name: "/courses",
          title: 'Courses',
          page: () => const CoursesView(),
        ),
        GetPage(
          name: "/eachCourse",
          title: 'Each Course',
          page: () => eachCourse(),
        ),
        GetPage(
          name: "/contact_us",
          title: 'Contact Us',
          page: () => const ContactUsView(),
        ),
        GetPage(
          name: "/profile",
          title: 'Profile',
          page: () => const MenteeProfileView(),
        ),
        GetPage(
          name: "/chats",
          title: 'Chats',
          page: () => const ChatView(),
        ),
        GetPage(
          name: "/perks_view",
          title: 'Perks',
          page: () => const PerksView(),
        ),
        GetPage(
          name: "/perks_detail_view",
          title: 'Perks Detail',
          page: () => const PerksView(),
        ),
        GetPage(
          name: "/connection_page",
          title: 'Connection Page',
          page: () => ConnectionsPage(),
        ),
        GetPage(
          name: "/programs",
          title: 'Mentorspace programs',
          page: () => const ProgramsView(),
        ),
        GetPage(
          name: "/mentee/:id",
          title: 'Mentee',
          page: () => const MenteeProfileView(),
        ),
      ],
    );
  }
}
