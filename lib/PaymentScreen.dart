// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'widgets/BoldText.dart';
import 'widgets/LightText.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withValues(alpha: 0.3),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 35.0, top: 20.0),
                      child: Container(
                        height: 50,
                        child: Center(
                          child: Text(
                            'Payment Method',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              // ----------------- Credit Card Section -----------------
              Container(
                height: 320,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: BoldText(
                          title: 'Credit Card', size: 20, color: Colors.white),
                    ),
                    Expanded(
                      child: Center(
                        child: Stack(children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedPaymentMethod == 'Credit Card'
                                    ? Colors.orange
                                    : Colors.transparent,
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPaymentMethod = 'Credit Card';
                                  });
                                },
                                child: Image.asset(
                                  'assets/Credit_Card.jpeg',
                                  width: 320,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15, bottom: 210.0, top: 10.0),
                            child: Image.asset(
                              'assets/Visa.png',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Positioned(
                            bottom: 45,
                            left: 30,
                            child: BoldText(
                              title: 'TALAL NASIR',
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 110,
                            left: 35,
                            child: BoldText(
                              title: '1234 5678 9012 3456',
                              size: 20,
                              color: Colors.white,
                              letterSpacing: 4.0,
                            ),
                          ),
                          Positioned(
                            bottom: 75,
                            left: 28,
                            child: LightText(
                              title: 'Card Holder Name',
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 75,
                            left: 250,
                            child: LightText(
                              title: 'Expiry Date',
                              size: 13,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            left: 255,
                            child: BoldText(
                              title: '12/27',
                              size: 15,
                              color: Colors.white,
                              letterSpacing: 4.0,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // ----------------- Wallet Section -----------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Wallet';
                  });
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withValues(alpha: 0.3),
                    border: Border.all(
                      color: selectedPaymentMethod == 'Wallet'
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/wallet.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 8.0, top: 10.0, bottom: 8.0),
                        child: Text(
                          'Wallet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 15.0),
                        child: Text(
                          'Balance: \$ 100',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // ----------------- Google Pay Section -----------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Google Pay';
                  });
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withValues(alpha: 0.3),
                    border: Border.all(
                      color: selectedPaymentMethod == 'Google Pay'
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/Google.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 8.0, top: 10.0, bottom: 8.0),
                        child: Text(
                          'Google Pay',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // ----------------- Apple Pay Section -----------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Apple Pay';
                  });
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withValues(alpha: 0.3),
                    border: Border.all(
                      color: selectedPaymentMethod == 'Apple Pay'
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/Apple.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 8.0, top: 10.0, bottom: 8.0),
                        child: Text(
                          'Apple Pay',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),

              // ----------------- Amazon Pay Section -----------------
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPaymentMethod = 'Amazon Pay';
                  });
                },
                child: Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withValues(alpha: 0.3),
                    border: Border.all(
                      color: selectedPaymentMethod == 'Amazon Pay'
                          ? Colors.orange
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/amazon.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 8.0, top: 10.0, bottom: 8.0),
                        child: Text(
                          'Amazon Pay',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ----------------- Confirm Button Section -----------------
              Padding(
                padding: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Stacked Price & Amount Column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange, // Orange dollar sign
                                ),
                              ),
                              TextSpan(
                                text: ' 25.00',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // White amount
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Payment Confirmation'),
                                content: Text(
                                    'You have selected $selectedPaymentMethod as your payment method.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Confirm Payment',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}