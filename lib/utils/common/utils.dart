/// Common utility functions
library;

import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';

/// Regresa true si el status code es 200
bool isStatusSuccess(int statusCode) => statusCode == 200;

S getLocalizable(BuildContext context) => S.of(context);