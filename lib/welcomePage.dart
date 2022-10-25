import 'schedule_data.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    late String name = arguments['firstName'];
    String selectedGroup = arguments['selectedGroup'];
    Data scheduleData = Data();
    DaySchedule groupSchedule = scheduleData.getClassSchedule(selectedGroup);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello $name Schedule for $selectedGroup'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        Flexible(
            child: SizedBox(
                width: 400,
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    Schedule daySchedule =
                        groupSchedule.getScheduleForDay(index);
                    List<SubjectInfo> subjects = daySchedule.getSubjects();
                    return ExpansionTile(
                        collapsedBackgroundColor: Color.fromARGB(15, 5, 11, 77),
                        backgroundColor: Color.fromARGB(15, 130, 205, 217),
                        title: Text(daySchedule.getDayName()),
                        subtitle: Text('subjects count : ${subjects.length}'),
                        children: subjects.map((subject) {
                          int subjectOrder = subject.getIndex();
                          return ListTile(
                              subtitle:
                                  Text(scheduleData.getTiming(subjectOrder)),
                              title: Text(
                                  '$subjectOrder. ${subject.getLesson()}'));
                        }).toList());
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                ))),
        Padding(
            padding: const EdgeInsets.all(5),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back')))
      ])),
    );
  }
}
