defmodule DebtInvestSimulator do
  def run do
    {loan_amount, mortgage_rate, investment_rate, tax_deduction, years} =
      if get_yes_no_input("Use default values? (yes/no):") do
        {1_000_000, 0.05, 0.07, 0.30, 30}
      else
        {
          get_float_input("Enter loan amount (e.g., 300000):"),
          get_float_input(
            "Enter annual mortgage interest rate as a decimal (e.g., 0.05 for 5%):"
          ),
          get_float_input(
            "Enter expected annual investment return rate as a decimal (e.g., 0.07 for 7%):"
          ),
          get_float_input(
            "Enter the tax deduction percentage on mortgage interest (e.g., 0.30 for 30%):"
          ),
          get_integer_input("Enter the number of years for comparison:")
        }
      end

    simulate(loan_amount, mortgage_rate, investment_rate, years, tax_deduction)
  end

  defp simulate(loan_amount, mortgage_rate, investment_rate, years, tax_deduction) do
    IO.puts("Yearly Summary:")

    # Initial values
    simulate_years(loan_amount, 0, investment_rate, mortgage_rate, tax_deduction, years, 0)
  end

  defp simulate_years(
         loan_balance,
         investment_value,
         investment_rate,
         mortgage_rate,
         tax_deduction,
         years_remaining,
         year
       )
       when years_remaining > 0 do
    new_investment_value = investment_value * (1 + investment_rate)
    effective_mortgage_rate = mortgage_rate * (1 - tax_deduction)

    yearly_mortgage_payment =
      calculate_yearly_mortgage_payment(loan_balance, effective_mortgage_rate, years_remaining)

    new_loan_balance =
      loan_balance - yearly_mortgage_payment + loan_balance * effective_mortgage_rate

    IO.puts("Year #{year + 1}:")
    IO.puts("  Total Investment Value: #{round(new_investment_value)}")
    IO.puts("  Total Loan Balance: #{round(new_loan_balance)}")
    IO.puts("  Yearly Mortgage Payment: #{round(yearly_mortgage_payment)}")
    IO.puts("  Yearly Mortgage Interest: #{round(loan_balance * effective_mortgage_rate)}")

    simulate_years(
      new_loan_balance,
      new_investment_value,
      investment_rate,
      mortgage_rate,
      tax_deduction,
      years_remaining - 1,
      year + 1
    )
  end

  defp simulate_years(_, _, _, _, _, 0, _), do: :ok

  defp calculate_yearly_mortgage_payment(principal, rate, years_remaining) do
    monthly_rate = rate / 12
    num_payments = years_remaining * 12

    payment =
      principal * (monthly_rate * :math.pow(1 + monthly_rate, num_payments)) /
        (:math.pow(1 + monthly_rate, num_payments) - 1)

    payment * 12
  end

  # Helper functions
  defp get_float_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("") |> String.trim()

    case Float.parse(input) do
      {value, _} -> value
      :error -> handle_invalid_input(prompt)
    end
  end

  defp get_integer_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("") |> String.trim()

    case Integer.parse(input) do
      {value, _} -> value
      :error -> handle_invalid_input(prompt)
    end
  end

  defp get_yes_no_input(prompt) do
    IO.puts(prompt)
    input = IO.gets("") |> String.trim()
    input == "yes"
  end

  defp handle_invalid_input(prompt) do
    IO.puts("Invalid input. Please enter a valid number.")
    get_float_input(prompt)
  end
end

DebtInvestSimulator.run()
