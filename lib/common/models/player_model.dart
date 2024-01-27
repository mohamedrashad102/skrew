// class PlayerModel {
//   late String name;
//   late List<int?> scores;

//   PlayerModel({
//     this.name = '',
//   }) {
//     scores = List.generate(5, (index) => null);
//   }

//   int get total => _calcTotal();

//   void changeScore({
//     required int? score,
//     required int roundIndex,
//   }) {
//     if (roundIndex < 0 || roundIndex >= scores.length) return;
//     scores[roundIndex] = score;
//   }

//   void changeName({
//     required String name,
//   }) {
//     this.name = name;
//   }

//   int _calcTotal() {
//     int sum = 0;
//     for (var element in scores) {
//       if (element != null) {
//         sum += element;
//       }
//     }
//     return sum;
//   }
// }
