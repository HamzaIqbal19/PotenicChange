import 'package:flutter/material.dart';
import 'package:potenic_app/API/GoalModel.dart';

class GoalProvider extends ChangeNotifier {
  Goal? _currentGoal;

  Goal? get currentGoal => _currentGoal;

  void setGoal(Goal goal) {
    _currentGoal = goal;
    notifyListeners();
  }

  // Update the 'name' property
  void updateName(String newName) {
    if (_currentGoal != null) {
      _currentGoal!.name = newName;
      notifyListeners();
    }
  }

  // Update the 'reason' property
  void updateReason(List<Map<String, String>> newReason) {
    if (_currentGoal != null) {
      _currentGoal!.reason = newReason;
      notifyListeners();
    }
  }

  // Update the 'identityStatement' property
  void updateIdentityStatement(List<Map<String, String>> newIdentityStatement) {
    if (_currentGoal != null) {
      _currentGoal!.identityStatement = newIdentityStatement;
      notifyListeners();
    }
  }

  // Update the 'visualizingYourSelf' property
  void updateVisualizingYourSelf(
      List<Map<String, String>> newVisualizingYourSelf) {
    if (_currentGoal != null) {
      _currentGoal!.visualizingYourSelf = newVisualizingYourSelf;
      notifyListeners();
    }
  }

  // Update the 'userId' property
  void updateUserId(int newUserId) {
    if (_currentGoal != null) {
      _currentGoal!.userId = newUserId;
      notifyListeners();
    }
  }

  // Update the 'goalId' property
  void updateGoalId(int? newGoalId) {
    if (_currentGoal != null) {
      _currentGoal!.goalId = newGoalId;
      notifyListeners();
    }
  }

  // Update the 'goalCategoryId' property
  void updateGoalCategoryId(int newGoalCategoryId) {
    if (_currentGoal != null) {
      _currentGoal!.goalCategoryId = newGoalCategoryId;
      notifyListeners();
    }
  }

  void deleteCurrentGoal() {
    _currentGoal = null; // Set the current goal to null
    notifyListeners();
  }
}
