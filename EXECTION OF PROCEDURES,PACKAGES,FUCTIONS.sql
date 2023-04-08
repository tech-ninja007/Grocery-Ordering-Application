DECLARE
    lv_customer_id CUSTOMERS.CUSTOMER_ID:= 20231;
    lv_updated_name CUSTOMERS.EMAIL:= 'mackhensley@gmail.com';
    
    lv_out_customer_id CUSTOMERS.CUSTOMER_ID;
    lv_out_customer_email CUSTOMERS.EMAIL;
    
    lv_order_id ORDERS.ORDER_ID;
    lv_status ORDER_STATUS.STATUS;
    
    lv_updated_order_id ORDERS.ORDER_ID;
    lv_updated_status ORDER_STATUS.STATUS;
BEGIN

    UPDATE_CUSTOMER_INFO(
        new_name => lv_customer_id,
        new_email => lv_updated_name
    );
    
    SELECT customer_id, email 
    INTO lv_out_customer_id,lv_out_customer_email
    FROM customers
    WHERE customer_id = lv_customer_id;
    
    DBMS_OUTPUT.PUT_LINE('ID: ' || lv_out_customer_id);
    DBMS_OUTPUT.PUT_LINE('Updated Email: ' || lv_out_customer_email);    
    
    
    update_order_status(lv_order_id,lv_order_id);
    SELECT ORDER_ID, STATUS
    INTO lv_updated_order_id,lv_updated_status
    FROM ORDERS JOIN ORDER_STATUS USING(STATUS_ID);
    
    DBMS_OUTPUT.PUT_LINE('Order Id: ' || lv_updated_order_id);
    DBMS_OUTPUT.PUT_LINE('Updated Order Status: ' || lv_updated_status);    
    
END;

DECLARE
    lv_order_id ORDERS.ORDER_ID%TYPE;
    lv_delivery_city ADDRESS.CITY%TYPE;    
    
BEGIN 

    OrderManagement_PP.CALCULATE_TOTAL_COST(lv_order_id,lv_delivery_city);
    DBMS_OUTPUT.PUT_LINE('TOTAL COST: ' || OrderManagement_PP.gv_total_cost);

END;

