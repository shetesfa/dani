-- =========================================================
-- Dan Decor — security fix
-- Your admin password was stored as a plain MD5 hash, which is
-- weak by modern standards. This upgrades it to a proper bcrypt
-- hash so login now uses password_verify(). You can change your
-- password from Admin > Change Password afterward.
--
-- Run this once in phpMyAdmin. Default login stays admin / admin123
-- until you change it.
-- =========================================================

UPDATE `admin_users`
SET `password` = '$2y$10$y6KguGwmqLLx2fyVTfJws.sfOdXRfzyOZWxWBtIMx4Hg11IhlB632'
WHERE `username` = 'admin';
