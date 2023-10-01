## Process Ping Pong

Exploring processes from lecture 24 in Udemy course [Elixir for Beginners](https://www.udemy.com/course/elixir-for-beginners/) by [Ben Emson](https://www.udemy.com/user/benemson/).

```shell
PS process_ping_pong> elixir .\main.ex
player_1: #PID<0.98.0>
player_2: #PID<0.108.0>
0, hit_to: #PID<0.108.0>, :ping
1, hit_to: #PID<0.98.0>, :pong
2, hit_to: #PID<0.108.0>, :ping
3, hit_to: #PID<0.98.0>, :pong
4, hit_to: #PID<0.108.0>, :ping
5, hit_to: #PID<0.98.0>, :pong
6, hit_to: #PID<0.108.0>, :ping
7, hit_to: #PID<0.98.0>, :pong
8, hit_to: #PID<0.108.0>, :ping
9, hit_to: #PID<0.98.0>, :pong
10, hit_to: #PID<0.108.0>, :ping
11, hit_to: #PID<0.98.0>, :pong
12, I (#PID<0.98.0>) have decided to stop playing.
#PID<0.108.0>...Timed out.
#PID<0.98.0>...Timed out.
```