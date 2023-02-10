import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front_end/src/core/bloc/ui_state.dart';
import 'package:front_end/src/features/timeoff/presentation/bloc/time_off_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/route/route_path.dart';
import '../bloc/time_off_state.dart';

class TimeOffRequestScreen extends StatefulWidget {
  const TimeOffRequestScreen({Key? key}) : super(key: key);

  @override
  State<TimeOffRequestScreen> createState() => _TimeOffRequestScreenState();
}

class _TimeOffRequestScreenState extends State<TimeOffRequestScreen> {
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController descriptionController;
  late final TimeOffCubit timeOffCubit = context.read();
  final List<String> listOfValue = ['Annual', 'UnPay', 'Sick'];
  final List<String> dateType = ['All day', 'Morning', 'Afternoon'];

  late String leaveType;
  late String startDateType;
  late String endDateType;
  DateTime selectedDate = DateTime.now();

  Future<DateTime?> _selectDate(BuildContext context) async {
    return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 1)),
      lastDate: DateTime(2025),
    );
  }

  @override
  void initState() {
    super.initState();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    descriptionController = TextEditingController();
    leaveType = listOfValue.first;
    startDateType = dateType.first;
    endDateType = dateType.first;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimeOffCubit, UIState>(
      listener: (context, state) {
        log(state.toString());
        if (state is CreateTimeOffSuccessState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Submit successfully"),
              ),
            );
          Navigator.pop(context);
        } else if (state is CreateTimeOffFailedState) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("Something wrong! Please try other"),
              ),
            );
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Time off request")),
            actions: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.calendar_month,
                    color: Color(0xFF337A5B),
                  ))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Leave type",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        leaveType = value.toString();
                      });
                    },
                    value: listOfValue.first,
                    items: listOfValue.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Start date",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    onTap: () async {
                      final value = await _selectDate(context);
                      if (value != null) {
                        setState(() {
                          startDateController.text =
                              DateFormat("dd/MM/yyyy").format(value);
                        });
                      }
                    },
                    readOnly: true,
                    controller: startDateController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "hintText",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Start date type",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        startDateType = value.toString();
                      });
                    },
                    value: dateType.first,
                    items: dateType.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "End date",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    onTap: () async {
                      final value = await _selectDate(context);
                      if (value != null) {
                        setState(() {
                          endDateController.text =
                              DateFormat("dd/MM/yyyy").format(value);
                        });
                      }
                    },
                    readOnly: true,
                    controller: endDateController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green, width: 2),
                        ),
                        hintText: "hintText",
                        hintStyle: TextStyle(color: Colors.grey[500])),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "End date type",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  DropdownButtonFormField(
                    onChanged: (value) {
                      setState(() {
                        endDateType = value.toString();
                      });
                    },
                    value: dateType.first,
                    items: dateType.map((String val) {
                      return DropdownMenuItem(
                        value: val,
                        child: Text(
                          val,
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                      // fillColor: Colors.grey.shade200,
                      // filled: true,
                      hintText: "hintText",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                    maxLength: 1000,
                    maxLines: null,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (startDateController.text.isEmpty ||
                          endDateController.text.isEmpty ||
                          descriptionController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Please fill full information")));
                      } else {
                        timeOffCubit.createTimeOff(
                          leaveType,
                          startDateController.text,
                          startDateType,
                          endDateController.text,
                          endDateType,
                          descriptionController.text,
                        );
                      }
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          "Send request",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
