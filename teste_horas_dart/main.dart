import 'dart:io';

void main() {
  try {
    var file = File('Horas.txt');
    var lines = file.readAsLinesSync();
    
    int totalHours = 0;
    int totalMinutes = 0;
    int totalSeconds = 0;

    for (var line in lines) {
      var durationParts = line.split(RegExp(r'\s+'));
      
      var hoursIndex = durationParts.indexOf('h');
      var minutesIndex = durationParts.indexOf('min');
      var secondsIndex = durationParts.indexOf('s');

      if (hoursIndex != -1) {
        var hours = int.parse(durationParts[hoursIndex - 1]);
        totalHours += hours;
      }

      if (minutesIndex != -1) {
        var minutes = int.parse(durationParts[minutesIndex - 1]);
        totalMinutes += minutes;
      }

      if (secondsIndex != -1) {
        var seconds = int.parse(durationParts[secondsIndex - 1]);
        totalSeconds += seconds;
      }
    }
    
    totalMinutes += totalSeconds ~/ 60;
    totalSeconds %= 60;
    totalHours += totalMinutes ~/ 60;
    totalMinutes %= 60;
    
    print('Tempo total: $totalHours h $totalMinutes min $totalSeconds s');
  } catch (e) {
    print('Ocorreu um erro: $e');
  }
}
