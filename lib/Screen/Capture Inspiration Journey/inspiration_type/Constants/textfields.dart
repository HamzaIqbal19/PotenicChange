import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:potenic_app/utils/app_dimensions.dart';

class InspirationTextFields {
  Widget titleCustomTextField({
    controller,
    context,
    String? Function(String?)? validator,
    String hintText = '',
  }) {
    return TextFormField(
      key: PageStorageKey('textkeyvalue'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Title is Empty";
        }
      },
      controller: controller,
      maxLines: null,
      textAlignVertical: TextAlignVertical.top,
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
          fontSize: AppDimensions.font10(context) * 1.8,
          fontWeight: FontWeight.w500,
          color: const Color(0xff282828)),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(
            AppDimensions.height10(context) * 1.5,
            0,
            AppDimensions.height10(context) * 4,
            0),
        hintText: 'Give your inspiration a title',
        hintStyle: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.8,
            fontWeight: FontWeight.w500,
            color: const Color(0xff828282)),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        // const OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.transparent)),
        enabledBorder: InputBorder.none,
        //  const OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.transparent))
      ),
    );
  }

  Widget inspirationCustomTextField({controller, context, maxlength}) {
    return TextFormField(
      key: PageStorageKey('textkeyvalue'),
      validator: (value) {
        if (value!.isEmpty) {
          return "Inspiration is Empty";
        }
      },
      controller: controller,
      textAlignVertical: TextAlignVertical.top,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      maxLength: maxlength,
      style: TextStyle(
          fontSize: AppDimensions.font10(context) * 1.8,
          fontWeight: FontWeight.w500,
          color: const Color(0xff282828)),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(
            AppDimensions.height10(context) * 1.5,
            0,
            AppDimensions.height10(context) * 4,
            0),
        hintText: 'Say more about this inspiration',
        hintStyle: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.8,
            fontWeight: FontWeight.w500,
            color: const Color(0xff828282)),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        // const OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.transparent)),
        enabledBorder: InputBorder.none,
        // const OutlineInputBorder(
        //     borderSide: BorderSide(
        //         color: Colors.transparent))
      ),
    );
  }

  Widget tagsCustomTextField(
      {controller,
      context,
      List<String>? tagList,
      List<String>? stringTagList}) {
    return TextFormField(
        key: PageStorageKey('textkeyvalue'),
        controller: controller,
        textCapitalization: TextCapitalization.sentences,
        maxLines: null,
        onTap: () {
          if (controller.text.isEmpty) {
            controller.text = '#';
          }
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        },
        scrollPadding: EdgeInsets.zero,
        onChanged: (text) {
          // Split the text by space to detect hashtags on the same line
          List<String> spacewords =
              text.split(RegExp(r'(\s+)')); // Handle spaces, tabs, and newlines
          List<String> words = text.split('\n'); // Split by new lines

          // Detect hashtags from spacewords (this will detect multiple hashtags on the same line)
          List<String> tags = spacewords
              .where((word) => word.startsWith('#') && word.length > 1)
              .toList();

          // Prepend # to any word that doesn't have it
          for (int i = 0; i < words.length; i++) {
            // Split each line by space to check each word
            List<String> lineWords = words[i].split(' ');

            for (int j = 0; j < lineWords.length; j++) {
              // Add hashtag only if it's a word and not already starting with #
              if (lineWords[j].isNotEmpty && !lineWords[j].startsWith('#')) {
                lineWords[j] = '#' + lineWords[j];
              }
            }

            // Rejoin words in the line with space and update
            words[i] = lineWords.join(' ');
          }

          // Update the text in the field only if there's a change
          String updatedText = words.join('\n');
          if (updatedText != text) {
            controller.value = controller.value.copyWith(
              text: updatedText,
              selection: TextSelection.fromPosition(
                TextPosition(
                    offset: updatedText.length), // Maintain cursor position
              ),
            );
          }

          // Detect hashtags again from updated words
          tags = spacewords
              .where((word) => word.startsWith('#') && word.length > 1)
              .toList();

          // Prepare the final list of hashtags without the # prefix
          List<String> finalResult =
              tags.map((tag) => '"${tag.replaceAll('#', '')}"').toList();

          // Clear the previous list and add unique tags
          tagList?.clear();
          tagList?.addAll(finalResult.toSet());
        },
        textAlignVertical: TextAlignVertical.top,
        style: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.8,
            fontWeight: FontWeight.w500,
            color: const Color(0xff282828)),
        decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.fromLTRB(
                AppDimensions.height10(context) * 1.5,
                0,
                AppDimensions.height10(context) * 4,
                0),
            hintText: 'Add #hashtags',
            hintStyle: TextStyle(
                fontSize: AppDimensions.font10(context) * 1.8,
                fontWeight: FontWeight.w500,
                color: const Color(0xff828282)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
        inputFormatters: [
          TextInputFormatter.withFunction((oldValue, newValue) {
            if (newValue.text.isNotEmpty && !newValue.text.startsWith('#')) {
              return TextEditingValue(
                text: '#${newValue.text}',
                selection:
                    TextSelection.collapsed(offset: newValue.text.length + 1),
              );
            }
            return newValue;
          }),
        ]);
  }

  Widget linkCustomTextField(
      {controller,
      context,
      String? Function(String?)? validator,
      void Function()? onEditing,
      void Function(String)? onchange}) {
    return TextFormField(
      onEditingComplete: onEditing,
      validator: validator,

      // () {
      //   setState(() {
      //     // link_state = true;
      //   });
      // },
      textCapitalization: TextCapitalization.sentences,
      onChanged: onchange,
      //  (value) {
      //   setState(() {});
      // },
      controller: controller,
      maxLines: null,
      minLines: null,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
          fontSize: AppDimensions.font10(context) * 1.8,
          fontWeight: FontWeight.w500,
          color: const Color(0xff282828)),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.fromLTRB(
            AppDimensions.height10(context) * 1.5,
            AppDimensions.height10(context) * 0,
            0,
            0),
        hintText: 'Add a link',
        hintStyle: TextStyle(
            fontSize: AppDimensions.font10(context) * 1.8,
            fontWeight: FontWeight.w500,
            color: const Color(0xff828282)),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        //  const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.transparent)),
        enabledBorder: InputBorder.none,
        // const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.transparent))
      ),
    );
  }
}
