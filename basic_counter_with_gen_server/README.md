Hey there! (◠‿◠✿) This is all about diving into the powerful aspects of Elixir, particularly GenServer and OTP. The aim here is simple but insightful: manage a counter (no wait two) that can be incremented, decremented, and queried. This isn't just a counter; it's an awesome journey into the nuts and bolts of Elixir.

## Elixir Concepts Used

1. **GenServer**: Got hands-on with GenServer for managing state and handling synchronous calls.
2. **OTP (Open Telecom Platform)**: Dipped toes into OTP, which is the backbone of fault-tolerant, distributed systems in Elixir.
3. **Mix**: Leveraged Mix for managing project dependencies and running tasks; a cornerstone tool in any Elixir dev's toolkit.
4. **Tests with ExUnit**: Wrote unit tests using Elixir's built-in ExUnit framework; gotta make sure that counter is bulletproof.
5. **Maps**: Used Elixir maps for state management within GenServer. A key takeaway? Maps are awesome for structured, mutable data.
6. **Tuples**: Experienced the awesomeness of tuples in Elixir, especially within GenServer callbacks like `{:reply, new_count, new_state}`.
7. **Pattern Matching**: Used extensively in both function definitions and tests; it's the bread and butter of Elixir.
8. **Error Handling**: Utilized tuple-based error handling like `{:error, reason}`; simple yet powerful.

## Running the Program

To interact with the GenServer and run the tests, navigate to the directory and use the following Mix commands:

```bash
# To compile
mix compile

# To run tests
mix test
```

So, here it is; a simple yet powerful exploration into the world of Elixir and OTP. This counter might be basic, but the concepts it covers are foundational in building robust, fault-tolerant systems. Enjoy! ♥‿♥