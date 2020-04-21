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
      onSaved,
      ValueChanged<DateTime> onChanged,
      autovalidate = false,
      enabled = true,
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
            },
            onSaved: onSaved,
            autovalidate: autovalidate,
            enabled: enabled,
            validator: validator);
}

class DateFormField extends FormField<DateTime> {
  DateFormField(
      {Key key,
      Widget label,
      DateTime initialValue,
      DateTime firstDate,
      DateTime lastDate,
      Locale locale,
      onSaved,
      ValueChanged<DateTime> onChanged,
      autovalidate = false,
      enabled = true,
      FormFieldValidator<DateTime> validator})
      : super(
            key: key,
            initialValue: initialValue,
            builder: (FormFieldState<DateTime> state) {
              final TextEditingController controller = TextEditingController();
              controller.text = state.value
                  .toString(); // TODO: Usar formatação para apenas data
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
                                state.didChange(dateTime);
                              }
                            })
                      ]));
            },
            onSaved: onSaved,
            autovalidate: autovalidate,
            enabled: enabled,
            validator: validator);
}

class TimeFormField extends FormField<TimeOfDay> {
  TimeFormField(
      {Key key,
      Widget label,
      TimeOfDay initialValue,
      onSaved,
      ValueChanged<TimeOfDay> onChanged,
      autovalidate = false,
      enabled = true,
      FormFieldValidator<TimeOfDay> validator})
      : super(
            key: key,
            initialValue: initialValue,
            builder: (FormFieldState<TimeOfDay> state) {
              final TextEditingController controller = TextEditingController();
              controller.text =
                  '${state.value.hour < 10 ? '0' : ''}${state.value.hour}:${state.value.minute < 10 ? '0' : ''}${state.value.minute}';
              return Builder(
                  builder: (context) => Column(children: <Widget>[
                        label == null ? Container() : label,
                        TextFormField(
                            controller: controller,
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              TimeOfDay timeOfDay = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(
                                      hour: state.value.hour,
                                      minute: state.value.minute));
                              if (timeOfDay != null) {
                                state.didChange(timeOfDay);
                              }
                            })
                      ]));
            },
            onSaved: onSaved,
            autovalidate: autovalidate,
            enabled: enabled,
            validator: validator);
}
