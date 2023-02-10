import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:front_end/src/core/bloc/ui_state.dart';
import 'package:front_end/src/core/route/route_path.dart';
import 'package:front_end/src/features/timeoff/presentation/bloc/time_off_state.dart';

import '../../domain/entity/leave.dart';
import '../bloc/time_off_bloc.dart';

class TimeOffHomeScreen extends StatefulWidget {
  const TimeOffHomeScreen({Key? key}) : super(key: key);

  @override
  State<TimeOffHomeScreen> createState() => _TimeOffHomeScreenState();
}

class _TimeOffHomeScreenState extends State<TimeOffHomeScreen> {
  late final TimeOffCubit timeOffCubit = context.read();
  @override
  void initState() {
    super.initState();
    timeOffCubit.readTimeOffByUserId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          timeOffCubit.readTimeOffByUserId();
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Time off",
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.timeoffrequest);
                },
                icon: const Icon(Icons.calendar_month),
              )
            ],
          ),
          body: BlocBuilder<TimeOffCubit, UIState>(
            builder: (context, state) {
              if (state is ReadTimeOffSuccessState) {
                return ListView.builder(
                    itemCount: state.value.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.share,
                              label: 'Cancel',
                            ),
                          ],
                        ),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Color(0xFF7BC043),
                              foregroundColor: Colors.white,
                              icon: Icons.archive,
                              label: 'Approve',
                            ),
                          ],
                        ),

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: TimeOffWidget(leave: state.value[index]),
                      );
                    });
                return Text("data");
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}

class TimeOffWidget extends StatelessWidget {
  const TimeOffWidget({Key? key, required this.leave}) : super(key: key);
  final Leave leave;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.network(
                  FirebaseAuth.instance.currentUser!.photoURL ??
                      "https://cdn3.iconfinder.com/data/icons/login-5/512/LOGIN_6-512.png",
                  scale: 12,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(FirebaseAuth.instance.currentUser!.email!),
              ],
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Leave type: ${leave.leaveType}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Status: ${leave.status}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "Start date: ${leave.fromDate} - ${leave.fromDateType}",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              "End date: ${leave.toDate} - ${leave.toDateType}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Description: ${leave.description}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
