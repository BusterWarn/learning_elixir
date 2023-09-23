# Project: Simple Chat Server and Client in Elixir

#### Objective:

Create a chat server that can accept messages from multiple clients and broadcast those messages to all connected clients. Make it possible for clients to join, leave, and list other connected clients.

#### User Guide for the Simple Chat Server

**Server Side**

- Run the server script to start the chat server.
- The server will display a log indicating it's waiting for connections.

**Client Side**

- Run the client script to connect to the server.
- Upon connection, enter a username to join the chat.
- Use `/join` to join a chat, `/leave` to leave the chat, and `/list` to list all connected users.
- Type your messages and hit enter to send them to all connected users.

#### Concepts to Learn:

1. **GenServer**: To manage the state of connected clients.
2. **Supervisors**: To supervise your GenServer and restart it if it crashes.
3. **TCP/IP Networking**: To handle client-server communication.
4. **Concurrency**: Understanding how Elixir handles multiple connections.
5. **Pattern Matching**: Deepening your understanding of this by handling various message types.

#### Tasks:

1. **Setup**: Create a new Elixir project using Mix.

    ```bash
    mix new simple_chat
    ```

2. **GenServer Implementation**: Create a GenServer that will hold the state of the chat room—mainly, the list of connected clients and their messages.

3. **TCP Server**: Use `:gen_tcp` to create a listening socket and accept client connections.

4. **Message Handling**: Implement functions to process incoming messages, broadcast messages, and handle special commands like `/join`, `/leave`, and `/list`.

5. **Client**: Create a simple Elixir script that can connect to the server, send messages, and display incoming messages from the server.

6. **Supervision**: Add a supervisor to manage your chat GenServer.

7. **Testing**: Write some ExUnit tests to verify your chat server's functionality.

#### Bonus:

1. Add a feature where a client can send a private message to another client.
2. Implement logging for server events.
