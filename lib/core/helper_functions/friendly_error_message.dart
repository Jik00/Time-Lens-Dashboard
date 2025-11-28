import 'package:timelens_dashboard/core/errors/failures.dart';

String getUserFriendlyError(Failure failure) {
  if (failure is ServerFailure) {
    final message = failure.message.toLowerCase();

    if (message.contains('row-level security policy')) {
      return 'Database security error. Please contact support.';
    } else if (message.contains('network') || message.contains('connection')) {
      return 'Network error. Please check your internet connection.';
    } else if (message.contains('storage') || message.contains('upload')) {
      return 'Failed to upload image. The image already exists.';
    } else if (message.contains('duplicate') || message.contains('unique')) {
      return 'This era code already exists. Please use a different code.';
    }
  }

  return 'Failed to add era. Please try again.';
}

