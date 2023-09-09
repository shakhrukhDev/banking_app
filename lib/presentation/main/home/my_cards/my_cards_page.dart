import 'package:banking_app/constants/app_color.dart';
import 'package:banking_app/constants/routes/routes_name.dart';
import 'package:banking_app/constants/widgets/text_styles.dart';
import 'package:banking_app/presentation/main/home/my_cards/bloc/my_cards_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {

  Future<void> delete(String userId) async {
    await cards.doc(userId).delete();

  }


  final CollectionReference cards =
      FirebaseFirestore.instance.collection('cards');

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCardsBloc, MyCardsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor:  AppColors.blueColors,
            title: Text("My Cards", style: AppStyle.poppins20xW400White,),
            actions: [
              Padding(
                padding:  EdgeInsets.only(right: 16.w),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.addCard);
                    },
                    icon: Icon(Icons.add)),
              )
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: cards.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasError){
                return Text("Something went wrong",style: AppStyle.poppins16xW300Black,);
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.data?.size == 0){
                return Center(child: Text("You have no cards", style: AppStyle.poppins16xW300Black,));
              }
              return  Container(
                padding: EdgeInsets.all(8.w),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index){
                  var card = snapshot.data?.docs[index];
                  return InkWell(
                    onLongPress: (){

                      showDialog(context: context, builder: (_) => AlertDialog(
                        title: const Text("Delete"),
                        content: const Text("Delete this card"),
                        actions: [
                          TextButton(onPressed: (){delete(card!.id).whenComplete(() {
                            EasyLoading.dismiss().then((value) {Navigator.pop(context);});
                          });}, child: const Text("Yes")),
                          TextButton(onPressed: (){Navigator.pop(context);}, child: const Text("No"))
                        ],
                      ));
                    },
                    onTap: (){},
                    child: CreditCardWidget(
                      cardNumber: card?['cardNumber'],
                      expiryDate: card?['expiryDate'],
                      cardHolderName: card?['cardHolderName'],
                      cvvCode: card?['cvvCode'],
                      showBackView: false, onCreditCardWidgetChange: (CreditCardBrand ) {  },
                    ),
                  );
                }),
              );
            },
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
