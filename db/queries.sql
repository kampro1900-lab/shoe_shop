use madagaskar;

-- 1. Вход в приложение 
SELECT u.id, u.full_name, r.name AS role 
FROM users u 
JOIN roles r ON r.id = u.role_id 
WHERE u.login = '1diph5e@tutanota.com' AND u.password = '8ntwUp';

-- 2. Каталог товаров 
SELECT p.id, p.article, p.name, p.unit, p.price, p.discount, p.stock_qty, p.description, p.photo, 
       c.name AS category, m.name AS manufacturer, s.name AS supplier 
FROM products p 
JOIN categories c ON c.id = p.category_id 
JOIN manufacturers m ON m.id = p.manufacturer_id 
JOIN suppliers s ON s.id = p.supplier_id;

-- 3. Поиск, фильтр и сортировка 
SELECT p.id, p.article, p.name, p.price, p.stock_qty, s.name AS supplier
FROM products p
JOIN suppliers s ON s.id = p.supplier_id
WHERE p.name LIKE '%Туфли%' AND p.supplier_id = 1
ORDER BY p.stock_qty DESC;

-- 4. Справочники для выпадающих списков
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;

-- 5. Добавление товара
INSERT INTO products (article, name, unit, price, discount, stock_qty, description, photo, category_id, manufacturer_id, supplier_id)
VALUES ('TEST1', 'Новый товар', 'шт.', 1000, 0, 10, 'Описание', '1.jpg', 1, 1, 1);

-- 6. Открыть товар для редактирования
SELECT * FROM products WHERE id = 1;

-- 7. Сохранить изменения
UPDATE products
SET article='TEST1', name='Измененный товар', unit='шт.', price=1500, discount=5, stock_qty=5, description='Новое описание', photo='1.jpg', category_id=1, manufacturer_id=1, supplier_id=1
WHERE id = 1;

-- 8. Проверка перед удалением 
SELECT COUNT(*) AS used_in_orders FROM prodorders WHERE product_id = 1;

-- 9. Удаление 
DELETE FROM products WHERE id = 1;
