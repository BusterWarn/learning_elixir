# DebtInvestSimulator

## Overview
The `DebtInvestSimulator` is an Elixir script designed to simulate and compare the financial outcomes of investing versus aggressively paying off a mortgage. It provides a year-by-year breakdown of investment growth and mortgage balance, considering the effects of compound interest and tax deductions.

## How it Works
The script prompts the user to input several key financial parameters:
- **Loan Amount**: The initial amount of the mortgage.
- **Mortgage Interest Rate**: The annual interest rate of the mortgage.
- **Investment Return Rate**: The expected annual return rate from investments.
- **Tax Deduction on Mortgage Interest**: The percentage of the mortgage interest that can be deducted for tax purposes.
- **Number of Years**: The time span for the simulation.

Alternatively, the user can choose to run the simulation with default values.

## Calculations
- **Investment Growth**: Calculated using the compound interest formula, which includes reinvesting the interest earned each year.
- **Mortgage Payments**: Estimated using a simplified amortization schedule. The script considers the effective mortgage rate (after tax deductions) and calculates the total payment made each year.
- **Yearly Summary**: For each year, the script outputs the total investment value, the remaining mortgage balance, the annual mortgage payment, and the mortgage interest paid.

## Running the Script
To run the script, simply execute it in an Elixir environment:
```bash
elixir debt_invest_simulator.exs
```

## Disclaimer
This script is intended for educational and simulation purposes and should not be considered financial advice. Real-world financial decisions should be made with the guidance of a professional financial advisor.
