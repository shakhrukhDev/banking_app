import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/home/add_card_page/bloc/add_card_page_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardPagePage extends StatefulWidget {
  const AddCardPagePage({super.key});

  @override
  State<AddCardPagePage> createState() => _AddCardPagePageState();
}

class _AddCardPagePageState extends State<AddCardPagePage> {
  final CollectionReference cards =
      FirebaseFirestore.instance.collection('cards');
  User? user = FirebaseAuth.instance.currentUser;

  Future<void> saveCreditCard(Map<String, dynamic> values) async {
    await cards.add(values);
  }

 /* Future<void> create([DocumentSnapshot? documentSnapshot]) async {

    if(documentSnapshot != null){
      cardNumberController.text = documentSnapshot['number'].toString();
      expiryDateController.text = documentSnapshot['expiry date'];
      cvvController.text = documentSnapshot['cvv'].toString();
      cardHolderController.text = documentSnapshot['card holder'];
    }
  }
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();*/

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCardPageBloc, AddCardPageState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.teal[50],
          appBar: AppBar(
            elevation: 0,
            backgroundColor:  AppColors.blueColors,
            title: Text("Add Card", style: AppStyle.poppins20xW400White,),
          ),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  onCreditCardWidgetChange: (CreditCardBrand) {},
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.blue,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'xxxx xxxx xxxx xxxx'),
                        expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'xx/xx'),
                        cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx'),
                        cardHolderDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ), backgroundColor: Color(0xff61c717)),
                        child: Text(
                          'Add Card',
                          style: AppStyle.poppins14xW500White,
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            EasyLoading.show(status: "Please wait ...");
                            saveCreditCard(
                              {
                                'cardNumber': cardNumber,
                                'expiryDate': expiryDate,
                                'cardHolderName': cardHolderName,
                                'cvvCode': cvvCode,
                                'showBackView': false,
                                'uid': user?.uid,
                              },
                            ).whenComplete(() {
                              EasyLoading.showSuccess("Card added successfully").then((value) {Navigator.pop(context);});
                            });
                          } else {
                            print('Try again');
                          }
                        },
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
