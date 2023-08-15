# Command Line Test - Online Testing Tool

The Command Line Test is a Linux Shell Script project that simulates an online testing scenario through a BASH shell-based interface. This project aims to provide a simple command-line tool for users to sign up, sign in, take a timed test, view test results, and log user activities.

## Features

- **Sign Up**: New users can register with a user ID and password. Usernames must be alphanumeric, and passwords must meet specific criteria.
- **Sign In**: Registered users can sign in using their user ID and password. Passwords are stored securely.
- **Take Test**: Users can take a timed test with random questions from a question bank. Each question is timed, and user answers are stored along with attempt times.
- **View Test**: Users can view their test results, including questions, options, and user-provided answers.
- **Logging**: All user activities are logged in the `test_activity.log` file, including sign-ups, sign-ins, and test completions.

## Getting Started

1. Clone this repository or copy the contents of the `command_line_test.sh` script into a new file.
2. Create a `question_bank.txt` file in the same directory with your desired questions and options.
3. Create an empty `users.txt` file in the same directory to store registered users' information.
4. Make the script executable: `chmod +x command_line_test.sh`
5. Run the script: `./command_line_test.sh`

## Usage

1. Sign Up: Register a new user by providing a valid username and password.
2. Sign In: Log in with your registered user ID and password.
3. Take Test: Answer randomly selected questions from the question bank. Each question has a time limit.
4. View Test: Display your test results, including questions, options, and your answers.
5. Exit: Exit the program.

## Note

- This project is a simplified implementation and may require further customization to meet specific requirements.
- Ensure that your question bank file (`question_bank.txt`) follows the specified format.
- Please refer to the code comments and adjust the script according to your needs.

## License

This project is licensed under the [MIT License](LICENSE).
