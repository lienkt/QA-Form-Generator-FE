import 'package:qaformgenerator/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/widgets/I18nText.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'components/header.dart';
import 'components/menu.dart';
import 'model/question_form.dart';
import 'pages/answer_10_pre_order.dart';
import 'pages/answer_11_questions.dart';
import 'pages/answer_12_special_requirement.dart';
import 'pages/answer_13_expected_delivery.dart';
import 'pages/answer_14_delivery_date.dart';
import 'pages/answer_15_budget.dart';
import 'pages/answer_16_receiver_info.dart';
import 'pages/answer_17_other_info.dart';
import 'pages/answer_18_email.dart';
import 'pages/answer_1_name.dart';
import 'pages/answer_2_describe_requirement.dart';
import 'pages/answer_3_avata.dart';
import 'pages/answer_4_cosmetic.dart';
import 'pages/answer_5_perfume.dart';
import 'pages/answer_6_clothes.dart';
import 'pages/answer_7_shoes.dart';
import 'pages/answer_8_bags.dart';
import 'pages/answer_9_foods.dart';

/// Main
/// @author: lienkt
Future main() async {
  await dotenv.load(fileName: ".env");
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      namespaces: ["common","question"],
      useCountryCode: false,
      fallbackDir: 'en',
      basePath: 'assets/i18n',
      forcedLocale: const Locale('en'),
    ),
    missingTranslationHandler: (key, locale) {
      print("--- Missing Key: $key, languageCode: ${locale!.languageCode}");
    },
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(flutterI18nDelegate));
}

class App extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  App(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {
    return 
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => QuestionFormModel()),
      ],
      child: MaterialApp(
        title: 'QA Form Generator',
        theme: ThemeData(
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body:  Homepage()
        ),
      localizationsDelegates: [
        flutterI18nDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      ),
    );
  }
}

/// Homepage to load header, menu, content, bottom
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _Homepage createState() => _Homepage();
}

class _Homepage extends State<Homepage> {
  int maxPages = 18; // maxPages MUST BE total number of step.
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Header(),
          Menu(activePart: getActivePart(), activeStep: context.watch<QuestionFormModel>().currentStep),
          const SizedBox(height: 47.0),
          SizedBox(
            height: screenSize.height - 272.0,
            child: ListView(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                question(),
                answer(),
                bottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Returns the bottom bar.
  Widget bottom() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        SizedBox(
          width: 711.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              previousButton(),
              nextButton(),
            ],
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }

  /// Returns the next button.
  Widget nextButton() {
    Color color = const Color.fromRGBO(231, 231, 231, 1);
    if (context.read<QuestionFormModel>().nextButton) {
      color = const Color.fromRGBO(255, 50, 133, 1);
    }
    if (context.watch<QuestionFormModel>().currentStep < 18 
        && context.watch<QuestionFormModel>().currentStep > 1) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(232, 47),
          textStyle: const TextStyle(fontSize: 16),
          primary: color,
        ),
        onPressed: () {
          if (context.read<QuestionFormModel>().nextButton) {
            context.read<QuestionFormModel>().increaseStep();
          }
        },
        child: Text(FlutterI18n.translate(context, "common.button.next").toUpperCase()),
                        
      );
    } else {
      return const SizedBox(width: 10, height:10);
    }
  }
  
  /// Returns the previous button.
  Widget previousButton() {
    Color color = const Color.fromRGBO(231, 231, 231, 1);
    if (context.read<QuestionFormModel>().prevButton) {
      color = const Color.fromRGBO(255, 50, 133, 1);
    } else {
      color = const Color.fromRGBO(231, 231, 231, 1);
    }
    if (context.watch<QuestionFormModel>().currentStep > 1 
        && context.watch<QuestionFormModel>().currentStep < 18) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(232, 47),
          textStyle: const TextStyle(fontSize: 16),
          primary: color,
        ),
        onPressed: () {
          if (context.read<QuestionFormModel>().prevButton) {
            context.read<QuestionFormModel>().decreaseStep();
          }
        },
        child: Text(FlutterI18n.translate(context, "common.button.pre").toUpperCase()),
      );
    } else {
      return const SizedBox(width: 10, height:10);
    }
  }

  /// Returns the question.
  Widget question() {
    String currentStep = context.watch<QuestionFormModel>().currentStep.toString();
    if (context.watch<QuestionFormModel>().currentStep < 19) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 930,
            child: I18nText(
              "question.question_" + currentStep, 
              child: const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(74, 74, 74, 1),
                  fontFamily: 'Merriweather',
                  fontSize: 36,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return const SizedBox(width: 10, height:1);
    }
  }

  /// Returns the answer.
  Widget answer() {
    switch (context.watch<QuestionFormModel>().currentStep) {
      case 1:
        return const Answer1();
      case 2:
        return const Answer2();
      case 3:
        return const Answer3();
      case 4: 
        return const Answer4();
      case 5: 
        return const Answer5();
      case 6: 
        return const Answer6();
      case 7:
        return const Answer7();
      case 8:
        return const Answer8();
      case 9:
        return const Answer9();
      case 10:
        return const Answer10();
      case 11:
        return const Answer11();
      case 12:
        return const Answer12();
      case 13:
        return const Answer13();
      case 14:
        return const Answer14();
      case 15:
        return const Answer15();
      case 16:
        return const Answer16();
      case 17:
        return const Answer17();
      case 18:
        return const Answer18();
      case 19:
        return const Result();
      default:
        return Container(
          width: 232.0,
          height: 51.0,
          margin: const EdgeInsets.only(top: 50),
          child: const Text(
            'page content',
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 234, 1),
              fontSize: 30,
              decoration: TextDecoration.none
            ),
          ),
        );
    }
 }

  // Returns the question text based on the activeStep.
  int getActivePart() {
    switch (context.watch<QuestionFormModel>().currentStep) {
      case 1: case 2: case 3: case 4: case 5: case 6: case 7: case 8: 
        return 1;
      case 9: case 10: 
        return 2;
      case 11: case 12: case 13: case 14: case 15: case 16: case 17: 
        return 3;
      case 18: case 19: 
        return 4;
      default:
        return 1;
    }
  }
}
