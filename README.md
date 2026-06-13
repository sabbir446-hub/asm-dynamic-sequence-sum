# 8086 Assembly Loop-Based Summation

A basic 8086 Assembly Language program written in MASM/TASM syntax that demonstrates the usage of the `LOOP` instruction, dynamic counter initialization (`CX`), and iterative addition.

## 🚀 Project Overview

Instead of just adding two fixed numbers, this program allows the user to define how many numbers they want to add. It first captures a count value, sets up a loop, sequentially reads single-digit numbers from the user during each iteration, aggregates their total sum into a register, and finally prints the result.

## 🛠️ How It Works & Logic

The key highlight of this code is the **`LOOP` instruction**, which relies heavily on the `CX` (Count Register). Here is the logical flow:

1. **Setting up the Loop Counter (`CX`):** * The program takes the first input from the keyboard (`AH = 1`). This represents how many numbers you want to add.
   * It converts the character to a numeric value (`SUB AL, 48`) and moves it to `CL` while clearing `CH` (`MOV CH, 0`). This initializes the absolute loop counter in `CX`.
2. **Initializing the Accumulator (`MOV BL, 0`):** `BL` register is cleared out to act as our running total or accumulator.
3. **The `LOL:` Loop Block:**
   * **`INT 21H`:** Inside the loop, it waits and accepts a single-digit input.
   * **`SUB AL, 48`:** Converts the input ASCII character to an actual number.
   * **`ADD BL, AL`:** Adds the input number directly to our accumulator `BL`.
   * **`LOOP LOL`:** Automatically decrements `CX` by $1$ (`CX = CX - 1`). If `CX` is not zero, the program jumps back to the `LOL` label. If `CX` reaches zero, the loop terminates.
4. **Output & Exit:** Converts the final accumulated sum in `BL` back to ASCII format (`ADD BL, 48`), prints it to the screen via `AH = 2`, and exits safely (`AH = 4CH`).
