import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameapp/src/apps/providers/game_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ListData = Provider.of<GameProvider>(context).numbers;
    print(ListData);
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/clock.png'),
                    10.horizontalSpace,
                    const Text(
                      '10',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const Spacer(),
                    Image.asset('assets/icons/money.png'),
                    10.horizontalSpace,
                    const Text(
                      '60',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ],
                ),
                25.verticalSpace,
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 22,
                  ),
                  itemCount: ListData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        splashColor: Colors.white,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 58, vertical: 22),
                                  alignment: Alignment.center,
                                  width: 365.dg,
                                  height: 265.dg,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Sorry, you lose',
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      12.verticalSpace,
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Your score: ',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24,
                                                color: Colors.black),
                                          ),
                                          Text('20',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 72,
                                                  color: Colors.red)),
                                        ],
                                      ),
                                      12.verticalSpace,
                                      Material(
                                        borderRadius: BorderRadius.circular(20),
                                        clipBehavior: Clip.hardEdge,
                                        child: InkWell(
                                          splashColor: Colors.amber,
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: const Color(0xff1fc5ea),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            width: 214.dg,
                                            height: 69.dg,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/icons/replay.png'),
                                                15.horizontalSpace,
                                                const Text(
                                                  'Try again',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Colors
                                .primaries[index % Colors.primaries.length],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              '${ListData[index]}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
