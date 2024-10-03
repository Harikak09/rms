The restaurant management system developed using PostgreSQL and Django provides like features table allocations, order item, and automated bill calculations. 
The system caters to various roles: *manager, server, dining supervisor, chef, and customer*
### Workflow of the project

1. Customer enters, dining supervisor enters customer details.
2. Dining supervisor allocates a table, server and order_id
3. Server comes and takes the order
4. Chef is allocated based on the category of food ordered which is     entered by server into order items.
5. Chef checks the order, updates when food is prepared. 
    1. If chef prepares the food in time less than the preparation time, bonus added to the chef.
    2. Else customer's gets the discount for the waiting time.
6. Finally, dining supervisor can generate the bill(_includes tax, discounts if any_).
7. The table becomes free/ unallocated if bill is generated.

It effectively handles table turnover by automatically freeing up tables after bill settlements, ensuring a smooth dining experience, enabling them to fulfil their 
responsibilities seamlessly. Furthermore, it tracks menu updates and price changes based on demand, aiding in informed decision-making for the business.
