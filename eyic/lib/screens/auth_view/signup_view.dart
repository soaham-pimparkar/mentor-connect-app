import 'package:eyic/api/services/firebase/authentication.dart';
import 'package:eyic/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';

final _authCtr = Get.put(Authentication());

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final name = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();
    final age = TextEditingController();
    final interestedSkills = TextEditingController();
    final role = TextEditingController();
    final gender = TextEditingController();
    final languages = TextEditingController();
    final description = TextEditingController();
    //final tokens = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              color: primary,
              child: const Center(
                child: Text(
                  "Mentorspace",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: age,
                decoration: InputDecoration(
                  hintText: 'Age',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: role,
                decoration: InputDecoration(
                  hintText: 'Role',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: gender,
                decoration: InputDecoration(
                  hintText: 'Gender (male/ female/ other)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: description,
                decoration: InputDecoration(
                  hintText: 'Bio (write a short description of yourself)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: languages,
                maxLines: 25,
                decoration: InputDecoration(
                  hintText: 'Languages spoken (seperate by ,)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextFormField(
                controller: interestedSkills,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Interested skills (seperate by ,)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await _authCtr.signUpUsingEmailAndPassword(
                          email.text,
                          password.text,
                          name.text,
                          interestedSkills.text.split(","),
                          int.parse(age.text),
                          role.text,
                          gender.text,
                          languages.text.split(","),
                          description.text,
                          0);

                      Get.offNamed('/');
                    } catch (err) {}
                  },
                  child: const Text("Sign Up"),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Divider(),
                Text("OR"),
                Divider(),
              ],
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: SignInButton(
                  Buttons.google,
                  onPressed: () async {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
