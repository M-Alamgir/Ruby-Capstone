![](https://img.shields.io/badge/Microverse-blueviolet)

# Ruby-Capstone

This program provides an interface to Ruby's builtin syntax analysis. It will be used with files that have the Ruby syntax.

# Ruby linters program

The whole idea of writing code to check another code is intriguing at the same time cognitively demanding. Building Linters for Ruby, the project provides feedback about errors or warnings in code little by little. The project was built completely with Ruby following all possible best practices. Rubocop was used as a code-linter alongside Gitflow to ensure I maintain good coding standards.

![Screenshot](/img/img.png)

After fixing Errors.

![Screenshot](/img/img-2.png)

## Built With

![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?&style=for-the-badge&logo=ruby&logoColor=white)

## Getting Started

To get a local copy up and running follow these simple example steps in your terminal.

- `git clone https://github.com/M-Alamgir/Ruby-Capstone`
- `cd Ruby-Capstone`
- `bin/main.rb`

## Instructions

- Run the program by typing `./bin/main.rb`
- Make wrong syntactical changes in the `test.rb` file to check for errors.
- Replace the `test.rb` with the file that user want to check for linter errors.
- Or Replace the lines of code in `test.rb` file.
- If program find any errors it will list them terminal with the type of error and line number.
- If no errors found the user will get a message `No offenses detected`

## Errors/warnings

The custom Ruby linter currently checks for the following errors/warnings.
- check wrong indentation for lines which need only 2 spaces. 
  (it only works with the first level of indentation inside `class` or `method`)
- check for trailing whitespaces at the end of line.
- check for missing/unexpected opening or closing tags  i.e. '(' ')' '{' '}'.
- check for space after comma.
- check for empty line at the end of file.

👤 **Alamgir**

- GitHub: [@ourandco](https://github.com/ourandco)
- Twitter: [@Alphacrescent1](https://twitter.com/Alphacrescent1)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Project inspired by [Microverse](https://www.microverse.org)