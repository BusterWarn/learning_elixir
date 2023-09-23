Hey folks! This is one of my learning projects in Elixir. The project is inspired by my C++ [modern_monadic_operations](https://github.com/BusterWarn/learning_cpp/tree/main/functional_programming_using_cpp/modern_monadic_operations) exercise. The idea is to take a list of names and jazz them up by converting them to lowercase, converting them to snake_case, and prefixing them with "cool_". Many things can go wrong when jazzing up names; so one might wonder, do monads really exist in Elixir?

## Elixir Concepts Used

1. **Modules**: Both `Main` and `Names` are defined as Elixir modules.
2. **Custom Types**: Defined a custom type `maybe_string` using `@type`.
3. **Private Functions**: Functions like `contains_number?` and `contains_one_space?` are defined as private (`defp`).
4. **Pattern Matching**: Used in function definitions for various cases including matching `:nothing`.
5. **Guards**: Used to handle different function argument types and conditions.
6. **Case Statements**: Employed for conditional logic within functions.
7. **Pipelines**: Used the `|>` operator for chaining function calls.
8. **Regular Expressions**: Utilized for pattern matching within strings.
9. **Enum Module**: Used `Enum.map` and `Enum.reject` for list transformations.

## Running the Program

To compile and run the program, navigate to the project directory and run:

```bash
PS cool_names> elixirc cool_names.ex main.ex
cool_my_name
cool_alice_wonderland
cool_robert_downey
cool_john_doe
```