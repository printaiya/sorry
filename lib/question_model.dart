class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];

  list.add(Question('Как указать комментарий?', [
    Answer('//* здесь комментарий', false),
    Answer('// здесь комментарий', true),
    Answer('/ здесь комментарий', false),
    Answer('- здесь комментарий', false),
  ]));

  list.add(Question('Какое слово отвечает \nза создание константы?', [
    Answer('dynamic', false),
    Answer('const', true),
    Answer('last', false),
    Answer('var', false),
  ]));

  list.add(Question(
      'Укажите строку, где присутствует \n НЕ корректный вывод информации', [
    Answer('print("John*s");', false),
    Answer('print("John");', false),
    Answer('print(' 'text' ');', false),
    Answer('print(slash / - );', true),
  ]));

  list.add(Question('Каким будет x? \n int x = 2 + 1;', [
    Answer('3', true),
    Answer('4', false),
    Answer('1', false),
    Answer('2', false),
  ]));

  list.add(Question('Какая компания создала Dart?', [
    Answer('Сторонняя, не крупная компания', false),
    Answer('Microsoft', false),
    Answer('FaceBook', false),
    Answer('Google', true),
  ]));

  list.add(Question('Что покажет код ниже? \n const a = 5; a++; print(a);', [
    Answer('Будет ошибка выполнения программы', true),
    Answer('Ошибку, так как идет неверный вывод информации', false),
    Answer('Будет выведено 6', false),
    Answer('Будет выведено 5', false),
  ]));

  list.add(Question('Ближайший конкурент...', [
    Answer('Node JS', false),
    Answer('Unity', false),
    Answer('React Native', true),
    Answer('html/css', false),
  ]));
  list.add(
      Question('Что покажет данный код? \n int main() {print(' 'Hello' ');}', [
    Answer('Возвращаемый тип должен быть «void»', true),
    Answer('Функция должна быть названа как Main', false),
    Answer('В функцию должны быть переданы параметры', false),
    Answer('Ничего не будет выведено, ведь функция не была вызвана', false),
  ]));

  return list;
}
