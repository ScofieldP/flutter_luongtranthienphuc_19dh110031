import 'package:flutter/material.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/models/carts.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/custom_bottom_modal.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/components/custom_text_field.dart';
import 'package:flutter_luongtranthienphuc_19dh110031/screens/cart/services/fill_form_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutCart extends StatefulWidget {
  final double sum;

  const CheckOutCart({Key? key, required this.sum}) : super(key: key);

  @override
  State<CheckOutCart> createState() => _CheckOutCartState();
}

class _CheckOutCartState extends State<CheckOutCart> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _checkOutFormKey = GlobalKey<FormState>();
  final FillFormService fillFormService = FillFormService();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
  }

  void fillFormUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> cart = await Cart.loadCart();
    List<Map<String, dynamic>> updatedCart = cart.map((product) {
      return {
        'productId': product["id"],
        'title': product['title'],
        'price': product['price'],
      };
    }).toList();
    fillFormService.fillForm(
        context: context,
        products: updatedCart,
        // subtotal: widget.sum,
        // total: widget.sum,
        shipping: {
          'name': _usernameController.text,
          'address': _addressController.text,
          'phone': _phoneController.text,
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 50, // set the height here
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(color: Colors.green),
                ),
                backgroundColor: Colors.white,
                textStyle: const TextStyle(color: Colors.white),
              ),
              onPressed: () {},
              child: Text(
                "Sum: ${widget.sum}",
                style: const TextStyle(fontSize: 14.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50, // set the height here
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: const BorderSide(color: Colors.green),
                ),
                backgroundColor: Colors.green,
                textStyle: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return CustomBottomModalSheet(
                      height: 350.0,
                      title: "Check Out",
                      onBack: () {
                        Navigator.pop(context);
                      },
                      content: Form(
                        key: _checkOutFormKey,
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    controller: _usernameController,
                                    hintText: "Your name",
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your name";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller: _phoneController,
                                    hintText: "Phone",
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your phone";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomTextField(
                                    controller: _addressController,
                                    hintText: "Address",
                                    keyboardType: TextInputType.text,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter your address";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_checkOutFormKey.currentState!
                                            .validate()) {
                                          // Navigator.pop(
                                          //   context,
                                          //   User(
                                          //       username: _emailController.text,
                                          //       password: _confirmController.text, id: '', token: ''),
                                          // );
                                          fillFormUser();
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                      child: const Text(
                                        "Continue",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Check out".toUpperCase(),
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
