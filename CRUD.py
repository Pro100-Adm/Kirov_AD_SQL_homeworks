import pymysql
from config import host, user, password

try:
    connection = pymysql.connect(
        host=host,
        port=3306,
        user=user,
        password=password,
        cursorclass=pymysql.cursors.DictCursor
    )
    print("connected")

    try:
        cursor = connection.cursor()

        delete_db_query = "DROP DATABASE IF EXISTS Kirov_AD_homework2_db"

        create_db_query = "CREATE DATABASE IF NOT EXISTS Kirov_AD_homework2_db"

        use_db_query = "USE Kirov_AD_homework2_db"

        drop_sales_table_query = "DROP TABLE IF EXISTS sales"

        create_sales_table_query = "CREATE TABLE IF NOT EXISTS sales" \
                                   "id INT NOT NULL PRIMARY KEY AUTO_INCREMENT," \
                                   "order_date DATE NOT NULL," \
                                   "count_product INT NOT NULL"

        sales_insert_query = "INSERT INTO sales (order_date, count_product)" \
                             "VALUES" \
                             "('2021-10-26',285)," \
                             "('2022-11-15',150)," \
                             "('2023-03-19',283)," \
                             "('2022-08-12',310)," \
                             "('2023-05-03',141)," \
                             "('2023-08-28',149)," \
                             "('2023-02-02',105)," \
                             "('2022-09-27',315);"

        sales_update_query = "UPDATE sales SET order_date = '2022-06-20' WHERE id = 1;"

        sales_group_query = "SELECT" \
                            "CASE" \
                                "WHEN count_product < 100 THEN 'small_order'" \
                                "WHEN count_product BETWEEN 100 AND 300 THEN 'middle_order'" \
                                "ELSE 'large_order'" \
                            "END AS order_type," \
                            "COUNT(*) AS count_products_in_order" \
                            "FROM" \
                                "sales" \
                            "GROUP BY" \
                                "order_type;"

        drop_orders_table_query = "DROP TABLE IF EXISTS orders"

        create_orders_table_query = "CREATE TABLE IF NOT EXISTS orders" \
                                    "id INT NOT NULL PRIMARY KEY AUTO_INCREMENT," \
                                    "employee_id VARCHAR(45) NOT NULL," \
                                    "amount DECIMAL(4,2) NOT NULL," \
                                    "order_status VARCHAR(45) NOT NULL"

        orders_insert_query = "INSERT INTO orders (employee_id, amount, order_status)" \
                              "VALUES" \
                              "('e03', 50.65, 'OPEN')," \
                              "('e02', 33.34, 'OPEN')," \
                              "('e03', 7.90, 'CLOSED')," \
                              "('e03', 58.30, 'CLOSED')," \
                              "('e03', 15.02, 'CANCELLED')," \
                              "('e05', 28.46, 'CLOSED')," \
                              "('e04', 23.70, 'OPEN')," \
                              "('e02', 84.01, 'OPEN');"

        orders_fullstatus_query = "SELECT id, orderstatus," \
                "CASE orderstatus" \
                    "WHEN 'OPEN' THEN 'Order is in open state.'" \
                    "WHEN 'CLOSED' THEN 'Order is closed.'" \
                    "ELSE 'Order is cancelled.'" \
                "END AS order_fullstatus" \
                "FROM orders;"

        cursor.execute(delete_db_query)

        cursor.execute(create_db_query)

        cursor.execute(use_db_query)

        cursor.execute(drop_sales_table_query)

        cursor.execute(create_sales_table_query)

        cursor.execute(sales_insert_query)
        connection.commit()

        cursor.execute(sales_update_query)
        connection.commit()

        cursor.execute(sales_group_query)
        rows = cursor.fetchall()
        for row in rows:
            print(row)

        cursor.execute(drop_orders_table_query)

        cursor.execute(create_orders_table_query)

        cursor.execute(orders_insert_query)
        connection.commit()

        cursor.execute(orders_fullstatus_query)
        rows = cursor.fetchall()
        for row in rows:
            print(row)

    finally:
        connection.close()

except Exception as ex:
    print("Connection refused.")
    print(ex)
