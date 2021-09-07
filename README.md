# RPNCalculator

A Reverse Polish Notation Calculator.


## Getting Started

### Setup

To be able to correctly build and run this application, the following tools must be installed locally:

* Xcode
* Xcode Command Line Tools (Xcode-select)

#### Xcode

Xcode is Apple's integrated development environment for macOS. Though we technically don't have to use it to run the code, Xcode comes with some **required** libraries to build this Command Line Application. This project uses the latest version of [Xcode](https://developer.apple.com/xcode/resources/).

#### Xcode Command Line Tools (Xcode-select)

Xcode-select is a command-line utility on OS X that facilitates switching between different sets of command line developer tools provided by Apple. We will need this tool to build and run this Command Line Application. 

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

The application starts at `main.swift`. It creates an instance of `Runner` and calls its `start()` function. The entire application is driven by `Runner` and its functions.

Input types are broken into 2 different types, operands and operators. Operands are integer numbers, and operators are a preset enumeration of raw type String. User inputs are first checked to see if they are of a preset command ("eof", "show", "count"), then they will be checked to see if they are an operand or operator. If they are an operand, they will be added on top of an operand stack to be operated on in the future. If they are an operator, then the top 2 operands of the stack will be calculated against the operator, and once calculated, pushed back on top of the stack.

The purpose for this architecture is to allow for vague inputs so that the application can be scaled up easily. By having operators in an enumeration (and possibly operands in the future), it will be easy to add new operations if need be.


## Tradeoffs / Left Out / What Would I Do Differently

Though it was technically possible, I do not think Swift was the ideal language to build this application. Swift is optimized for iOS development and not so much for building CLI Applications. This was done mainly as a proof of concept and for fun. Also, I was unable to figure out how to correctly implement Unit Tests (I'm not even entirely sure if it's possible). Though this is a code challenge, I will probably be looking into figuring out how to do it in the future.


## How To Build / Run

There are a few ways to run this.
### Option 1:
Easiest method is to open the project in Xcode and run it using Command + R. You can then use Xcode's built in terminal to run commands and input operands/operators.

### Option 2:
Navigate to the project directory and execute the following command:
```bash
swift run rpn
```

If you want, you can make an `alias` so it's a bit easier to use:
```bash
alias rpn="swift run rpn"
```

### Option 3:
Build the executable for release:
``` bash
swift build --configuration release
```

From here you have the option to run the UNIX executable directly, or copy it to `usr/local/bin/rpn` so it may be used as a tool:

1. Navigate to the UNIX executable and run it:
```bash
cd .build/release
./rpn
```

2. Copy it to `/usr/local/bin/rpn` so it can be used as a tool:
```bash
cp -f .build/release/banner /usr/local/bin/rpn
rpn
```


## Usage
Once the app is running, you can input operands and operators in 2 different ways. Either 1 string at a time, or 1 long string delimited with spaces. Ex:

### 1 string at a time:
```
LETS GOOOOOO!!
> 5 
5.0
> 8
8.0
> +
13.0
```

### 1 long string:
```
LETS GOOOOOO!!
> 5 8 +
5.0
8.0
13.0
```

### Some other preset commands:
* `q`, `eof`, or `EOF`: Ends program
* `show`: Shows current stack of operands
* `count`: Displays count of operand stack


## Troubleshooting

### Missing Xcode Command Line Tools (Xcode-select):
```
no developer tools were found, and no install could be requested (perhaps no UI is present), please install manually from 'developer.apple.com'.
```
or
```
no developer tools were found at `/Applications/Xcode.app`, requesting install. Choose an option in the dialog to download the command line developer tools.
```

If you get this error, you probably need to install Xcode Command Line Tools (Xcode-select). And if you do not get prompted for an alert to download it, follow these instructions:

1. Open terminal and execute the following command to install *Xcode-select*:
```bash
xcode-select —-install
```

2. Once installation is complete, check to ensure Xcode-select was installed correctly:
```bash
xcode-select --version
```

### Unable to find "xctest":
```
xcrun: error: unable to find utility "xctest", not a developer tool or in PATH
```

Either you don't have Xcode installed correctly, or your Xcode Command Line Tools' (Xcode-select) location is not set correctly:

1. Check the path of Xcode CLI:
```bash
xcode-select -p
```

2. If location does **not** read `/Applications/Xcode.app/Contents/Developer`, run this command:
```bash
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
```

If you get the following error, please (re)-install [Xcode](https://developer.apple.com/xcode/resources/). Then retry the above command:
```
error: invalid developer directory '/Applications/Xcode.app/Contents/Developer'
```

otherwise, go to this next step to check if your Xcode and Xcode-select is installed correctly:

3. Navigate to where you cloned the `RPNCalculator` repo locally, and try to build/run the Swift program:
```bash
swift run rpn
```


