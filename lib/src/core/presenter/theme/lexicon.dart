abstract class Lexicon {
  //#region AuthModule
  static const String name = 'Name';
  static const String login = 'Login';
  static const String secret = 'Password';
  static const String secretConfirm = 'Confirm password';
  static const String createAccount = 'Create account';
  static const String submitAccount = 'Submit account';
  static const String loginAccount = 'Login account';
  static const String invalidFields = 'Invalid fields';
  static const String accountCreated = 'Account created successfully';
  static const String welcome = 'Welcome';

  //#endregion

  //#region HomePage
  static const String home = 'Home';
  static const String tasks = 'Tasks';
  static const String task = 'Task';
  static const String tasksDone = 'Done';
  static const String createTask = 'Create task';
  static const String title = 'Title';
  static const String dueDate = 'Due date';
  static const String description = 'Description';
  static const String createNewTask = 'Create new task';
  static const String taskCreated = 'Task created successfully';
  static const String noDueDate = 'No due date';
  static const String anErrorOccurred = 'An error occurred';

  //#endregion

  //#region Validation
  static const String fillTheFieldToAddNewTask = 'fill the field to add new task';
  static const String fillTheFieldToSubmit = 'fill the field to submit';
  static const String fillWithFullName = 'fill with full name';
  static const String passwordsDoNotMatch = 'passwords do not match';
  static const String nameTooLong = 'name too long';

  //#endregion

  //#region Wildcard
  static const String wildcard = 'Page not found';
  static const String wildcardMessage = 'The page you are looking for does not exist';
  static const String fourHundredFour = '404';

  //#endregion

  //#region CustomException
  static const String customException = 'Something really bad happened';
  static const String unauthorized = 'Unauthorized';
  static const String internalServerError = 'Server error';
  static const String unknownError = 'Unknown error';
  static const String noInternetConnection = 'No internet connection';
  static const String formatException = 'Format exception';
  static const String connectTimeout = 'Connect timeout, check your internet connection';
  static const String receiveTimeout = 'Receive timeout, unable to connect to the server';

  //#endregion

  //#Mapper
  static const String mapperErrorEntity = 'Entity';
  static const String mapperErrorNotFound = 'not found';

  //#endregion
}
