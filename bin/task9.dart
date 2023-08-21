// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

void main() {
  sentanceDraw('Task 1');
  BMW bmw = BMW('X6', 'kerolos', 'black', 180);
  Toyota t1 = Toyota('Corolla', 'kerolos', 'grey', 100);
  bmw.speedUp();
  bmw.info();
  bmw.brake();
  bmw.info();
  t1.speedUp();
  t1.info();
  t1.brake();
  t1.info();

  sentanceDraw('Task 2');
  Player p1 = Player(
    name: 'Kerolos',
    age: 21,
    place: 'attack',
  );
  Player p2 = Player(
    name: 'Kerolos2',
    age: 21,
    place: 'defender',
  );

  Team leverbool = Team(
    name: 'leverbool',
    age: 50,
    trainer: 'Guardiola',
    attacks: [],
    defenders: [],
    goalkeepers: [],
  );

  leverbool.addPlayer(p1);
  leverbool.addPlayer(p2);
  leverbool.info();
}

class Car {
  final String name;
  final String owner;
  final String color;
  int speed;
  Car(
    this.name,
    this.owner,
    this.color,
    this.speed,
  );

  void speedUp() {}
  void brake() {}
  void info() {}
}

class BMW extends Car {
  BMW(super.name, super.owner, super.color, super.speed);

  @override
  void speedUp() {
    speed += 30;
  }

  @override
  void brake() {
    speed -= 30;
  }

  @override
  void info() {
    print(
        'My name is $owner, my car is $name, it is $color, and I am driving at $speed now');
  }
}

class Toyota extends Car {
  Toyota(
    String name,
    String owner,
    String color,
    int speed,
  ) : super(
          name,
          owner,
          color,
          speed,
        );

  @override
  void speedUp() {
    speed += 20;
  }

  @override
  void brake() {
    speed -= 20;
  }

  @override
  void info() {
    print(
        'My name is $owner, my car is $name, it is $color, and I am driving at $speed now');
  }
}

class Player {
  String name;
  int age;
  String place;

  Player({
    required this.name,
    required this.age,
    required this.place,
  });
}

class AttackPlayer extends Player {
  int numberOfGoals;
  AttackPlayer({
    required super.name,
    required super.age,
    required super.place,
    required this.numberOfGoals,
  });
}

class DefenderPlayer extends Player {
  int numberAssist;
  DefenderPlayer({
    required super.name,
    required super.age,
    required super.place,
    required this.numberAssist,
  });
}

class GoalkeeperPlayer extends Player {
  int cleanSheet;
  GoalkeeperPlayer({
    required super.name,
    required super.age,
    required super.place,
    required this.cleanSheet,
  });
}

class Team {
  String name;
  int age;
  String trainer;
  List<AttackPlayer> attacks;
  List<DefenderPlayer> defenders;
  List<GoalkeeperPlayer> goalkeepers;
  Team({
    required this.name,
    required this.age,
    required this.trainer,
    required this.attacks,
    required this.defenders,
    required this.goalkeepers,
  });

  void addPlayer(Player p) {
    if ((p.age > 18 && p.age < 30) && p.place == 'attack') {
      attacks.add(AttackPlayer(
          name: p.name, age: p.age, place: p.place, numberOfGoals: 0));
    } else if ((p.age > 18 && p.age < 30) && p.place == 'defender') {
      defenders.add(DefenderPlayer(
          name: p.name, age: p.age, place: p.place, numberAssist: 0));
    } else if ((p.age > 18 && p.age < 30) && p.place == 'goalkeeper') {
      goalkeepers.add(GoalkeeperPlayer(
          name: p.name, age: p.age, place: p.place, cleanSheet: 0));
    } else {
      print('Not suitable age !');
    }
  }

  void info() {
    print('Team is $name , Since => $age years \nwith Trainer : $trainer');
    sentanceDraw('Tema Members');
    if (attacks.isNotEmpty) {
      print('Attackers');
      attacks.forEach((element) {
        print('name : ${element.name} place : ${element.place}');
        print('-----------------------------------');
      });
    }
    if (defenders.isNotEmpty) {
      print('Defenders');
      defenders.forEach((element) {
        print('name : ${element.name} place : ${element.place}');
        print('-----------------------------------');
      });
    }
    if (goalkeepers.isNotEmpty) {
      print('Goalkeepers');
      goalkeepers.forEach((element) {
        print('name : ${element.name} place : ${element.place}');
        print('-----------------------------------');
      });
    }
  }
}

void sentanceDraw(String s) {
  print('');
  for (int i = 0; i < (s.length + 4); i++) {
    stdout.write('-');
  }
  print('\n| $s |');
  for (int i = 0; i < (s.length + 4); i++) {
    stdout.write('-');
  }
  print('');
}
