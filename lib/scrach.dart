import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result2 = await task2();
  task3(result2);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration duration = Duration(seconds: 3);
  String result;
  await Future.delayed(duration, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(String dataFromTask2) {
  String result = 'task 3 data';
  print('Task 3 complete. get data from task2: $dataFromTask2');
}
