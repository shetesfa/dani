-- =========================================================
-- Dan Creatives — AI Agent database setup
-- Run this once in phpMyAdmin against the `dan_creatives_db`
-- database. It only ADDS new tables, nothing existing is
-- touched or deleted.
-- =========================================================

CREATE TABLE IF NOT EXISTS `ai_settings` (
  `id` int(11) NOT NULL DEFAULT 1,
  `provider` varchar(20) DEFAULT 'gemini',
  `api_key` varchar(255) DEFAULT NULL,
  `model` varchar(100) DEFAULT 'gemini-2.5-flash-lite',
  `system_prompt` text DEFAULT NULL,
  `welcome_message` varchar(500) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `status` varchar(20) DEFAULT 'not_configured',
  `last_error` text DEFAULT NULL,
  `last_checked_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ai_settings` (`id`, `provider`, `model`, `enabled`, `status`)
SELECT 1, 'gemini', 'gemini-2.5-flash-lite', 1, 'not_configured'
WHERE NOT EXISTS (SELECT 1 FROM `ai_settings` WHERE `id` = 1);

CREATE TABLE IF NOT EXISTS `ai_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(64) NOT NULL,
  `visitor_name` varchar(100) DEFAULT NULL,
  `visitor_phone` varchar(50) DEFAULT NULL,
  `visitor_telegram` varchar(100) DEFAULT NULL,
  `source_page` varchar(100) DEFAULT NULL,
  `status` enum('active','escalated','resolved') DEFAULT 'active',
  `escalation_reason` varchar(255) DEFAULT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_message_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `ai_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_id` int(11) NOT NULL,
  `role` enum('user','assistant','system') NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `conversation_id` (`conversation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Skip the FK add if it already exists (phpMyAdmin will just show a
-- harmless "duplicate key" notice on re-import, which is safe to ignore)
ALTER TABLE `ai_messages`
  ADD CONSTRAINT `ai_messages_ibfk_1` FOREIGN KEY (`conversation_id`) REFERENCES `ai_conversations` (`id`) ON DELETE CASCADE;
