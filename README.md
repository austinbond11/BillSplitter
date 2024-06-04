# Bill Splitter

Bill Splitter is an iOS app that helps you easily split a bill among multiple people and calculate the tip with currency formatting.

## Features

-  Enter the total bill amount.
-  Select the number of people to split the bill.
-  Choose a tip percentage.
-  Calculate and display the total amount and amount per person.
-  Automatically format the bill amount as currency upon editing completion.

-  1. Clone the repository:

    ```bash
    git clone https://github.com/austinbond11/BillSplitter.git
    cd BillSplitter
    ```

2. Open the project in Xcode:

    ```bash
    open BillSplitter.xcodeproj
    ```

3. Build and run the project on your simulator or device.

## Usage

1. Launch the app.
2. Tap on the "Amount" field to enter the total bill amount. The field will clear to let you start with a new amount.
3. Select the number of people in the party from the picker.
4. Choose a tip percentage using the segmented control.
5. The app will calculate and display the Grand Total and Paid Per Person amounts.
6. Tap the "Done" button on the keyboard to finish editing the amount, and the field will format as currency.

## Code Overview

-  **ContentView.swift**: This file contains the main view of the app, including the form for entering the bill amount, selecting the number of people, choosing the tip percentage, and displaying the results.
-  **formatCheckAmountAsCurrency()**: A function that formats the entered amount as a currency string when editing is complete.

## Contribution

Feel free to fork this repository and submit pull requests. Please ensure your changes are well-tested before submission.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
