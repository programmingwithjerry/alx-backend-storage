-- Create trigger to decrease quantity in items table when a new order is added

DELIMITER $$

CREATE TRIGGER decrease_quantity_after_order
BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    -- Update the quantity of the item in the items table
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE id = NEW.item_id;
END $$

DELIMITER ;
