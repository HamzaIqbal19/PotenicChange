goalImages(String color) {
  if (color == '1') {
    return "assets/images/red_gradient.webp";
  } else if (color == '2') {
    return "assets/images/orange_moon.webp";
  } else if (color == '3') {
    return "assets/images/lightGrey_gradient.webp";
  } else if (color == '4') {
    return "assets/images/lightBlue_gradient.webp";
  } else if (color == '5') {
    return "assets/images/medBlue_gradient.webp";
  } else if (color == '6') {
    return "assets/images/Blue_gradient.webp";
  } else {
    return "assets/images/orange_moon.webp";
  }
}

practiceImages(String color) {
  if (color == '1') {
    return "assets/images/Ellipse orange_wb.webp";
  } else if (color == '2') {
    return "assets/images/Ellipse 158_wb.webp";
  } else if (color == '3') {
    return "assets/images/Ellipse 157_wb.webp";
  } else if (color == '4') {
    return "assets/images/Ellipse light-blue_wb.webp";
  } else if (color == '5') {
    return "assets/images/Ellipse blue_wb.webp";
  } else {
    return "assets/images/Ellipse 158_wb.webp";
  }
}

practiceImagesMissed(String color) {
  if (color == '1') {
    return "assets/images/Missed_3.webp";
  } else if (color == '2') {
    return "assets/images/Missed_1.webp";
  } else if (color == '3') {
    return "assets/images/Missed_2.webp";
  } else if (color == '4') {
    return "assets/images/Missed_4.webp";
  } else if (color == '5') {
    return "assets/images/Missed_4.webp";
  } else {
    return "assets/images/Missed_1.webp";
  }
}

practiceColor(String color) {
  if (color == '1') {
    return 0XFFFC7133;
  } else if (color == '2') {
    return 0xFF1A481C;
  } else if (color == '3') {
    return 0xFF6D4B77;
  } else if (color == '4') {
    return 0xFF5C75A6;
  } else if (color == '5') {
    return 0xFF315291;
  } else {
    return 0xFFFBFBFB;
  }
}

practiceBeforeColor(String color) {
  if (color == '0') {
    return 0xFF546096;
  } else if (color == '1') {
    return 0xFF7291A0;
  } else if (color == '2') {
    return 0xFFE1C44E;
  } else if (color == '3') {
    return 0xFFFF7C42;
  } else if (color == '4') {
    return 0xFF219653;
  } else {
    return 0xFF546096;
  }
}

practiceAfterColor(String color) {
  if (color == '1') {
    return 0XFFFC7133;
  } else if (color == '2') {
    return 0xFF1A481C;
  } else if (color == '3') {
    return 0xFF6D4B77;
  } else if (color == '4') {
    return 0xFF5C75A6;
  } else if (color == '5') {
    return 0xFF315291;
  } else {
    return 0xFFFBFBFB;
  }
}

goalLevel(String level) {
  if (level == '1') {
    return "assets/images/Nebula pie 1.webp";
  } else if (level == '2') {
    return "assets/images/Nebula pie 2.webp";
  } else if (level == '3') {
    return "assets/images/Nebula pie 3.webp";
  } else if (level == '4') {
    return "assets/images/Nebula pie 4.webp";
  } else if (level == '5') {
    return "assets/images/Nebula pie 5.webp";
  } else {
    return "assets/images/Nebula Pie.webp";
  }
}

goalLevelMessages(String level) {
  if (level == '1' || level == '0') {
    return "I feel I am not making any progress";
  } else if (level == '2') {
    return "I feel I am making small steps forward";
  } else if (level == '3') {
    return "I feel I am making considerable steps forward";
  } else if (level == '4') {
    return "I'm almost there";
  } else if (level == '5') {
    return "I'm continuously living my goal";
  }
}
