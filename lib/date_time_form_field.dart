library date_time_form_field;

import 'package:flutter/material.dart';

class DateTimeFormField extends FormField<DateTime> {
  DateTimeFormField(
      {Key key,
      Widget label,
      DateTime initialValue,
      DateTime firstDate,
      DateTime lastDate,
      Locale locale,
      FormFieldValidator<DateTime> validator})
      : super(
            key: key,
            initialValue: initialValue,
            builder: (FormFieldState<DateTime> state) {
              final TextEditingController controller = TextEditingController();
              controller.text = state.value.toString();
              return Builder(
                  builder: (context) => Column(children: <Widget>[
                        label == null ? Container() : label,
                        TextFormField(
                            controller: controller,
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              DateTime dateTime = await showDatePicker(
                                  context: context,
                                  initialDate: state.value,
                                  firstDate: firstDate,
                                  lastDate: lastDate,
                                  locale: locale);
                              if (dateTime != null) {
                                TimeOfDay timeOfDay = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay(
                                        hour: state.value.hour,
                                        minute: state.value.minute));
                                if (timeOfDay != null) {
                                  state.didChange(DateTime(
                                      dateTime.year,
                                      dateTime.month,
                                      dateTime.day,
                                      timeOfDay.hour,
                                      timeOfDay.minute));
                                }
                              }
                            })
                      ]));
            });
}
