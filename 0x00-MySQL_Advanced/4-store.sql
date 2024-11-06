DELIMITER $$

-- Trigger to decrease the quantity of an item after a new order is added
CREATE TRIGGER decrease_item_quantity_after_order
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    -- Check if the order has a valid item_id and quantity
    UPDATE items
    SET quantity = quantity - NEW.quantity
    WHERE item_id = NEW.item_id;
END $$

DELIMITER ;
