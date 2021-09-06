# RPNCalculator

A Reverse Polish Notation Calculator.

## Getting Started

### Setup

To be able to correctly build and run this application, the following tools must be installed locally:

* Xcode

#### Xcode

To build and run this program you are **required** to download Xcode. Unfortunately, *Xcode Command Line Tool* is not enough.

### Cloning the Repo

```bash
git clone git@github.com:PaulWThi/RPNCalculator.git
```

## Project Structure

Folder structure separates model objects and utility classes/functions
```
<project name>
    Sources
        RPNCalculator
            Models
                Command.swift
                Operator.swift
                Stack.swift
                ...
            Utilities
                Runner.swift
                ...
    Tests
        RPNCalculatorTests
            RPNCalculatorTests.swift
```

## Application Architecture / Solution

The application starts at `main.swift`. It creates an instance of `Runner` and calls it's `start()` function. The entire application is driven by `Runner` and it's functions.

Input types are broken in to 2 different types, operands and operators. Operands are integer numbers, and operators are a preset enumeration of raw type String. User inputs are first checked to see if they are of a preset command ("eof", "show", "count"), then they will be checked to see if they are a operand or operator. If they are an operand, they will be added on top of an operand stack to be operated on in the future. If they are an operator, then the top 2 operands of the stack will be calculated against the operator, and once calculated, pushed back on top of the stack.

The purpose for this architecture is to allow for vague inputs that allow for scalability. By having operators in an enumeration, it will be easy to add new operations in the future if need be.

## Tradeoffs / Left Out / What Would I Do Differently

Though it was technically possible, I do not think Swift was the ideal language to build this application. Swift is optimized for iOS development and not so much for building CLI Applications. Also, I was unable to figure out how to correctly implement Unit Tests (I'm not even entirely sure if it's even possible).

## How To Build / Run

There are a few ways to run this.
1. Easiest method is to open the project in Xcode, and running it using Command + R.
2. Navigate to the project directory and execute the following commands:
```bash
swift run rpn
```
3. Build the executable for release:
``` bash
swift build --configuration release
```
and either navigate to the UNIX executable and run it:
```bash
cd .build/release
./rpn
```
or copy it to `/usr/local/bin/rpn` so it can be used as a tool:
```bash
cp -f .build/release/banner /usr/local/bin/rpn
rpn
```

## Troubleshooting

It's possible you may need to install Xcode Command Line Tool on top of Xcode. If so, try this:

1. Open terminal and execute the following command:
```bash
xcode-select —install
```

2. Once installation is complete, run these commands to ensure Xcode CLI and Swift was installed correctly:
```bash
xcode-select --version
swift --version
```

3. Now check the path of Xcode CLI:
```bash
xcode-select -p
```

4. If location does **not** read `/Applications/Xcode.app/Contents/Developer`, run this command:
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

5. Navigate to where you cloned the `RPNCalculator` repo locally, and try to build/run the Swift program:
```bash
swift run rpn
```

6. Pray this works...
