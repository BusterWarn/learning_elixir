defmodule PhoenixWithSqlite3Web.CounterControllerTest do
  use PhoenixWithSqlite3Web.ConnCase

  test "gets count", %{conn: conn} do
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 1}
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 2}
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 3}
  end

  test "gets count one more time", %{conn: conn} do
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 1}
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 2}
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 3}
    conn = get(conn, "/api/counter")
    assert json_response(conn, 200) == %{"id" => 1, "value" => 4}
  end
end
