defmodule StaticData do
  defstruct monthly_cash: 10_000,
            original_loan: 1_000_000,
            interest_rate: 0.05,
            investment_rate: 0.07,
            years_to_calculate: 5,
            tax_deduction_on_interest_payment: 0.3,
            months_between_adjusting_interest_payments: 1
end

defmodule PayOffLoanStrategyData do
  defstruct loan_size: nil,
            total_interest_payment_to_bank: 0,
            current_interest_payment: 0
end

defmodule InvestingStrategyData do
  defstruct investment: 0,
            total_interest_payment_to_bank: 0
end

defmodule DebtInvestSimulator do
  def run do
    use_default_values = get_yes_no_input("Use default values? (yes/no): ")

    static_data =
      if use_default_values do
        %StaticData{}
      else
        %StaticData{
          monthly_cash: get_float_input("Enter monthly cash (e.g., 10000): "),
          original_loan: get_float_input("Enter original loan amount (e.g., 1000000): "),
          interest_rate:
            get_float_input("Enter interest rate as a decimal (e.g., 0.05 for 5%): "),
          investment_rate:
            get_float_input("Enter investment rate as a decimal (e.g., 0.07 for 7%): "),
          years_to_calculate:
            get_integer_input("Enter the number of years to calculate (e.g., 5): "),
          tax_deduction_on_interest_payment:
            get_float_input(
              "Enter tax deduction on interest payment as a decimal (e.g., 0.3 for 30%): "
            ),
          months_between_adjusting_interest_payments:
            get_integer_input(
              "Months between adjusting interest payments (e.g. 3 for 3 months): "
            )
        }
      end

    make_monthly_payment(%{
      static_data: %StaticData{},
      pay_off_loan_strategy_data: %PayOffLoanStrategyData{loan_size: static_data.original_loan},
      investing_strategy_data: %InvestingStrategyData{},
      current_month: 0
    })
  end

  # Base case: when the number of months exceeds the calculation period
  defp make_monthly_payment(%{
         static_data: static_data,
         pay_off_loan_strategy_data: pay_off_loan_strategy_data,
         investing_strategy_data: investing_strategy_data,
         current_month: month
       })
       when div(month - 1, 12) >= static_data.years_to_calculate do
    IO.puts("Calculation completed for #{static_data.years_to_calculate} years.")

    net_worth_from_paying_off_loans =
      static_data.original_loan - pay_off_loan_strategy_data.loan_size

    net_worth_from_investing = investing_strategy_data.investment
    delta = round(net_worth_from_paying_off_loans - net_worth_from_investing)

    if delta >= 0 do
      IO.puts("By paying of your loans you made #{delta} more money than investing.")
    else
      IO.puts("By investing you made #{-delta} more money than paying off your loans.")
    end
  end

  defp make_monthly_payment(%{
         static_data: static_data,
         pay_off_loan_strategy_data: pay_off_loan_strategy_data,
         investing_strategy_data: investing_strategy_data,
         current_month: month
       }) do
    new_pay_off_loan_strategy_data =
      make_payment_pay_off_loan_strategy(
        static_data,
        pay_off_loan_strategy_data,
        month
      )

    # Investing
    new_investing_strategy_data =
      make_payment_invest_strategy(
        static_data.original_loan,
        static_data.interest_rate,
        static_data.tax_deduction_on_interest_payment,
        static_data.monthly_cash,
        investing_strategy_data.total_interest_payment_to_bank,
        investing_strategy_data.investment
      )

    new_arguments = %{
      static_data: static_data,
      pay_off_loan_strategy_data: new_pay_off_loan_strategy_data,
      investing_strategy_data: new_investing_strategy_data,
      current_month: month + 1
    }

    print_annual_summary(new_arguments)
    make_monthly_payment(new_arguments)
  end

  defp make_payment_pay_off_loan_strategy(
         static_data,
         strategy_data,
         month
       ) do
    # Calculate monthly interest payment

    interest_payment =
      cond do
        rem(month, static_data.months_between_adjusting_interest_payments) == 0 ->
          calculate_monthly_interest_payment(
            strategy_data.loan_size,
            static_data.interest_rate
          )

        true ->
          strategy_data.current_interest_payment
      end

    after_tax_interest = interest_payment * (1 - static_data.tax_deduction_on_interest_payment)

    total_interest_payment_to_bank =
      strategy_data.total_interest_payment_to_bank + after_tax_interest

    # Amount left after paying interest
    principal_payment = max(static_data.monthly_cash - after_tax_interest, 0)
    new_loan_size = max(strategy_data.loan_size - principal_payment, 0)

    %PayOffLoanStrategyData{
      loan_size: new_loan_size,
      total_interest_payment_to_bank: total_interest_payment_to_bank,
      current_interest_payment: interest_payment
    }
  end

  defp make_payment_invest_strategy(
         loan,
         interest_rate,
         tax_deduction,
         cash,
         total_interest_payment_to_bank,
         investment
       ) do
    # Calculate monthly interest payment
    monthly_interest = calculate_monthly_interest_payment(loan, interest_rate)
    after_tax_interest = monthly_interest * (1 - tax_deduction)
    new_total_interest_payment_to_bank = total_interest_payment_to_bank + after_tax_interest

    # Amount left after paying interest
    investment_contribution = max(cash - after_tax_interest, 0)
    new_investment = investment + investment_contribution * (1 + interest_rate / 12)

    %InvestingStrategyData{
      investment: new_investment,
      total_interest_payment_to_bank: new_total_interest_payment_to_bank
    }
  end

  defp calculate_monthly_interest_payment(loan, interest_rate) do
    loan * (interest_rate / 12)
  end

  def print_annual_summary(%{
        static_data: static_data,
        pay_off_loan_strategy_data: pay_off_loan_strategy_data,
        investing_strategy_data: investing_strategy_data,
        current_month: month
      }) do
    if rem(month, 12) == 0 do
      IO.puts("Year: #{round(month / 12)}\n")
      IO.puts("Strategy Pay Off Loan:")

      monthly_interest_payment =
        round(
          calculate_monthly_interest_payment(
            pay_off_loan_strategy_data.loan_size,
            static_data.interest_rate
          ) * (1 - static_data.tax_deduction_on_interest_payment)
        )

      original_monthly_payment =
        round(
          calculate_monthly_interest_payment(
            static_data.original_loan,
            static_data.interest_rate
          ) * (1 - static_data.tax_deduction_on_interest_payment)
        )

      IO.puts(
        "Monthly interest payment: #{monthly_interest_payment} - down by #{original_monthly_payment - monthly_interest_payment}"
      )

      IO.puts(
        "Net worth: #{round(static_data.original_loan - pay_off_loan_strategy_data.loan_size)}"
      )

      IO.puts(
        "Bank profits from interest payments: #{round(pay_off_loan_strategy_data.total_interest_payment_to_bank)}\n"
      )

      IO.puts("Strategy Invest")
      IO.puts("Monthly interest payment: #{original_monthly_payment}")
      IO.puts("Net Worth: #{round(investing_strategy_data.investment)}")

      IO.puts(
        "Bank profits from interest payments: #{round(investing_strategy_data.total_interest_payment_to_bank)}\n"
      )
    end
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
