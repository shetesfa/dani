-- =========================================================
-- Dan Creatives — security fix
-- Your admin_users table was seeded with a PLACEHOLDER password
-- hash ('$2y$10$YourHashHere') that was never a real password —
-- which is why the login page checked a hardcoded admin/admin123
-- instead of the database at all. This sets a real password hash
-- so login now genuinely checks the database, and you can change
-- your password from Admin > Change Password afterward.
--
-- Run this once in phpMyAdmin. Default login stays admin / admin123
-- until you change it.
-- =========================================================

UPDATE `admin_users`
SET `password` = '$2y$10$y6KguGwmqLLx2fyVTfJws.sfOdXRfzyOZWxWBtIMx4Hg11IhlB632'
WHERE `username` = 'admin';
