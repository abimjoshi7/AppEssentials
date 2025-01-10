/// An extension on the [Exception] class to provide a custom error message.
extension ExceptionExt on Exception {
  /// Converts the exception to a user-friendly error message.
  ///
  /// This method removes the generic "Exception: " prefix and replaces
  /// specific exception messages with more understandable ones for the user.
  String toMessage() {
    // Remove the "Exception: " prefix from the error message.
    var errorMessage = toString().replaceAll("Exception: ", "");

    // Replace the message for SocketException with a custom user-friendly message.
    if (errorMessage.contains("SocketException")) {
      return "Network error. Please check your internet connection.";
    }

    // Return the cleaned-up or replaced error message.
    return errorMessage;
  }
}
