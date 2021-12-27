import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qaformgenerator/model/file_data_model.dart';
import 'package:intl/intl.dart';

/// Question Form Model
/// @author: lienkt
class QuestionFormModel extends ChangeNotifier {
  int _currentStep = 1;
  bool _nextButton = false;
  bool _prevButton = true;
  // Answer 1:
  String _enterpriseName = '';
  // Answer 2:
  String _answer2HtmlEditorText = '';
  List<File_Data_Model> _answer2ImgList = [];
  List<File_Data_Model> _answer2FileList = [];
  // Answer 3:
  List<File_Data_Model> _answer3FileList1 = [];
  List<File_Data_Model> _answer3FileList2 = [];
  // Answer 4:
  String _answer4HtmlEditorText = '';
  List<File_Data_Model> _answer4FileList = [];
  List<File_Data_Model> _answer4ImgList = [];
  // Answer 5:
  String _answer5HtmlEditorText = '';
  List<File_Data_Model> _answer5FileList = [];
  List<File_Data_Model> _answer5ImgList = [];
  // Answer 6:
  String _answer6HtmlEditorText = '';
  List<File_Data_Model> _answer6FileList = [];
  List<File_Data_Model> _answer6ImgList = [];
  // Answer 7:
  String _answer7HtmlEditorText = '';
  List<File_Data_Model> _answer7FileList = [];
  List<File_Data_Model> _answer7ImgList = [];
  // Answer 8:
  String _answer8HtmlEditorText = '';
  List<File_Data_Model> _answer8FileList = [];
  List<File_Data_Model> _answer8ImgList = [];
  // Answer 9:
  String _answer9HtmlEditorText = '';
  List<File_Data_Model> _answer9FileList = [];
  List<File_Data_Model> _answer9ImgList = [];
  // Answer 10:
  List<File_Data_Model> _answer10FileList = [];
  // Answer 11:
  String _answer11HtmlEditorText = '';
  List<File_Data_Model> _answer11FileList = [];
  List<File_Data_Model> _answer11ImgList = [];
  // Answer 12:
  String _answer12HtmlEditorText = '';
  List<File_Data_Model> _answer12FileList = [];
  List<File_Data_Model> _answer12ImgList = [];
  // Answer 13:
  String _answer13HtmlEditorText = '';
  List<File_Data_Model> _answer13FileList = [];
  List<File_Data_Model> _answer13ImgList = [];
  // Answer 14:
  DateTime _answer14DeploymentDate = DateTime.now();
  // Answer 15:
  String _answer15Budget = '';
  // Answer 16:
  String _answer16Name = '';
  String _answer16Firstname = '';
  bool _answer16EmailValidate = true;
  String _answer16Email = '';
  String _answer16Phone = '';
  // Answer 17:
  String _answer17HtmlEditorText = '';
  List<File_Data_Model> _answer17FileList = [];
  List<File_Data_Model> _answer17ImgList = [];
  // Answer 18:
  bool _answer18EmailValidate = true;
  String _answer18Email = '';

  int get currentStep => _currentStep;

  /// increase step
  void increaseStep()
  {
    _currentStep ++;
    // Reset Next Button
    changeNextBtn();
    notifyListeners(); // when it change, it will notify to others
  }
  
  /// decrease step
  void decreaseStep()
  {
    _currentStep --;
    changeNextBtn();
    notifyListeners(); // when it change, it will notify to others
  }

  void changeNextBtn() {
    if(checkStep()) {
      setnextButton(true);
    } else {
      setnextButton(false);
    }
  }

  // Check content:
  bool checkStep() {
    switch (_currentStep) {
      case 1:
        return checkContent(_enterpriseName);
      case 2:
        // return checkContent(_answer2HtmlEditorText);
        return true;
      case 3:
        // return checkList(_answer3FileList1) && checkList(_answer3FileList2);
        return true;
      case 4: 
        return checkContent(_answer4HtmlEditorText);
      case 5: 
        // return checkContent(_answer5HtmlEditorText);
        return true;
      case 6: 
        // return checkContent(_answer6HtmlEditorText);
        return true;
      case 7:
        return checkContent(_answer7HtmlEditorText);
      case 8:
        // return checkContent(_answer8HtmlEditorText);
        return true;
      case 9:
        // return checkContent(_answer9HtmlEditorText);
        return true;
      case 10:
        // return checkList(_answer10FileList);
        return true;
      case 11:
        // return checkContent(_answer11HtmlEditorText);
        return true;
      case 12:
        // return checkContent(_answer12HtmlEditorText);
        return true;
      case 13:
        // return checkContent(_answer13HtmlEditorText);
        return true;
      case 14:
        return checkDate(_answer14DeploymentDate);
      case 15:
        return checkContent(_answer15Budget);
      case 16:
        return checkContent(_answer16Name)
          && checkContent(_answer16Firstname)
          && checkContent(_answer16Email)
          && _answer16EmailValidate
          && checkContent(_answer16Phone);
      case 17:
        // return checkContent(_answer17HtmlEditorText);
        return true;
      case 18:
        return checkContent(_answer18Email) && _answer18EmailValidate;
      default:
        return false;
    }
  }

  bool checkContent(String content) {
    if (content.isNotEmpty) {
      return true;
    }
    return false;
  }
  
  bool checkList(List<File_Data_Model> content) {
    if (content.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool checkDate(DateTime content) {
    var date = DateFormat('d/M/y').format(content);
    if(DateFormat('d/M/y').format(DateTime.now()) != date) {
        return true;
    }
    return false;
  }

  // Next button:
  bool get nextButton => _nextButton;

  void setnextButton(bool enable) {
    _nextButton = enable;
    notifyListeners();
  }
  
  // Prev button:
  bool get prevButton => _prevButton;

  void setprevButton(bool enable) {
    _prevButton = enable;
    notifyListeners();
  }
  // Answer 1:
  String get enterpriseName => _enterpriseName;

  void setEnterpriseName(String newEnterpriseName) {
    _enterpriseName = newEnterpriseName;
    notifyListeners();
  }
  
  // Answer 2:
  String get answer2HtmlEditorText => _answer2HtmlEditorText;

  void setanswer2HtmlEditorText(String newHtmlEditorText) {
    _answer2HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer2FileList => _answer2FileList;

  void setanswer2FileList(List<File_Data_Model> newAnswer2FileList) {
    _answer2FileList = newAnswer2FileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer2ImgList => _answer2ImgList;

  void setanswer2ImgList(List<File_Data_Model> newAnswer2FileList) {
    _answer2ImgList = newAnswer2FileList;
    notifyListeners();
  }

  // Answer 3:
  List<File_Data_Model> get answer3FileList1 => _answer3FileList1;

  void setanswer3FileList1(List<File_Data_Model> newAnswer3FileList) {
    _answer3FileList1 = newAnswer3FileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer3FileList2 => _answer3FileList2;

  void setanswer3FileList2(List<File_Data_Model> newAnswer3FileList) {
    _answer3FileList2 = newAnswer3FileList;
    notifyListeners();
  }

  // Answer 4:
  String get answer4HtmlEditorText => _answer4HtmlEditorText;

  void setanswer4HtmlEditorText(String newHtmlEditorText) {
    _answer4HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer4FileList => _answer4FileList;

  void setanswer4FileList(List<File_Data_Model> newAnswerFileList) {
    _answer4FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer4ImgList => _answer4ImgList;

  void setanswer4ImgList(List<File_Data_Model> newAnswerFileList) {
    _answer4ImgList = newAnswerFileList;
    notifyListeners();
  }

  // Answer 5:
  String get answer5HtmlEditorText => _answer5HtmlEditorText;

  void setanswer5HtmlEditorText(String newHtmlEditorText) {
    _answer5HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer5FileList => _answer5FileList;

  void setanswer5FileList(List<File_Data_Model> newAnswerFileList) {
    _answer5FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer5ImgList => _answer5ImgList;

  void setanswer5ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer5ImgList = newAnswerImgList;
    notifyListeners();
  }


  // Answer 6:
  String get answer6HtmlEditorText => _answer6HtmlEditorText;

  void setanswer6HtmlEditorText(String newHtmlEditorText) {
    _answer6HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer6FileList => _answer6FileList;

  void setanswer6FileList(List<File_Data_Model> newAnswerFileList) {
    _answer6FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer6ImgList => _answer6ImgList;

  void setanswer6ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer6ImgList = newAnswerImgList;
    notifyListeners();
  }

  // Answer 7:
  String get answer7HtmlEditorText => _answer7HtmlEditorText;

  void setanswer7HtmlEditorText(String newHtmlEditorText) {
    _answer7HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer7FileList => _answer7FileList;

  void setanswer7FileList(List<File_Data_Model> newAnswerFileList) {
    _answer7FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer7ImgList => _answer7ImgList;

  void setanswer7ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer7ImgList = newAnswerImgList;
    notifyListeners();
  }

  // Answer 8:
  String get answer8HtmlEditorText => _answer8HtmlEditorText;

  void setanswer8HtmlEditorText(String newHtmlEditorText) {
    _answer8HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer8FileList => _answer8FileList;

  void setanswer8FileList(List<File_Data_Model> newAnswerFileList) {
    _answer8FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer8ImgList => _answer8ImgList;

  void setanswer8ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer8ImgList = newAnswerImgList;
    notifyListeners();
  }

  // Answer 9:
  String get answer9HtmlEditorText => _answer9HtmlEditorText;

  void setanswer9HtmlEditorText(String newHtmlEditorText) {
    _answer9HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer9FileList => _answer9FileList;

  void setanswer9FileList(List<File_Data_Model> newAnswerFileList) {
    _answer9FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer9ImgList => _answer9ImgList;

  void setanswer9ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer9ImgList = newAnswerImgList;
    notifyListeners();
  }

  // Answer 10:
  List<File_Data_Model> get answer10FileList => _answer10FileList;

  void setanswer10FileList(List<File_Data_Model> newAnswer10FileList) {
    _answer10FileList = newAnswer10FileList;
    notifyListeners();
  }

  // Answer 11:
  String get answer11HtmlEditorText => _answer11HtmlEditorText;

  void setanswer11HtmlEditorText(String newHtmlEditorText) {
    _answer11HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer11FileList => _answer11FileList;

  void setanswer11FileList(List<File_Data_Model> newAnswerFileList) {
    _answer11FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer11ImgList => _answer11ImgList;

  void setanswer11ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer11ImgList = newAnswerImgList;
    notifyListeners();
  }

  // Answer 12:
  String get answer12HtmlEditorText => _answer12HtmlEditorText;

  void setanswer12HtmlEditorText(String newHtmlEditorText) {
    _answer12HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer12FileList => _answer12FileList;

  void setanswer12FileList(List<File_Data_Model> newAnswerFileList) {
    _answer12FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer12ImgList => _answer12ImgList;

  void setanswer12ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer12ImgList = newAnswerImgList;
    notifyListeners();
  }
  
  // Answer 13:
  String get answer13HtmlEditorText => _answer13HtmlEditorText;

  void setanswer13HtmlEditorText(String newHtmlEditorText) {
    _answer13HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer13FileList => _answer13FileList;

  void setanswer13FileList(List<File_Data_Model> newAnswerFileList) {
    _answer13FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer13ImgList => _answer13ImgList;

  void setanswer13ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer13ImgList = newAnswerImgList;
    notifyListeners();
  }
  
  // Answer 14:
  DateTime get answer14DeploymentDate => _answer14DeploymentDate;

  void setanswer14DeploymentDate(DateTime date) {
    _answer14DeploymentDate = date;
    notifyListeners();
  }
  
  // Answer 15:
  String get answer15Budget => _answer15Budget;

  void setanswer15Budget(String budget) {
    _answer15Budget = budget;
    notifyListeners();
  }
  
  // Answer 16:
  String get answer16Name => _answer16Name;

  void setanswer16Name(String name) {
    _answer16Name = name;
    notifyListeners();
  }

  String get answer16Firstname => _answer16Firstname;

  void setanswer16Firstname(String firstname) {
    _answer16Firstname = firstname;
    notifyListeners();
  }

  bool get answer16EmailValidate => _answer16EmailValidate;

  void setanswer16EmailValidate(bool val) {
    _answer16EmailValidate = val;
    notifyListeners();
  }

  String get answer16Email => _answer16Email;

  void setanswer16Email(String email) {
    _answer16Email = email;
    notifyListeners();
  }
  
  String get answer16Phone => _answer16Phone;

  void setanswer16Phone(String phone) {
    _answer16Phone = phone;
    notifyListeners();
  }
  
  // Answer 17:
  String get answer17HtmlEditorText => _answer17HtmlEditorText;

  void setanswer17HtmlEditorText(String newHtmlEditorText) {
    _answer17HtmlEditorText = newHtmlEditorText;
    notifyListeners();
  }
  List<File_Data_Model> get answer17FileList => _answer17FileList;

  void setanswer17FileList(List<File_Data_Model> newAnswerFileList) {
    _answer17FileList = newAnswerFileList;
    notifyListeners();
  }
  List<File_Data_Model> get answer17ImgList => _answer17ImgList;

  void setanswer17ImgList(List<File_Data_Model> newAnswerImgList) {
    _answer17ImgList = newAnswerImgList;
    notifyListeners();
  }
  
  // Answer 18:
  bool get answer18EmailValidate => _answer18EmailValidate;

  void setanswer18EmailValidate(bool val) {
    _answer18EmailValidate = val;
    notifyListeners();
  }

  String get answer18Email => _answer18Email;

  void setanswer18Email(String email) {
    _answer18Email = email;
    notifyListeners();
  }
  
}
