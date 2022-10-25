import 'package:flutter/material.dart';

enum Week {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class SubjectInfo {
  SubjectInfo(this.subjectMap);
  final Map subjectMap;

  int getIndex() {
    return subjectMap['index'];
  }

  String getLesson() {
    return subjectMap['lesson'];
  }
}

class Schedule {
  Schedule(this.scheduleMap);
  final Map scheduleMap;

  String getDayIndex() {
    return scheduleMap['day'];
  }

  String getDayName() {
    String name = Week.values[scheduleMap['day']].name;
    return name[0].toUpperCase() + name.substring(1);
  }

  List<SubjectInfo> getSubjects() {
    List<SubjectInfo> subjects =
        (scheduleMap['subjects'] as List).map((s) => SubjectInfo(s)).toList();
    subjects.sort((s1, s2) => s1.getIndex() - s2.getIndex());
    return subjects;
  }
}

class DaySchedule {
  DaySchedule(this.dayScheduleMap);
  final List dayScheduleMap;

  Schedule getScheduleForDay(int dayIndex) {
    return Schedule(dayScheduleMap[dayIndex]);
  }
}

class Data {
  Data();

  final Map<int, List<int>> timingMap = {
    1: [8, 30],
    2: [10, 30],
    3: [12, 10],
    4: [14, 15],
    5: [16, 00],
    6: [17, 40],
  };

  final Map<String, List> dataMap = {
    'ki-48': [
      {
        'day': 0,
        'subjects': [
          {'lesson': 'технології проектування компютерних систем', 'index': 1},
          {'lesson': 'архітектура компютерних систем', 'index': 2},
          {'lesson': 'захист інформації в компютерних системах', 'index': 3},
        ]
      },
      {
        'day': 1,
        'subjects': [
          {'lesson': 'діагностика компютерних засобів', 'index': 3},
          {'lesson': 'архітектура компютерних систем', 'index': 4},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'lesson': 'архітектура компютерних систем', 'index': 3},
          {'lesson': 'КЗОС', 'index': 4},
          {'lesson': 'мобільні додатки', 'index': 6},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'lesson': 'технології проектування компютерних систем', 'index': 4},
          {'lesson': 'архітектура компютернних систем', 'index': 5},
          {'lesson': 'ПКСОСЗ', 'index': 6},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'lesson': 'діагностика компютерних систем', 'index': 2},
          {'lesson': 'КЗОС', 'index': 5},
          {'lesson': 'захист інформації в компютерних системах', 'index': 6},
        ]
      }
    ],
    'kb-48': [
      {
        'day': 0,
        'subjects': [
          {'lesson': 'САіУД', 'index': 1},
          {'lesson': 'СФшУД', 'index': 2},
        ]
      },
      {
        'day': 1,
        'subjects': [
          {'lesson': 'ОБЖ', 'index': 4},
          {'lesson': 'БПЗ', 'index': 6},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'lesson': 'ОБЖ', 'index': 3},
          {'lesson': 'ОБЖ', 'index': 4},
          {'lesson': 'ПК', 'index': 6},
          {'lesson': 'САіУД', 'index': 6},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'lesson': 'АШПЗ', 'index': 1},
          {'lesson': 'ТРІІБ', 'index': 5},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'lesson': 'ПК', 'index': 2},
          {'lesson': 'БХТ', 'index': 3},
          {'lesson': 'ТРІІБ', 'index': 4},
        ]
      },
      {
        'day': 5,
        'subjects': [
          {'lesson': 'АШПЗ', 'index': 1},
          {'lesson': 'БХТ', 'index': 2},
          {'lesson': 'СЯВ', 'index': 3},
        ]
      }
    ],
    'kn-408': [
      {
        'day': 0,
        'subjects': [
          {'lesson': 'МДК', 'index': 2},
          {'lesson': 'УП', 'index': 3},
        ]
      },
      {
        'day': 1,
        'subjects': [
          {'lesson': 'МП', 'index': 4},
          {'lesson': 'А САПР', 'index': 5},
        ]
      },
      {
        'day': 2,
        'subjects': [
          {'lesson': 'ТПР', 'index': 1},
          {'lesson': 'А СПР', 'index': 2},
          {'lesson': 'МДК', 'index': 3},
          {'lesson': 'ТПР', 'index': 5},
        ]
      },
      {
        'day': 3,
        'subjects': [
          {'lesson': 'УП', 'index': 1},
          {'lesson': 'МП', 'index': 2},
          {'lesson': 'УП', 'index': 3},
          {'lesson': 'МСТО', 'index': 4},
        ]
      },
      {
        'day': 4,
        'subjects': [
          {'lesson': 'А САПР', 'index': 4},
        ]
      },
    ],
  };

  List<String> getClassName() {
    return dataMap.keys.toList() as List<String>;
  }

  DaySchedule getClassSchedule(String className) {
    return DaySchedule(dataMap[className]!);
  }

  String getTiming(int index) {
    List<int> time = timingMap[index]!;
    return '${time[0]}:${time[1]}';
  }
}
