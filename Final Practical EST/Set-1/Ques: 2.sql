--QUESTION: 2
--Write a Postgres trigger to block an INSERT on Orders if the requested qty is greater 
--than the stock_qty in the Products table.

CREATE OR REPLACE FUNCTION check_stock_before_insert()
RETURNS TRIGGER AS $$
DECLARE
    available_stock INT;
BEGIN
    SELECT stock_qty INTO available_stock
    FROM products
    WHERE product_id = NEW.product_id;

    IF available_stock IS NULL THEN
        RAISE EXCEPTION 'Product ID % does not exist', NEW.product_id;
    END IF;

    IF NEW.qty > available_stock THEN
        RAISE EXCEPTION 'Insufficient stock for product ID %: Available %, Requested %',
            NEW.product_id, available_stock, NEW.qty;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_stock
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION check_stock_before_insert();