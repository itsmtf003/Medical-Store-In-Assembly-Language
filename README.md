# Medical Store Management Program

## Overview
This Medical Store Management Program is a DOS-based application written in assembly language. It provides an interactive user interface to manage a list of medicines for various common health issues. The program utilizes interrupts and BIOS functions to handle text display, user input, and graphical elements on the screen.

## Features
- **User Interface**: A text-based UI with a menu system and input handling.
- **Medicine Lists**: Displays lists of medicines for different conditions such as fever, cough, headache, and flu.
- **Navigation**: Users can select a condition to view corresponding medicines and choose to see the lists again or exit the program.

## Program Breakdown
### Data Segment
- **Headers and Menus**: Strings used for displaying headers, menus, and prompts.
- **Medicine Lists**: Strings representing lists of medicines for various conditions.

### Code Segment
- **BG Procedure**: Draws a graphical box on the screen with red background and white text using BIOS interrupts.
- **Start Procedure**: Handles the main logic of displaying the menu, taking user input, and showing corresponding medicine lists.
- **Print Lists**: Functions for displaying each specific list of medicines.
- **Try Again**: Prompts the user to show the list of medicines again or exit the program.

### Interrupt Handling
- **INT 10h**: Used for text and background color setting, cursor positioning, and graphical box drawing.
- **INT 21h**: Used for displaying strings and handling user input.

### Flow
1. **Initialization**: Sets up the data segment and draws the graphical box.
2. **Main Menu**: Displays the main menu and prompts the user for input.
3. **User Input**: Based on user choice, displays the appropriate list of medicines.
4. **Retry Prompt**: Asks the user if they want to see the lists again or exit.

## Usage
1. **Run the Program**: Start the application in a DOS environment.
2. **Navigate Menu**: Use the menu to select a health condition.
3. **View Medicines**: See the list of recommended medicines.
4. **Retry or Exit**: Choose to view another list or exit the program.

## Contact
For further information, contact Muhammad Taha Farooqui at mtahafarooqui003@gmail.com.
