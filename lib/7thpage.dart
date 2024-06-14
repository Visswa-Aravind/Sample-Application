import 'package:email_validator/email_validator.dart';
import 'package:first_project/9thpage.dart';
import 'package:flutter/material.dart';

import '8thpage.dart';
import 'drawer.dart';

final formkey = GlobalKey<FormState>();

final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController phnoController = TextEditingController();

final FocusNode passwordFocusNode = FocusNode();
final FocusNode confirmPasswordFocusNode = FocusNode();
final FocusNode nameFocusNode = FocusNode();
final FocusNode emailFocusNode = FocusNode();
final FocusNode phnoFocusNode = FocusNode();

bool passwordVisible = false;
bool confirmPasswordVisible = false;
bool isPasswordValid = false;
bool isConfirmPasswordValid = false;

class SeventhScreen extends StatefulWidget {
  const SeventhScreen({super.key});

  @override
  State<SeventhScreen> createState() => _SeventhScreenState();
}

List<String> options = ['Male', 'Female'];

class _SeventhScreenState extends State<SeventhScreen> {
  String CurrentOption = options[0];

  void validatePassword(String value) {
    bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
    bool hasDigits = value.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = value.length >= 6;

    setState(() {
      isPasswordValid =
          hasUppercase && hasDigits && hasSpecialCharacters && hasMinLength;
    });
  }

  void validateConfirmPassword(String value) {
    setState(() {
      isConfirmPasswordValid = value == passwordController.text;
    });
  }

  @override
  void dispose() {
    /* passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    phnoFocusNode.dispose();*/

    super.dispose();
  }

  bool mon = false;
  bool tue = false;
  bool wed = false;
  bool thu = false;
  bool fri = false;
  bool sat = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        passwordFocusNode.unfocus();
        confirmPasswordFocusNode.unfocus();
        nameFocusNode.unfocus();
        emailFocusNode.unfocus();
        phnoFocusNode.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Form '),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EighthScreen(
                              name: '',
                              phoneno: '',
                              email: '',
                              selectedDays: [],
                              selectedGender: '',
                            )),
                  );
                },
                icon: Icon(Icons.arrow_circle_right))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Sign in Page',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: nameController,
                    focusNode: nameFocusNode,
                    decoration: InputDecoration(
                        labelText: "Enter Name",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        icon: Icon(Icons.person)),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z . A-Z]+$').hasMatch(value)) {
                        return "Enter Correct Name";
                      }
                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: emailFocusNode,
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Enter Email",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        icon: Icon(Icons.mail)),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty || !EmailValidator.validate(value)) {
                        return "Enter correct Email";
                      }
                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: phnoFocusNode,
                    controller: phnoController,
                    decoration: InputDecoration(
                        labelText: "Enter Phone",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(15)),
                        icon: Icon(Icons.phone_in_talk_outlined)),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^\d{10}$').hasMatch(value)) {
                        return "Enter Phone Number";
                      }
                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  isPasswordValid ? Colors.green : Colors.red),
                          borderRadius: BorderRadius.circular(15)),
                      icon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    obscureText: !passwordVisible,
                    onChanged: validatePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Correct Password";
                      }
                      bool hasUppercase = value.contains(RegExp(r'[A-Z]'));
                      bool hasDigits = value.contains(RegExp(r'[0-9]'));
                      bool hasLowercase = value.contains(RegExp(r'[a-z]'));
                      bool hasSpecialCharacters =
                          value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
                      bool hasMinLength = value.length >= 6;

                      if (!hasUppercase) {
                        return "Password must contain at least one uppercase letter";
                      }
                      if (!hasLowercase) {
                        return "Password must contain at least one lowercase letter";
                      }
                      if (!hasDigits) {
                        return "Password must contain at least one number";
                      }
                      if (!hasSpecialCharacters) {
                        return "Password must contain at least one special character";
                      }
                      if (!hasMinLength) {
                        return "Password must be at least 6 characters long";
                      }

                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context)
                        .requestFocus(confirmPasswordFocusNode),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordFocusNode,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isConfirmPasswordValid
                                  ? Colors.green
                                  : Colors.red),
                          borderRadius: BorderRadius.circular(15)),
                      icon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            confirmPasswordVisible = !confirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: !confirmPasswordVisible,
                    onChanged: validateConfirmPassword,
                    validator: (value) {
                      if (value!.isEmpty || value != passwordController.text) {
                        return "Enter Correct Password";
                      }
                      return null;
                    },
                    onEditingComplete: () => FocusScope.of(context).unfocus(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'WFH:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      CustomCheckbox('Mon', mon),
                      CustomCheckbox('Tue', tue),
                      CustomCheckbox('Wed', wed),
                      CustomCheckbox('Thu', thu),
                      CustomCheckbox('Fri', fri),
                      CustomCheckbox('Sat', sat),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Gender'),
                      Radio(
                        value: options[0],
                        groupValue: CurrentOption,
                        onChanged: (value) {
                          setState(() {
                            CurrentOption = value.toString();
                          });
                        },
                      ),
                      Text('Male'),
                      Radio(
                        value: options[1],
                        groupValue: CurrentOption,
                        onChanged: (value) {
                          setState(() {
                            CurrentOption = value.toString();
                          });
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (!ValidateDays()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select at least one day'),
                            ),
                          );
                          return;
                        }
                        if (CurrentOption.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please select a gender'),
                            ),
                          );
                          return;
                        }
                        List<String> selectedDays = [];
                        if (mon) selectedDays.add('Monday');
                        if (tue) selectedDays.add('Tuesday');
                        if (wed) selectedDays.add('Wednesday');
                        if (thu) selectedDays.add('Thursday');
                        if (fri) selectedDays.add('Friday');
                        if (sat) selectedDays.add('Saturday');

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EighthScreen(
                              name: nameController.text,
                              email: emailController.text,
                              phoneno: phnoController.text,
                              selectedDays: selectedDays,
                              selectedGender: CurrentOption,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        drawer: SeventhScreenStateDrawer(),
      ),
    );
  }

  Column CustomCheckbox(String title, bool val) {
    return Column(
      children: <Widget>[
        Text(title),
        Checkbox(
          value: val,
          onChanged: (bool? value) {
            setState(() {
              switch (title) {
                case 'Mon':
                  mon = value!;
                  break;
                case 'Tue':
                  tue = value!;
                  break;
                case 'Wed':
                  wed = value!;
                  break;
                case 'Thu':
                  thu = value!;
                  break;
                case 'Fri':
                  fri = value!;
                  break;
                case 'Sat':
                  sat = value!;
                  break;
              }
            });
          },
        )
      ],
    );
  }

  void clearForm() {
    nameController.clear();
    emailController.clear();
    phnoController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    setState(() {
      mon = false;
      tue = false;
      wed = false;
      thu = false;
      fri = false;
      sat = false;
    });
    setState(() {
      CurrentOption = options[0];
    });
  }

  bool ValidateDays() {
    return mon || tue || wed || thu || fri || sat;
  }
}
