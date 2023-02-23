import pymysql

#Insert data in table, as you can guess by it's name
def insert(connection, table, values, parameters):
    with connection.cursor() as cursor:
        # Create a new record
        sql = "INSERT INTO " + table + " VALUES " + values
        cursor.execute(sql, parameters)

#Just a simple select with more than one `where` parameter
def select_where(connection, field, table, where_field, parameters):
    result = ''
    with connection.cursor() as cursor:
        # Read all records
        sql = "SELECT " + field + " FROM " + table + " where " + where_field
        cursor.execute(sql, parameters)
        result = cursor.fetchall()
     
    return result

def select_where_sort(connection, field, table, where_field, parameters, sort_field, sort_type):
    result = ''
    with connection.cursor() as cursor:
        # Read all records
        sql = "SELECT " + field + " FROM " + table + " where " + where_field + " order by " + sort_field + ' ' + sort_type
        cursor.execute(sql, parameters)
        result = cursor.fetchall()
     
    return result

#Select without `where parameter`
def select(connection, field, table):
    result = ''
    with connection.cursor() as cursor:
        # Read all records
        sql = "SELECT " + field + " FROM " + table
        cursor.execute(sql)
        result = cursor.fetchall()
    
    return result

def update(connection, table, _set, where, parameters):
    with connection.cursor() as cursor:
        sql = "UPDATE " + table + " SET " + _set + " WHERE " + where
        cursor.execute(sql, parameters)
