import 'package:flutter/material.dart';
import 'package:learn_provider/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child:
                Consumer<HomePageProvider>(builder: (context, provider, child) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(provider.eligibilityMassage.toString(),
                        style: TextStyle(
                            color: (provider.isEligible == true)
                                ? Colors.green
                                : Colors.red)),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(hintText: "Enter Your Age"),
                      controller: tController,
                      onChanged: (value) =>
                          provider.checkEligibility(int.parse(value)),
                    ),
                  ],
                ),
              );
            })),
      ),
    );
  }
}
