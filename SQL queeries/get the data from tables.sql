----- dim__cutomer -----
SELECT 
    c.customer_id ,
    c.first_name ,
    c.last_name,
    c.email,
    ca.status_id,
    asu.address_status,
    a.address_id,
    a.street_number,
    a.street_name,
    a.city,
    co.country_id,
    co.country_name
FROM 
    customer AS c
LEFT JOIN 
    customer_address AS ca ON c.customer_id = ca.customer_id
LEFT JOIN 
    address_status AS asu ON ca.status_id = asu.status_id
LEFT JOIN 
    address AS a ON ca.address_id = a.address_id
LEFT JOIN 
    country AS co ON a.country_id = co.country_id;

	----------------------------------
	---Dim _ order------
	SELECT 
    o.order_id,
    o.order_date,
    sm.method_id, 
    sm.method_name,
    oh.history_id,
    oh.status_id,
    os.status_value,
    oh.status_date
FROM 
    cust_order AS o
LEFT JOIN 
    shipping_method AS sm ON o.shipping_method_id = sm.method_id
LEFT JOIN 
    order_history AS oh ON o.order_id = oh.order_id
LEFT JOIN 
    order_status AS os ON oh.status_id = os.status_id

	------------------------
	-----fro _dim_book--------
	SELECT 
    b.book_id,
    b.title,
    b.isbn13,
    b.num_pages,
    b.publication_date,
    a.author_id,
    a.author_name,
    p.publisher_id,
    p.publisher_name,
    bl.language_id,
    bl.language_code,
    bl.language_name
FROM 
    book AS b
LEFT JOIN 
    book_author AS ba ON b.book_id = ba.book_id
LEFT JOIN 
    author AS a ON ba.author_id = a.author_id
LEFT JOIN 
    publisher AS p ON b.publisher_id = p.publisher_id
LEFT JOIN 
    book_language AS bl ON b.language_id = bl.language_id;
