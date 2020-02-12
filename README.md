# SQL Challenge

The goal of this challenge was to create a group of custom tables, import data into each table, and run a series of queries interacting with the tables in a variety of ways. 

## Getting Started 

I am running this code using PostgreSQL, an open-source relational database management system, as well as Visual Studio Code. 

### Analysis and Coding 

I began this challenge with creating my custom tables and matching the datatypes with the data that would be imported. After creating the tables I imported the data and began running a series of queries. The queries included segmenting and joining the datasets in a variety of ways. A quick example of one such query is listed below: 

```
SELECT
e.employee_number, e.first_name, e.last_name, departments.department_name
	FROM employees as e
LEFT JOIN dept_employees
	ON e.employee_number = dept_employees.employee_number
LEFT JOIN departments
	ON departments.department_number = departments.department_number 
WHERE departments.department_name lIKE 'Sales';
```

### Built With

* SQL

### Authors

* **Dallas Gollogly** - [dgollogly13](https://github.com/dgollogly13)

### Acknowledgments

* Denver University Data Analytics Bootcamp 
