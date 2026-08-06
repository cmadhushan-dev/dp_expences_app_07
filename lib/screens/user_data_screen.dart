import 'package:dp_expenz_application/screens/main_screen.dart';
import 'package:dp_expenz_application/services/user_service.dart';
import 'package:dp_expenz_application/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //bool value for the toggle the visibility
  bool _isPasswordVisible = true;
  //bool value for the toggle the visibility
  bool _confirmIsPasswordVisible = true;
  //bool for checkbox
  bool _remmeberMe = false;
  //from key for the validations
  final _formKey = GlobalKey<FormState>();
  //define the controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  //dispose the memory for controller
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                const Text(
                  "Entre your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 32,
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                //from implimnetaion
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            fillColor: kWhite.withOpacity(0.2),
                            filled: true,
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),

                          validator: (value) {
                            //check the user enter a user entre a valid entre name
                            if (value!.isEmpty) {
                              return 'Please entre you name';
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            fillColor: kWhite.withOpacity(0.2),
                            filled: true,
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            //check the user enter a user entre a valid entre name
                            if (value!.isEmpty) {
                              return 'Please entre your Email';
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordVisible,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            fillColor: kWhite.withOpacity(0.2),
                            filled: true,
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            //check the user enter a user entre a valid entre name
                            if (value!.isEmpty) {
                              return 'Please entre your password';
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: _confirmIsPasswordVisible,
                          decoration: InputDecoration(
                            fillColor: kWhite.withOpacity(0.2),
                            filled: true,
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: kGrey,
                              fontWeight: FontWeight.w600,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _confirmIsPasswordVisible =
                                      !_confirmIsPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _confirmIsPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: const BorderSide(
                                color: kWhite,
                                width: 2,
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),

                          validator: (value) {
                            //check the user enter a user entre a valid entre name
                            if (value!.isEmpty) {
                              return 'Please entre your confrimPasssword';
                            }
                          },
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            Text(
                              'Remember Me for the next time',
                              style: TextStyle(
                                fontSize: 14,
                                color: kGrey.withOpacity(0.9),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Expanded(
                              child: SwitchListTile(
                                value: _remmeberMe,
                                activeThumbColor: kWhite,
                                activeTrackColor: kMainColor,
                                onChanged: (value) {
                                  setState(() {
                                    _remmeberMe = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        GestureDetector(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              //form is valid process data
                              String userName = _nameController.text;
                              String userEmail = _emailController.text;
                              String userPassword = _passwordController.text;
                              String userConfirmPassword =
                                  _confirmPasswordController.text;

                              //save the user name and details in the device strorage
                              await UserService.storeUserDetails(
                                context: context,
                                userName: userName,
                                userEmail: userEmail,
                                password: userPassword,
                                confirmPassword: userConfirmPassword,
                              );
                            }
                            if (context.mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ),
                              );
                            }
                          },
                          child: const CustomButton(
                            buttonColor: kMainColor,
                            buttonText: 'Next',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
