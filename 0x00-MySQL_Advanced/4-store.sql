-- Create trigger to decrease quantity in items table when a new order is added

DELIMITER $$

CREATE TRIGGER decrease_quantity_after_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the items table to reduce quantity based on the new order
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END $$

DELIMITER ;
