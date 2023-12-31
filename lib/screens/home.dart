import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/models/userProfile.dart';
import 'package:shapp/screens/_lib.dart';

import '../config/provider/homePageProvider.dart';

class Home extends ConsumerWidget {
  static const String routeName = "/home";
  //const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _dataEvent = UserProfile.eventProfile();
    final _dataCredit = UserProfile.quantiteCredit();
    final _dataSMS = UserProfile.credit_sms();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(appName),
            centerTitle: false,
            floating: true,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const Notifications(),
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SpendLess()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 24.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.align_vertical_bottom_outlined,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              const Divider(),
                              Text(
                                'Crédits',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: FutureBuilder(
                                        future: _dataCredit,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            // do something till waiting for data, we can show here a loader
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasData) {
                                            // we have the data, do stuff here
                                            final e = snapshot.data!;
                                            print("Current data: " + e);
                                            return Text(
                                              NumberFormat.compact(
                                                      locale: 'en_US')
                                                  .format(
                                                      double.tryParse('$e')),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white,
                                                  ),
                                            );
                                            // EventCard();
                                            // buildEvents(events);
                                          } else {
                                            // we did not recieve any data, maybe show error or no data available
                                            return Text("Error :");
                                          }
                                        }),
                                  ),
                                  CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => BuyCredit(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 24.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.event,
                                size: 30.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              const Divider(),
                              Text(
                                'Événements',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: FutureBuilder(
                                        future: _dataEvent,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            // do something till waiting for data, we can show here a loader
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasData) {
                                            // we have the data, do stuff here
                                            final e = snapshot.data!;
                                            return Text(
                                              NumberFormat.compact(
                                                      locale: 'en_US')
                                                  .format(
                                                      double.tryParse('$e')),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            );
                                            // EventCard();
                                            // buildEvents(events);
                                          } else {
                                            // we did not recieve any data, maybe show error or no data available
                                            return Text("Error :");
                                          }
                                        }),
                                  ),
                                  CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => const CreateEvent(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 24.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.message,
                                size: 30.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              const Divider(),
                              Text(
                                "Messages d'alert",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              const SizedBox(height: 16.0),
                              Row(
                                children: [
                                  Expanded(
                                    child: FutureBuilder(
                                        future: _dataSMS,
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            // do something till waiting for data, we can show here a loader
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasData) {
                                            // we have the data, do stuff here
                                            final e = snapshot.data!;
                                            return Text(
                                              NumberFormat.compact(
                                                      locale: 'en_US')
                                                  .format(
                                                      double.tryParse('$e')),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                            );
                                            // EventCard();
                                            // buildEvents(events);
                                          } else {
                                            // we did not recieve any data, maybe show error or no data available
                                            return Text("Error :");
                                          }
                                        }),
                                  ),
                                  CircleAvatar(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const BuyAlertMessages(),
                                          ),
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpendLess extends StatelessWidget {
  const SpendLess({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          )),
      child: Column(
        children: [
          Text(
            "Dépensez moins et gagnez du temps pour vos événements !",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.height * 0.035,
                ),
          ),
        ],
      ),
    );
  }
}
