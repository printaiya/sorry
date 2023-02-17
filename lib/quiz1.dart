import 'package:flutter/material.dart';
import 'package:irai/question_model.dart';

class FQuizScreen extends StatefulWidget {
  const FQuizScreen({super.key});

  @override
  State<FQuizScreen> createState() => _FQuizScreenState();
}

class _FQuizScreenState extends State<FQuizScreen> {
  //Models
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //head
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff034B73),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 125,
                ),
                const Text(
                  'Тест',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff161616),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _questionNumbersWidget(),
          const SizedBox(
            height: 20,
          ),
          _questionWidget(), //Вопросы
          _answerList(), //Ответы
          const SizedBox(
            height: 50,
          ),
          _nextButton() //Следующий пейдж
        ],
      ),
    );
  }

//Виджет вопросы
  _questionWidget() {
    return SizedBox(
      width: 400,
      height: 80,
      child: Column(
        children: [
          // Text(
          //     'Questions ${currentQuestionIndex + 1}/${questionList.length.toString()}'),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              questionList[currentQuestionIndex].questionText,
              style: const TextStyle(
                  color: Color(0xff474747),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

//Виджет ответы
  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        child: Text(
          answer.answerText,
          style: const TextStyle(
            color: Color(0xff4A4646),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(335, 48),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xff034B73)),
                borderRadius: BorderRadius.circular(10)),
            primary: isSelected ? const Color(0xff034B73) : Colors.white,
            onPrimary: isSelected ? Colors.white : const Color(0xff034B73)),
        onPressed: () {
          if (selectedAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
          }
          setState(() {
            selectedAnswer = answer;
          });
        },
      ),
    );
  }

//Виджет следующая стр
  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
      width: 334,
      height: 48,
      child: ElevatedButton(
        child: Text(
          isLastQuestion ? 'Закончить попытку' : 'Следующий',
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xff034B73)),
              borderRadius: BorderRadius.circular(10)),
          primary: const Color(0xff034B73),
          onPrimary: Colors.white,
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            setState(() {
              selectedAnswer = null;
              currentQuestionIndex++;
            });
          }
        },
      ),
    );
  }

//Виджет окошка для очков
  _showScoreDialog() {
    if (score >= questionList.length * 0.6) {}
    return AlertDialog(
        title: Text(
          'Очки: $score',
          style: const TextStyle(color: Color(0xff034B73)),
        ),
        content: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff034B73),
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xff034B73)),
                borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text(
            'Повторить',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          onPressed: (() {
            Navigator.pop(context);
            setState(() {
              currentQuestionIndex = 0;
              score = 0;
              selectedAnswer = null;
            });
          }),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  _questionNumbersWidget() {
    return Center(
      child: SizedBox(
        width: 424,
        height: 50,
        // child: ListView(
        //   scrollDirection: Axis.horizontal,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: const Color(0xffEBF2FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            '${currentQuestionIndex + 1}/${questionList.length.toString()}',
            style: TextStyle(
                color: Color(0xff034B73),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          )),
        ),
      ),
    );
  }
}
