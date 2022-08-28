import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_bloc.dart';
import 'package:wallet_app/hackathon_directory/soft_skills/presentation/pages/bloc/soft_skills_state.dart';

import '../../domain/entity/recruiter.dart';

class ListProfilePage extends StatefulWidget {
  final Recruiter recruiter;

  const ListProfilePage({required this.recruiter, Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListProfilePageState();
  }
}

class _ListProfilePageState extends State<ListProfilePage> {
  DateTime chosenDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black.withOpacity(0.6),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Recruiter profile',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocProvider<SoftSkillsBloc>(
        create: (context) => CherryPick.openScope(scopeName: 'appScope')
            .resolve<SoftSkillsBloc>(),
        child: BlocBuilder<SoftSkillsBloc, SoftSkillsState>(
          builder: (context, index) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Image.network(
                                'https://www.seekpng.com/png/full/258-2585503_girl-laptop-.png',
                                height: 200,
                                width: 200,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                widget.recruiter.firstName,
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.recruiter.position,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      '${widget.recruiter.rating}',
                                    ),
                                  ),
                                  const SizedBox(width: 7),
                                  RatingBar.builder(
                                    itemSize: 23,
                                    initialRating: widget.recruiter.rating,
                                    ignoreGestures: true,
                                    allowHalfRating: true,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rat) {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Количество собеседований: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '${widget.recruiter.interviewCount}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'В час: ${widget.recruiter.rate} USD',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'О себе: ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      widget.recruiter.description,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12.0),
                                      ),
                                    ),
                                    builder: (context) {
                                      return SafeArea(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              SfDateRangePicker(
                                                minDate: DateTime(1970),
                                                maxDate: DateTime(2030),
                                                enablePastDates: false,
                                                initialSelectedDate:
                                                    DateTime.now(),
                                                monthViewSettings:
                                                    DateRangePickerMonthViewSettings(
                                                  blackoutDates: widget
                                                      .recruiter.blackoutDates,
                                                ),
                                                showNavigationArrow: true,
                                                onSelectionChanged:
                                                    (DateRangePickerSelectionChangedArgs
                                                        args) {
                                                  if (args.value is DateTime) {
                                                    setState(() {
                                                      chosenDate = args.value;
                                                    });
                                                  }
                                                },
                                              ),
                                              const SizedBox(height: 30),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary:
                                                      const Color(0xFF000616),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 12),
                                                  child: Text(
                                                    'Подтвердить',
                                                    style: TextStyle(
                                                      fontSize: 20,
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
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.5)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        DateFormat('dd.MM.yyyy')
                                            .format(chosenDate),
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Icon(
                                        Icons.calendar_today,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF000616),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: MediaQuery.of(context).size.height - 150,
                            ),
                            content: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Заявка успешно создана'
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          'Создать заявку',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
