import 'package:flutter/material.dart';

abstract class IFormsValidateService {
  bool validate();

  final form = GlobalKey<FormState>();
}
