-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pass_the_ball
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `albums`
--

DROP TABLE IF EXISTS `albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `visibility` enum('public','private','followers_only','link_only') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `cover_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albums_slug_unique` (`slug`),
  KEY `albums_deleted_by_foreign` (`deleted_by`),
  KEY `albums_user_id_index` (`user_id`),
  KEY `albums_visibility_index` (`visibility`),
  KEY `albums_user_id_visibility_index` (`user_id`,`visibility`),
  CONSTRAINT `albums_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `albums_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albums`
--

LOCK TABLES `albums` WRITE;
/*!40000 ALTER TABLE `albums` DISABLE KEYS */;
INSERT INTO `albums` VALUES (89,152,'Mollitia','mollitia',NULL,'public','photos/sample/thumbnail/e2381686-5804-3c53-bf7f-221e5042de74.jpg',NULL,NULL,'2025-03-05 07:31:49','2025-10-25 10:27:12'),(90,152,'Test album','test-album-1','Necessitatibus possimus delectus perspiciatis est atque fuga. Voluptas assumenda molestias velit vel ratione neque nulla. Officia a reiciendis accusamus repudiandae.','private','photos/sample/thumbnail/6e54cd90-0783-3547-90eb-10fb405c4a60.jpg',NULL,NULL,'2025-09-03 12:16:20','2025-10-25 10:38:51'),(91,152,'Test Album','test-album','Tempora amet sint laudantium occaecati. Vitae ut eius aut repudiandae laboriosam autem. Facilis laborum quidem maiores inventore voluptatem ipsam.','followers_only','photos/sample/thumbnail/0d112a2a-0a38-370d-925f-4e1cd58033f4.jpg',NULL,NULL,'2024-10-28 04:32:10','2025-10-25 10:25:30'),(92,154,'Test visibility','test-visibility','...................','link_only','/storage/albums/154/test-visibility/cover_test-visibility_1761431391_68fd4f5f7d4c5.jpg',NULL,NULL,'2025-10-25 22:29:51','2025-10-25 22:29:51');
/*!40000 ALTER TABLE `albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_parent_id_foreign` (`parent_id`),
  KEY `comments_post_id_parent_id_index` (`post_id`,`parent_id`),
  CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (2,2,NULL,'welcome to the community',152,'2025-10-28 08:51:31','2025-10-28 08:51:31'),(3,11,NULL,'this is nice post',152,'2025-10-30 09:00:36','2025-10-30 09:00:36');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `follower_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_user_id_foreign` (`user_id`),
  KEY `followers_follower_id_foreign` (`follower_id`),
  CONSTRAINT `followers_follower_id_foreign` FOREIGN KEY (`follower_id`) REFERENCES `users` (`id`),
  CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (11,154,152,NULL);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_invitations`
--

DROP TABLE IF EXISTS `group_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `invited_by` bigint unsigned NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token_expires_at` timestamp NOT NULL,
  `token_used_at` timestamp NULL DEFAULT NULL,
  `status` enum('pending','accepted','rejected','expired') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_invitations_token_unique` (`token`),
  KEY `group_invitations_user_id_foreign` (`user_id`),
  KEY `group_invitations_invited_by_foreign` (`invited_by`),
  KEY `group_invitations_group_id_user_id_index` (`group_id`,`user_id`),
  KEY `group_invitations_token_status_index` (`token`,`status`),
  CONSTRAINT `group_invitations_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_invitations_invited_by_foreign` FOREIGN KEY (`invited_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_invitations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_invitations`
--

LOCK TABLES `group_invitations` WRITE;
/*!40000 ALTER TABLE `group_invitations` DISABLE KEYS */;
INSERT INTO `group_invitations` VALUES (1,5,154,152,'Vpw3Lp8VDHRefxHfOUCcXyemnahQbQkfDUI4cXPAloSy0TIK6uYGSFWhFd9mtR8B','2025-11-06 08:53:24','2025-10-30 08:58:41','accepted','2025-10-30 08:53:24','2025-10-30 08:58:41');
/*!40000 ALTER TABLE `group_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token_expired_at` timestamp NULL DEFAULT NULL,
  `token_used` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned NOT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_users_user_id_foreign` (`user_id`),
  KEY `group_users_group_id_foreign` (`group_id`),
  KEY `group_users_created_by_foreign` (`created_by`),
  CONSTRAINT `group_users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,'approved','admin',NULL,NULL,NULL,152,1,152,'2025-10-28 08:53:10','2025-10-28 08:53:10'),(2,'approved','admin',NULL,NULL,NULL,154,2,154,'2025-10-28 08:58:07','2025-10-28 08:58:07'),(3,'approved','admin',NULL,NULL,NULL,152,3,152,'2025-10-28 09:05:38','2025-10-28 09:05:38'),(4,'approved','admin',NULL,NULL,NULL,152,4,152,'2025-10-28 09:08:40','2025-10-28 09:08:40'),(5,'approved','admin',NULL,NULL,NULL,152,5,152,'2025-10-28 09:22:17','2025-10-28 09:22:17'),(6,'approved','admin',NULL,NULL,NULL,154,5,152,'2025-10-30 08:58:41','2025-10-30 09:14:27');
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_approval` tinyint(1) NOT NULL DEFAULT '0',
  `about` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_user_id_foreign` (`user_id`),
  KEY `groups_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `groups_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Football','football',NULL,NULL,0,'Test content',152,'2025-10-28 09:21:14',NULL,'2025-10-28 08:53:10','2025-10-28 09:21:14'),(2,'Test','test',NULL,NULL,0,'................',154,'2025-10-28 09:21:40',NULL,'2025-10-28 08:58:07','2025-10-28 09:21:40'),(3,'Test Group','test-group',NULL,NULL,0,'......',152,'2025-10-28 09:21:26',NULL,'2025-10-28 09:05:38','2025-10-28 09:21:26'),(4,'John Doe','john-doe',NULL,NULL,0,'..........',152,'2025-10-28 09:21:31',NULL,'2025-10-28 09:08:40','2025-10-28 09:21:31'),(5,'Test Group','test-group-1','/storage/groups/5/cover_1761815820_69032d0c87eeb.jpg','/storage/groups/5/thumbnail_1761815827_69032d136ae86.jpg',0,'.......',152,NULL,NULL,'2025-10-28 09:22:17','2025-10-30 09:17:07');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_08_14_170933_add_two_factor_columns_to_users_table',1),(5,'2025_09_25_182306_create_groups_table',1),(6,'2025_09_26_182325_create_group_users_table',1),(7,'2025_09_27_181952_create_posts_table',1),(8,'2025_09_30_182024_create_post_attachments_table',1),(9,'2025_09_30_182052_create_post_reactions_table',1),(10,'2025_09_30_182244_create_comments_table',1),(11,'2025_09_30_182356_create_followers_table',1),(12,'2025_09_30_182409_create_notifications_table',1),(13,'2025_09_30_194854_add_column_to_users_table',1),(14,'2025_10_17_124008_cleanup_reactions_table',1),(15,'2025_10_17_134052_add_parent_id_to_comments_table',1),(16,'2025_10_18_212107_create_group_invitations_table',1),(17,'2025_10_20_084336_add_column_updated_at_to_table_group_users',1),(18,'2025_10_20_201941_fix_notifications_table_structure',1),(19,'2025_10_23_111417_update_existing_groups_auto_approval_setting',1),(20,'2025_10_24_100000_create_albums_table',1),(21,'2025_10_24_100001_create_photos_table',1),(22,'2025_10_24_100002_create_photo_tags_table',1),(23,'2025_10_25_000000_add_visibility_to_posts_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES ('0a065740-ee27-45de-9a6d-9c11086f5fa2','App\\Notifications\\UserFollowedNotification','App\\Models\\User',152,'{\"type\":\"user_followed\",\"follower_id\":154,\"follower_name\":\"Jame Doe\",\"follower_username\":\"jame-doe\",\"follower_profile_picture_url\":\"\\/storage\\/users\\/154\\/avatar_1761402019_68fcdca34a678.jpg\",\"action_url\":\"\\/profile\\/jame-doe\",\"message\":\"Jame Doe started following you\"}','2025-10-25 22:33:40','2025-10-25 15:05:51','2025-10-25 22:33:40'),('14e0c7a0-962b-4d52-a1cc-bb56a5040d74','App\\Notifications\\UserFollowedNotification','App\\Models\\User',152,'{\"type\":\"user_followed\",\"follower_id\":154,\"follower_name\":\"Jame Doe\",\"follower_username\":\"jame-doe\",\"follower_profile_picture_url\":\"\\/storage\\/users\\/154\\/avatar_1761402019_68fcdca34a678.jpg\",\"action_url\":\"\\/profile\\/jame-doe\",\"message\":\"Jame Doe started following you\"}','2025-10-25 22:55:15','2025-10-25 15:00:42','2025-10-25 22:55:15'),('1d14a972-7dc1-4cbb-a316-693e1969300f','App\\Notifications\\GroupInvitationNotification','App\\Models\\User',154,'{\"type\":\"group_invitation\",\"invitation_id\":1,\"group_id\":5,\"group_name\":\"Test Group\",\"group_slug\":\"test-group-1\",\"inviter_id\":152,\"inviter_name\":\"Test User\",\"token\":\"Vpw3Lp8VDHRefxHfOUCcXyemnahQbQkfDUI4cXPAloSy0TIK6uYGSFWhFd9mtR8B\",\"expires_at\":\"2025-11-06T08:53:24.000000Z\",\"action_url\":\"\\/groups\\/invitations\",\"message\":\"Test User invited you to join Test Group\"}','2025-10-30 08:58:33','2025-10-30 08:53:35','2025-10-30 08:58:33'),('5dccb6b2-b380-4756-86de-042185267cd4','App\\Notifications\\UserFollowedNotification','App\\Models\\User',154,'{\"type\":\"user_followed\",\"follower_id\":152,\"follower_name\":\"Test User\",\"follower_username\":\"test-user\",\"follower_profile_picture_url\":null,\"action_url\":\"\\/profile\\/test-user\",\"message\":\"Test User started following you\"}','2025-10-25 22:36:17','2025-10-25 15:05:03','2025-10-25 22:36:17'),('80833ed4-8f6e-4d6c-9f0f-bc006a0511e5','App\\Notifications\\UserFollowedNotification','App\\Models\\User',154,'{\"type\":\"user_followed\",\"follower_id\":152,\"follower_name\":\"Test User\",\"follower_username\":\"test-user\",\"follower_profile_picture_url\":null,\"action_url\":\"\\/profile\\/test-user\",\"message\":\"Test User started following you\"}','2025-10-25 22:36:17','2025-10-25 14:23:55','2025-10-25 22:36:17'),('96929758-30d5-4c14-8e65-50e7e18ae3d5','App\\Notifications\\UserFollowedNotification','App\\Models\\User',152,'{\"type\":\"user_followed\",\"follower_id\":154,\"follower_name\":\"Jame Doe\",\"follower_username\":\"jame-doe\",\"follower_profile_picture_url\":\"\\/storage\\/users\\/154\\/avatar_1761402019_68fcdca34a678.jpg\",\"action_url\":\"\\/profile\\/jame-doe\",\"message\":\"Jame Doe started following you\"}','2025-10-25 22:55:17','2025-10-25 14:52:39','2025-10-25 22:55:17'),('bdf18403-7927-47d9-9fbc-874bcc59ccf3','App\\Notifications\\UserFollowedNotification','App\\Models\\User',154,'{\"type\":\"user_followed\",\"follower_id\":152,\"follower_name\":\"Test User\",\"follower_username\":\"test-user\",\"follower_profile_picture_url\":null,\"action_url\":\"\\/profile\\/test-user\",\"message\":\"Test User started following you\"}','2025-10-25 22:36:17','2025-10-25 14:24:05','2025-10-25 22:36:17'),('cc140bfd-c2b7-4124-8ca7-7b29b9c3d435','App\\Notifications\\UserFollowedNotification','App\\Models\\User',154,'{\"type\":\"user_followed\",\"follower_id\":152,\"follower_name\":\"Test User\",\"follower_username\":\"test-user\",\"follower_profile_picture_url\":\"\\/storage\\/users\\/152\\/avatar_1761641454_690083ee3664a.jpg\",\"action_url\":\"\\/profile\\/test-user\",\"message\":\"Test User started following you\"}',NULL,'2025-10-28 12:05:26','2025-10-28 12:05:26');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_photo_tag`
--

DROP TABLE IF EXISTS `photo_photo_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_photo_tag` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `photo_id` bigint unsigned NOT NULL,
  `photo_tag_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_photo_tag_photo_id_photo_tag_id_unique` (`photo_id`,`photo_tag_id`),
  KEY `photo_photo_tag_photo_id_index` (`photo_id`),
  KEY `photo_photo_tag_photo_tag_id_index` (`photo_tag_id`),
  CONSTRAINT `photo_photo_tag_photo_id_foreign` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `photo_photo_tag_photo_tag_id_foreign` FOREIGN KEY (`photo_tag_id`) REFERENCES `photo_tags` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_photo_tag`
--

LOCK TABLES `photo_photo_tag` WRITE;
/*!40000 ALTER TABLE `photo_photo_tag` DISABLE KEYS */;
INSERT INTO `photo_photo_tag` VALUES (1,30,1,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(2,30,2,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(3,31,3,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(4,31,4,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(5,31,5,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(6,31,6,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(7,34,7,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(8,34,8,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(9,34,9,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(10,35,10,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(11,35,11,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(12,35,6,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(13,35,12,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(14,35,8,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(15,36,13,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(16,36,11,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(17,36,1,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(18,36,7,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(19,36,8,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(20,38,2,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(21,39,14,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(22,39,6,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(23,41,11,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(24,41,14,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(25,41,2,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(26,42,15,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(27,43,5,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(28,43,16,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(29,43,17,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(30,43,18,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(31,46,10,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(32,46,3,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(33,46,17,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(34,48,4,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(35,49,10,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(36,49,19,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(37,49,1,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(38,49,18,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(39,49,12,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(40,50,11,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(41,51,6,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(42,54,20,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(43,54,10,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(44,54,3,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(45,54,11,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(46,56,6,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(47,56,8,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(48,57,11,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(49,58,12,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(50,59,10,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(51,59,3,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(52,59,2,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(53,60,4,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(54,60,5,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(55,60,7,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(56,60,12,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(57,62,21,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(58,62,3,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(59,62,16,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(60,62,14,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(61,62,2,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(62,64,17,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(63,64,9,'2025-10-25 10:20:09','2025-10-25 10:20:09'),(64,66,20,'2025-10-25 10:20:09','2025-10-25 10:20:09');
/*!40000 ALTER TABLE `photo_photo_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_tags`
--

DROP TABLE IF EXISTS `photo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photo_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photo_tags_user_id_slug_unique` (`user_id`,`slug`),
  KEY `photo_tags_slug_index` (`slug`),
  KEY `photo_tags_user_id_index` (`user_id`),
  CONSTRAINT `photo_tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo_tags`
--

LOCK TABLES `photo_tags` WRITE;
/*!40000 ALTER TABLE `photo_tags` DISABLE KEYS */;
INSERT INTO `photo_tags` VALUES (1,'sunrise','sunrise',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(2,'ocean','ocean',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(3,'wildlife','wildlife',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(4,'architecture','architecture',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(5,'travel','travel',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(6,'black-white','black-white',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(7,'city','city',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(8,'minimalist','minimalist',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(9,'moody','moody',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(10,'nature','nature',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(11,'sunset','sunset',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(12,'abstract','abstract',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(13,'urban','urban',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(14,'forest','forest',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(15,'mountain','mountain',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(16,'beach','beach',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(17,'night','night',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(18,'macro','macro',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(19,'street','street',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(20,'portrait','portrait',152,'2025-10-25 10:20:08','2025-10-25 10:20:08'),(21,'landscape','landscape',152,'2025-10-25 10:20:09','2025-10-25 10:20:09');
/*!40000 ALTER TABLE `photo_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `album_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `file_path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `original_file_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medium_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint DEFAULT NULL,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `views_count` bigint unsigned NOT NULL DEFAULT '0',
  `downloads_count` bigint unsigned NOT NULL DEFAULT '0',
  `metadata` json DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `photos_album_id_slug_unique` (`album_id`,`slug`),
  KEY `photos_deleted_by_foreign` (`deleted_by`),
  KEY `photos_album_id_index` (`album_id`),
  KEY `photos_user_id_index` (`user_id`),
  KEY `photos_slug_index` (`slug`),
  KEY `photos_album_id_created_at_index` (`album_id`,`created_at`),
  KEY `photos_views_count_index` (`views_count`),
  CONSTRAINT `photos_album_id_foreign` FOREIGN KEY (`album_id`) REFERENCES `albums` (`id`) ON DELETE CASCADE,
  CONSTRAINT `photos_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (30,89,152,'Reiciendis Et Rerum Fugiat','reiciendis-et-rerum-fugiat','Voluptas autem laboriosam voluptatibus neque rem molestiae quia. Molestiae error aliquam eligendi qui perferendis omnis autem. Doloremque totam voluptates deleniti.','photos/sample/ca60c221-f352-3589-b26b-574b59563d38.jpg','photos/sample/original/fc285a93-f52d-378a-8d40-526e4ca6471d.jpg','photos/sample/thumbnail/bd4ed27c-1db3-3848-bbbf-bb6f343fff3d.jpg','photos/sample/medium/88737ae0-3c51-3014-893e-0f1e5c9ca731.jpg','image/jpeg',1358386,3840,2160,145,50,'{\"gps\": null, \"exif\": {\"ISO\": 800, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/2.8\", \"LensModel\": null, \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:06:06 21:06:53\"}}',NULL,NULL,'2024-12-25 22:59:12','2025-10-25 10:20:08'),(31,89,152,NULL,'9EBtDUJ8P8Wv','Fuga unde consequatur consequatur voluptates. Nisi inventore rerum iusto odit qui. Id aut in consequuntur voluptates laudantium repellat alias. Temporibus est nostrum repellat voluptas sint qui quia. Cumque dolor quis est quibusdam reiciendis.','photos/sample/b2f63068-d8da-3127-b966-ef0a8858be0e.jpg','photos/sample/original/96c4328d-ab45-33ab-a28c-a33e4d941a94.jpg','photos/sample/thumbnail/282a7f8d-81ae-383c-bb0d-4523b666e74d.jpg','photos/sample/medium/eaf53fd7-23cd-39ea-a418-50023c25ec49.jpg','image/jpeg',4270947,2560,1080,446,26,'{\"gps\": {\"latitude\": -53.056396, \"longitude\": 130.313119}, \"exif\": {\"ISO\": 1600, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/5.6\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:03:01 12:05:36\"}}',NULL,NULL,'2024-10-31 19:30:30','2025-10-25 10:20:08'),(32,89,152,NULL,'pWEPH1w7X9dI',NULL,'photos/sample/5e07cfb7-3ebc-383c-8ece-c237a0fcf908.jpg','photos/sample/original/b0af5f46-d031-33b7-9383-3cae65ba8723.jpg','photos/sample/thumbnail/7bbabc6f-aac8-3b4d-aa5f-6a8c6e5537c8.jpg','photos/sample/medium/5bbaf999-1f0e-3eaf-8e3a-e06e6562d531.jpg','image/jpeg',2285417,1920,1440,271,33,'{\"gps\": {\"latitude\": -4.781161, \"longitude\": -7.261788}, \"exif\": {\"ISO\": 1600, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/8\", \"LensModel\": null, \"FocalLength\": \"200mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:02:02 08:26:51\"}}',NULL,NULL,'2025-01-30 10:43:38','2025-10-25 10:20:08'),(33,89,152,'Laboriosam Et','laboriosam-et',NULL,'photos/sample/67ab882f-c18e-3b6e-802f-8c12c828c7de.jpg','photos/sample/original/e2681e86-cf24-30bd-b742-7746adb70052.jpg','photos/sample/thumbnail/b6165d82-0a96-30f7-8de4-d751208b7494.jpg','photos/sample/medium/63aa7006-b4cc-3b9c-98bc-54a08aea671b.jpg','image/jpeg',1417409,3840,2160,194,13,'{\"gps\": null, \"exif\": {\"ISO\": 400, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/4\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"24mm\", \"ExposureTime\": \"1/30\", \"DateTimeOriginal\": \"2025:04:06 04:57:34\"}}',NULL,NULL,'2025-02-10 06:35:06','2025-10-25 10:20:08'),(34,89,152,'Sequi Eum','sequi-eum',NULL,'photos/sample/032246e0-3ddd-3097-b29f-7c9346e9e1e2.jpg','photos/sample/original/d9e8a17a-cccc-3f0f-b608-67d200f656d7.jpg','photos/sample/thumbnail/f67308f9-2c1c-3a3a-afa5-969084d9207d.jpg','photos/sample/medium/b92f7e24-341d-3ed5-839c-94b720ccf8b8.jpg','image/jpeg',4875408,1920,1080,15,10,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Fujifilm\", \"Model\": \"X-T5\", \"FNumber\": \"f/2.8\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:07:07 13:48:36\"}}',NULL,NULL,'2025-06-14 21:35:42','2025-10-25 10:20:08'),(35,89,152,'Soluta Magni Omnis A','soluta-magni-omnis-a',NULL,'photos/sample/d022ecd8-12ed-39a8-ba98-e190bc2ccaf4.jpg','photos/sample/original/8bf5ed60-d388-331c-b684-f7cc77b36141.jpg','photos/sample/thumbnail/48aa7b9d-27df-37a1-b52e-8e6b9f79e2f5.jpg','photos/sample/medium/013b51b3-7ab7-3282-ad84-a095b2408c99.jpg','image/jpeg',4830050,4096,2160,89,43,'{\"gps\": {\"latitude\": -62.144809, \"longitude\": -35.803049}, \"exif\": {\"ISO\": 100, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/1.4\", \"LensModel\": null, \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2025:05:01 00:23:25\"}}',NULL,NULL,'2025-06-09 01:16:13','2025-10-25 22:35:01'),(36,89,152,'Reprehenderit Repellat Inventore Repudiandae','reprehenderit-repellat-inventore-repudiandae',NULL,'photos/sample/971d25ad-db75-32ed-b978-9b53e34f63a3.jpg','photos/sample/original/13dcb7ad-5f36-3112-ae18-cbf7928d9519.jpg','photos/sample/thumbnail/57dff835-5a8a-3b4d-a868-56ebfbe0b6ba.jpg','photos/sample/medium/e69976ee-59ab-34cb-975f-afd6ac831f8b.jpg','image/jpeg',1261628,2560,1440,151,12,'{\"gps\": null, \"exif\": {\"ISO\": 400, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/1.8\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/500\", \"DateTimeOriginal\": \"2025:04:18 09:41:19\"}}',NULL,NULL,'2024-11-15 16:29:33','2025-10-25 10:20:08'),(37,89,152,'Quibusdam Fugit Vel Ipsam Non','quibusdam-fugit-vel-ipsam-non','Pariatur et cupiditate ullam ea. Beatae sed repudiandae debitis voluptatem est facilis. Aut omnis adipisci nulla qui nihil et sequi. Et sapiente iusto dolores aut magnam.','photos/sample/2acd8974-616f-39fb-9373-c97a69d13e1d.jpg','photos/sample/original/67fe09aa-1768-33e3-b5e6-e627b179378a.jpg','photos/sample/thumbnail/218da3cd-920a-3888-9ff3-9c42453a418a.jpg','photos/sample/medium/3029c1c3-2471-3ccf-9da1-7f7ed8e29e9f.jpg','image/jpeg',1825904,3840,2160,209,33,'{\"gps\": {\"latitude\": -73.93865, \"longitude\": 159.821704}, \"exif\": {\"ISO\": 100, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/4\", \"LensModel\": \"Nikkor Z 24-70mm f/2.8 S\", \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2024:12:06 07:15:08\"}}',NULL,NULL,'2025-07-03 13:39:34','2025-10-25 10:20:08'),(38,89,152,'A Omnis Rem','a-omnis-rem',NULL,'photos/sample/23969d3e-c109-3c92-ac1d-b72c0f7caefe.jpg','photos/sample/original/bc871c2c-e82c-38b5-ac31-0346019f03bc.jpg','photos/sample/thumbnail/037214af-731d-337a-b057-0905978c3f00.jpg','photos/sample/medium/3b5ff674-9508-3b03-a529-325d8353472c.jpg','image/jpeg',1086195,2560,1080,447,36,'{\"gps\": null, \"exif\": {\"ISO\": 1600, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/1.8\", \"LensModel\": null, \"FocalLength\": \"50mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:01:30 03:57:39\"}}',NULL,NULL,'2025-02-10 10:09:18','2025-10-25 22:35:48'),(39,89,152,'In Expedita','in-expedita',NULL,'photos/sample/a8652da7-aabd-379a-a52b-dac82a77f362.jpg','photos/sample/original/57396462-d77b-3720-91ca-c18c912c126a.jpg','photos/sample/thumbnail/f4561966-260e-39f7-97b7-f1b823a99272.jpg','photos/sample/medium/d6ff70d2-2e9c-3ce0-bc40-529bd8e6d973.jpg','image/jpeg',3688789,1920,2304,133,23,'{\"gps\": {\"latitude\": 87.452949, \"longitude\": -87.764397}, \"exif\": {\"ISO\": 800, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/2.8\", \"LensModel\": null, \"FocalLength\": \"24mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:09:28 16:36:16\"}}',NULL,NULL,'2025-07-24 08:01:58','2025-10-25 22:34:58'),(40,89,152,'Quis Rerum','quis-rerum','Voluptatibus dolore et sed. Earum harum provident ad placeat non ipsum nulla. Vel aut non nesciunt voluptas. Corporis ut eum voluptatem voluptate autem dolore.','photos/sample/3296f05f-cd1e-34b9-bee9-b67c3261c425.jpg','photos/sample/original/94c0ec64-5c51-34f2-94e2-0929fb29e997.jpg','photos/sample/thumbnail/e2381686-5804-3c53-bf7f-221e5042de74.jpg','photos/sample/medium/8929a55e-6a5c-3a25-94ee-a5de556b48e3.jpg','image/jpeg',3758979,3840,2304,353,7,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/1.4\", \"LensModel\": null, \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:06:10 17:54:20\"}}',NULL,NULL,'2024-12-22 18:38:08','2025-10-25 10:20:08'),(41,89,152,'Veniam Dolorum Est','veniam-dolorum-est',NULL,'photos/sample/1fa83393-a858-3a5a-b3c7-547441ae239b.jpg','photos/sample/original/35070de7-40ab-3da0-9908-834c15006ad9.jpg','photos/sample/thumbnail/66b9da3d-fb96-397c-9424-e9fab834a60e.jpg','photos/sample/medium/4e8eec83-e955-3eb2-b8f9-d0b158620d89.jpg','image/jpeg',3218807,4096,1080,438,42,'{\"gps\": {\"latitude\": -57.704501, \"longitude\": -106.027183}, \"exif\": {\"ISO\": 400, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/2\", \"LensModel\": null, \"FocalLength\": \"135mm\", \"ExposureTime\": \"1/500\", \"DateTimeOriginal\": \"2025:06:04 23:29:48\"}}',NULL,NULL,'2025-04-09 02:28:59','2025-10-25 10:20:08'),(42,89,152,'Voluptatibus Minus Quam Earum','voluptatibus-minus-quam-earum','Voluptatum dolor laudantium quis sed. Rerum eveniet fugit rerum a velit doloribus quis.','photos/sample/8b54398e-cc07-362a-bf13-0f3130cfc6fe.jpg','photos/sample/original/ea66fab9-849c-3619-8780-15f290f55607.jpg','photos/sample/thumbnail/23bb5412-8678-3c38-a953-1587c2d9e330.jpg','photos/sample/medium/a08be584-c2be-3dee-9508-fe6df401dbf2.jpg','image/jpeg',3430798,3840,1080,366,39,'{\"gps\": null, \"exif\": {\"ISO\": 400, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/2.8\", \"LensModel\": null, \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2025:01:04 16:53:40\"}}',NULL,NULL,'2025-04-14 09:05:50','2025-10-25 10:20:08'),(43,89,152,'Ut Vel Consequatur Voluptatem','ut-vel-consequatur-voluptatem',NULL,'photos/sample/0f814d0c-9135-30ca-8a52-94683fb91e1f.jpg','photos/sample/original/08a477c0-f7f9-324e-8087-30c3e5838adf.jpg','photos/sample/thumbnail/da9195f5-4362-3ae4-b8c0-8063e4d1dd1a.jpg','photos/sample/medium/a0b17a77-6c8f-3795-ad85-6706c10fa81f.jpg','image/jpeg',1540064,4096,1080,193,37,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/8\", \"LensModel\": null, \"FocalLength\": \"85mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:08:02 23:18:51\"}}',NULL,NULL,'2025-04-28 01:02:00','2025-10-25 10:20:08'),(44,90,152,'Quia In Quos','quia-in-quos','Tempora ut quidem velit sunt quis est. Nostrum aut nulla omnis. Quam veritatis vel molestias iste similique quidem rem.','photos/sample/6ff2ce3c-cb10-33b5-8dd6-c7a6f9aa5284.jpg','photos/sample/original/3439120b-c04a-3b29-ab77-358a1733289c.jpg','photos/sample/thumbnail/6e54cd90-0783-3547-90eb-10fb405c4a60.jpg','photos/sample/medium/1b4fde99-971c-3dd3-838d-3b6674a0e4d6.jpg','image/jpeg',4283726,4096,2304,176,32,'{\"gps\": null, \"exif\": {\"ISO\": 3200, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/4\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2024:12:02 20:22:59\"}}',NULL,NULL,'2025-04-21 08:23:20','2025-10-25 10:20:08'),(45,90,152,'Esse Ut','esse-ut','Voluptatibus doloribus omnis nemo itaque. Quo optio temporibus omnis libero distinctio ea aut magni. Nobis et qui molestias illum quia porro esse. Inventore voluptatum et ducimus.','photos/sample/e8906a66-4c8f-3802-bd3a-bca7fae99aed.jpg','photos/sample/original/f33f6098-98b3-3a82-8820-82e35576a51a.jpg','photos/sample/thumbnail/50e96536-fe66-3b2b-81c0-3b10d5a13220.jpg','photos/sample/medium/418e84b6-7fdb-3dfe-a799-8c88357a0d4d.jpg','image/jpeg',738518,4096,2304,445,11,'{\"gps\": null, \"exif\": {\"ISO\": 800, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/1.8\", \"LensModel\": null, \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2025:01:11 05:41:40\"}}',NULL,NULL,'2025-10-03 23:31:15','2025-10-25 10:20:08'),(46,90,152,'Quas Necessitatibus Dignissimos','quas-necessitatibus-dignissimos','Veniam voluptatem et eligendi culpa nemo earum. Delectus earum ut sapiente qui eum. Est illo quia perspiciatis minus voluptatem.','photos/sample/b937c63c-b96b-3a8e-a5c3-98e1b2ab353d.jpg','photos/sample/original/22e02751-3905-38d4-8bb6-3aaecda80290.jpg','photos/sample/thumbnail/561bb461-6fe3-3018-9782-56904f817cce.jpg','photos/sample/medium/37ad49cf-989c-3c8e-92a9-8a5179036fbb.jpg','image/jpeg',2825450,4096,2160,461,43,'{\"gps\": {\"latitude\": 34.344485, \"longitude\": 36.903214}, \"exif\": {\"ISO\": 400, \"Make\": \"Canon\", \"Model\": \"EOS R5\", \"FNumber\": \"f/2\", \"LensModel\": null, \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2025:02:26 13:40:06\"}}',NULL,NULL,'2025-03-27 08:47:23','2025-10-25 10:20:08'),(47,90,152,'Illo Fugiat Sapiente Voluptatum Quis','illo-fugiat-sapiente-voluptatum-quis','Magni expedita vitae omnis omnis. Impedit sapiente ea deleniti quae qui velit eos ut. Odit quasi dolorem sequi beatae ducimus in aliquid temporibus. Maiores voluptatum quod odio quidem.','photos/sample/cacaacaf-da95-306d-b670-ce8af0ea1155.jpg','photos/sample/original/cfe517c6-8077-3845-b510-18949593e892.jpg','photos/sample/thumbnail/8367ae6f-bcac-319b-88c2-1ec53b705566.jpg','photos/sample/medium/fa5b6f04-fc46-3a42-84e4-241d54043618.jpg','image/jpeg',1555833,1920,2160,247,50,'{\"gps\": null, \"exif\": {\"ISO\": 800, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/2.8\", \"LensModel\": null, \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:06:10 23:56:36\"}}',NULL,NULL,'2024-12-06 07:43:17','2025-10-25 10:20:08'),(48,90,152,'Quisquam Nesciunt','quisquam-nesciunt','Ut omnis sed ut voluptatem. Quam autem inventore qui perspiciatis quis id aut. Exercitationem amet consectetur quas omnis voluptatibus nam.','photos/sample/3f7421f5-9945-3e25-a14c-3e74ad88e5ec.jpg','photos/sample/original/d5a960fb-31f8-3d30-a483-39afeaff7b1e.jpg','photos/sample/thumbnail/63a76d25-e118-3dbf-a84a-d7b7724d600e.jpg','photos/sample/medium/87fb1877-42c7-346e-b8d1-351859fd96d1.jpg','image/jpeg',4789325,2560,2160,178,37,'{\"gps\": null, \"exif\": {\"ISO\": 400, \"Make\": \"Fujifilm\", \"Model\": \"X-T5\", \"FNumber\": \"f/4\", \"LensModel\": \"Nikkor Z 24-70mm f/2.8 S\", \"FocalLength\": \"200mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:06:09 19:58:36\"}}',NULL,NULL,'2025-05-14 10:04:48','2025-10-25 10:20:08'),(49,90,152,'Iusto Distinctio Veniam Aut Debitis','iusto-distinctio-veniam-aut-debitis',NULL,'photos/sample/855b51bd-606c-3c29-95c9-26ae8e69ad89.jpg','photos/sample/original/69aea770-fcc4-3f28-89e1-1c2ff2c8fedf.jpg','photos/sample/thumbnail/91bd96de-412c-3ad3-babe-0c957874e754.jpg','photos/sample/medium/9b1b38ed-6b8f-3d59-a676-ad3193b77eda.jpg','image/jpeg',589785,1920,2304,206,7,'{\"gps\": null, \"exif\": {\"ISO\": 3200, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/2\", \"LensModel\": null, \"FocalLength\": \"50mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:08:09 06:27:12\"}}',NULL,NULL,'2025-07-03 01:27:03','2025-10-26 17:55:44'),(50,90,152,NULL,'cmbnrUCqE7mZ',NULL,'photos/sample/495ab343-4b5a-3bea-a06c-a263281c75db.jpg','photos/sample/original/fd7b3892-4a9f-3c29-a410-5d681f933298.jpg','photos/sample/thumbnail/2d82ae7c-d677-3a15-b253-05e303eceef4.jpg','photos/sample/medium/c2de8115-eda7-3ab1-b68a-c189f475d641.jpg','image/jpeg',4130723,1920,1440,132,3,'{\"gps\": {\"latitude\": -72.223405, \"longitude\": 127.991808}, \"exif\": {\"ISO\": 400, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/1.4\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2025:05:30 22:16:01\"}}',NULL,NULL,'2025-02-21 05:00:58','2025-10-25 10:20:08'),(51,90,152,'Dicta Hic Corrupti Debitis','dicta-hic-corrupti-debitis',NULL,'photos/sample/2ada2efe-e27c-378a-9b5b-b05755a7d358.jpg','photos/sample/original/25299d42-1aa6-3125-a85b-923c3be215f4.jpg','photos/sample/thumbnail/c2aa6313-338a-3596-8028-40465c8d0607.jpg','photos/sample/medium/b5517499-5742-38a5-990a-1b833c1eaa10.jpg','image/jpeg',4337064,4096,2160,5,44,'{\"gps\": null, \"exif\": {\"ISO\": 1600, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/5.6\", \"LensModel\": null, \"FocalLength\": \"50mm\", \"ExposureTime\": \"1/500\", \"DateTimeOriginal\": \"2025:07:23 14:58:37\"}}',NULL,NULL,'2025-03-07 08:44:36','2025-10-25 10:20:08'),(52,90,152,'Et Nam','et-nam','Qui aut quod aliquid exercitationem voluptatum maxime soluta. Optio inventore qui quis rem ut nostrum voluptatem.','photos/sample/31ecf9fd-d4ff-3bc1-afea-6c6fcf2f190b.jpg','photos/sample/original/bd932757-b802-3c12-8b64-d8f5f43de2a7.jpg','photos/sample/thumbnail/a732fe08-68c8-3d2a-9e12-52ada1198abd.jpg','photos/sample/medium/2f718b71-2874-3989-8591-1403947e9744.jpg','image/jpeg',1190681,3840,1440,126,50,'{\"gps\": null, \"exif\": {\"ISO\": 800, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/4\", \"LensModel\": \"Nikkor Z 24-70mm f/2.8 S\", \"FocalLength\": \"100mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:05:20 18:02:18\"}}',NULL,NULL,'2025-06-04 11:47:35','2025-10-25 10:20:08'),(53,90,152,NULL,'s7jxcRw3I1uO',NULL,'photos/sample/b2bffbce-dfad-3845-80c2-588d8d15c04e.jpg','photos/sample/original/1757ce97-42ef-309e-a18e-7d58e07b0193.jpg','photos/sample/thumbnail/f7638a2b-a2b8-33b3-85d5-835e34fb5570.jpg','photos/sample/medium/8fdd0530-ab2b-3edf-8a2d-9c87c69d25aa.jpg','image/jpeg',1162521,3840,1440,2,48,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/2.8\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"85mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:04:26 11:57:14\"}}',NULL,NULL,'2025-05-20 07:58:04','2025-10-25 10:20:08'),(54,91,152,'Architecto Eligendi Error','architecto-eligendi-error','Qui aspernatur minus earum eligendi et voluptas saepe quisquam. Sit assumenda cumque molestias sint aut harum laboriosam. Ea alias enim eaque quae est.','photos/sample/fb9ea92a-e82b-34f6-96e6-95b03ca90bb9.jpg','photos/sample/original/99a53bad-74fb-3bb0-b62f-df75537abc6c.jpg','photos/sample/thumbnail/0d112a2a-0a38-370d-925f-4e1cd58033f4.jpg','photos/sample/medium/c9ec654e-7dc7-3a37-882c-5d6705fa0d89.jpg','image/jpeg',4706899,1920,2160,287,46,'{\"gps\": null, \"exif\": {\"ISO\": 200, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/2.8\", \"LensModel\": null, \"FocalLength\": \"24mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2025:01:21 18:50:16\"}}',NULL,NULL,'2025-03-02 23:15:49','2025-10-25 10:20:08'),(55,91,152,NULL,'1WwCsyVrwVrV',NULL,'photos/sample/d3353ce9-1905-37cd-8e10-fd6f193c4236.jpg','photos/sample/original/bb311ce1-31ae-3a85-b8d4-b63133be0800.jpg','photos/sample/thumbnail/979bab6e-3550-3158-803c-c2f1f359a4db.jpg','photos/sample/medium/1918f67f-0e90-3285-a530-6f669c1652f9.jpg','image/jpeg',1802175,2560,2304,244,21,'{\"gps\": {\"latitude\": -60.576603, \"longitude\": 43.223776}, \"exif\": {\"ISO\": 800, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/4\", \"LensModel\": \"Nikkor Z 24-70mm f/2.8 S\", \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:05:05 02:02:36\"}}',NULL,NULL,'2025-01-19 16:04:38','2025-10-25 10:20:08'),(56,91,152,NULL,'EwpIboIbuBTV','Ex molestiae alias sint reiciendis. Aliquid earum laudantium tempore est quasi. Qui sed maxime porro a minus nemo. Et voluptatum id harum qui.','photos/sample/b63d0aae-e837-30a3-b403-a0087ee9d0cc.jpg','photos/sample/original/641f3fe1-f987-33ab-991b-0e4e51fd32a7.jpg','photos/sample/thumbnail/d1436dbd-56f4-33c6-bf96-5f75e4eb2ff5.jpg','photos/sample/medium/cd294e42-6040-39ed-9b2d-ce931dde8203.jpg','image/jpeg',3279846,1920,1440,150,36,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/2\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"24mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:10:05 11:09:47\"}}',NULL,NULL,'2024-10-27 16:00:23','2025-10-25 10:20:08'),(57,91,152,NULL,'hjkV1UDzdCkD','Sequi sed neque temporibus sed saepe voluptas cum. Amet est quae vel tenetur accusamus. Numquam accusantium asperiores cumque soluta repellat in.','photos/sample/7ecba0aa-961e-3780-8373-9c30627e4607.jpg','photos/sample/original/f9e705ec-0308-33ba-9123-3813e641809d.jpg','photos/sample/thumbnail/d7354ef1-7f04-3c05-a0a5-89ed5c09cbce.jpg','photos/sample/medium/c7b2a7e1-81cb-32d4-af45-f368d5f0e8ab.jpg','image/jpeg',663948,4096,1440,37,23,'{\"gps\": {\"latitude\": -84.165433, \"longitude\": 134.212711}, \"exif\": {\"ISO\": 800, \"Make\": \"Nikon\", \"Model\": \"Z9\", \"FNumber\": \"f/2\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"24mm\", \"ExposureTime\": \"1/30\", \"DateTimeOriginal\": \"2025:08:04 13:23:35\"}}',NULL,NULL,'2025-09-26 19:37:48','2025-10-25 10:20:08'),(58,91,152,NULL,'QZRv9wDdDu4g',NULL,'photos/sample/2424b108-0e01-3aac-a0f5-dfbaecc1d178.jpg','photos/sample/original/cb5dab28-13ab-39b1-aac4-8a9b4daa9d69.jpg','photos/sample/thumbnail/7a87be87-0ede-3059-9920-5f713f35be3b.jpg','photos/sample/medium/7926c712-3e64-3401-9be6-1b09d3e439e6.jpg','image/jpeg',4006860,4096,1080,45,46,'{\"gps\": null, \"exif\": {\"ISO\": 100, \"Make\": \"Canon\", \"Model\": \"EOS R5\", \"FNumber\": \"f/2\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"200mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:08:27 15:01:57\"}}',NULL,NULL,'2024-10-25 22:37:52','2025-10-25 10:20:08'),(59,91,152,NULL,'IxZLZvOe7Wml','Reiciendis aut soluta expedita velit quis voluptatibus quos. Id ipsam inventore et assumenda. Incidunt qui rem excepturi est eos et.','photos/sample/935596e2-bc94-3183-8d3e-5d86e1d84a66.jpg','photos/sample/original/79a77635-ac53-38a9-b2a9-54631dc9cc25.jpg','photos/sample/thumbnail/83f0776c-9825-3922-96a9-2eb9780fde1b.jpg','photos/sample/medium/c12a0e5e-16d6-3a76-be50-8c6e88ece72d.jpg','image/jpeg',2640242,2560,2160,240,20,'{\"gps\": {\"latitude\": 43.561034, \"longitude\": 29.516349}, \"exif\": {\"ISO\": 1600, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/4\", \"LensModel\": null, \"FocalLength\": \"135mm\", \"ExposureTime\": \"1/125\", \"DateTimeOriginal\": \"2025:07:21 22:44:02\"}}',NULL,NULL,'2025-10-02 00:55:33','2025-10-25 10:20:08'),(60,91,152,'Pariatur Rerum Quibusdam Officiis Aperiam','pariatur-rerum-quibusdam-officiis-aperiam',NULL,'photos/sample/3b0acb79-c5c4-3583-821f-ae23f7ca4fcf.jpg','photos/sample/original/4797e5bf-2baf-3bbb-8099-704e62f79af7.jpg','photos/sample/thumbnail/043a6147-38be-3fda-8b8d-a7239eabaf88.jpg','photos/sample/medium/1e2dc2a6-6507-3ad5-ae6f-08f9c163b0b4.jpg','image/jpeg',3405117,4096,2304,486,0,'{\"gps\": null, \"exif\": {\"ISO\": 3200, \"Make\": \"Canon\", \"Model\": \"EOS R5\", \"FNumber\": \"f/2\", \"LensModel\": \"Fujifilm XF 16-55mm f/2.8\", \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/60\", \"DateTimeOriginal\": \"2025:02:24 23:08:08\"}}',NULL,NULL,'2025-09-11 05:48:10','2025-10-25 10:20:08'),(61,91,152,'Quis Nostrum Voluptatibus','quis-nostrum-voluptatibus','Aut tempore ipsa dolores natus. Qui et voluptate accusantium nostrum recusandae. Qui et ut neque quia deserunt nam voluptatem. Tempora et qui dolorem quia ut.','photos/sample/6e4e04f9-5802-3b0b-a556-ca8a0d9d4f20.jpg','photos/sample/original/9fdb619f-f709-3ea1-bdfd-e1c7a98f0e56.jpg','photos/sample/thumbnail/8729cb4d-9f6c-3b8f-be21-6fc307531438.jpg','photos/sample/medium/15e5745b-a34c-33f0-8450-0db1fbe2d43d.jpg','image/jpeg',3137679,1920,2160,369,5,'{\"gps\": {\"latitude\": -13.192378, \"longitude\": -129.210231}, \"exif\": {\"ISO\": 200, \"Make\": \"Apple\", \"Model\": \"iPhone 15 Pro\", \"FNumber\": \"f/1.4\", \"LensModel\": null, \"FocalLength\": \"70mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2025:04:08 06:08:12\"}}',NULL,NULL,'2025-02-24 16:52:32','2025-10-25 10:20:08'),(62,91,152,'Quia Nemo Non Quaerat','quia-nemo-non-quaerat','Sunt aut eaque libero eos. Tempore accusamus sequi voluptatibus asperiores aliquam. Quia odio recusandae quia eius perspiciatis sit. Quos distinctio rerum non aliquam. Quaerat laboriosam et exercitationem accusantium.','photos/sample/34835960-79fc-35f9-9d26-0949be96fc3f.jpg','photos/sample/original/0dc62787-f27a-3ba0-b464-d77a3c550ece.jpg','photos/sample/thumbnail/6c8dc9c2-360d-3dfc-ada2-a176743078bf.jpg','photos/sample/medium/3279b99f-53bf-3469-87fc-6f2ef71ee742.jpg','image/jpeg',1618187,2560,1080,433,1,'{\"gps\": {\"latitude\": -73.066664, \"longitude\": -74.855342}, \"exif\": {\"ISO\": 200, \"Make\": \"Canon\", \"Model\": \"EOS R5\", \"FNumber\": \"f/1.8\", \"LensModel\": \"Nikkor Z 24-70mm f/2.8 S\", \"FocalLength\": \"200mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2025:10:08 14:54:52\"}}',NULL,NULL,'2025-03-27 03:14:09','2025-10-25 10:20:08'),(63,91,152,NULL,'H9C6asjG9n4Z','Totam qui vero sequi est ut. Nesciunt odio aut pariatur quia rem sequi. Quo nesciunt provident vitae cupiditate velit corrupti veritatis. Molestias non voluptas distinctio quis eum sunt non nisi.','photos/sample/d0269eaa-3480-3521-8d51-dcd1ed7e34db.jpg','photos/sample/original/4ee0e067-d741-3d30-92cc-52c84fb74360.jpg','photos/sample/thumbnail/40ff604d-eca8-33a9-b1fa-ac138c0c42af.jpg','photos/sample/medium/f6e65ac9-1b95-3dae-bbb7-0dd596f6bd1c.jpg','image/jpeg',874177,1920,2304,325,26,'{\"gps\": null, \"exif\": {\"ISO\": 3200, \"Make\": \"Fujifilm\", \"Model\": \"X-T5\", \"FNumber\": \"f/2.8\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/250\", \"DateTimeOriginal\": \"2024:11:26 19:37:16\"}}',NULL,NULL,'2025-10-02 21:52:34','2025-10-25 10:20:08'),(64,91,152,'Iste Accusantium Et Minima Soluta','iste-accusantium-et-minima-soluta',NULL,'photos/sample/c4b9baf0-063d-312e-8f3d-c34b1a6b0de3.jpg','photos/sample/original/d74a9824-5686-3687-9676-6fe5bda98c17.jpg','photos/sample/thumbnail/c2099f91-65a8-34fe-8ecd-2623dd26c651.jpg','photos/sample/medium/07db6ccd-9d7f-356e-85d1-65f808d4e25f.jpg','image/jpeg',4805439,4096,1440,250,41,'{\"gps\": null, \"exif\": {\"ISO\": 1600, \"Make\": \"Sony\", \"Model\": \"A7R V\", \"FNumber\": \"f/1.4\", \"LensModel\": \"Sony FE 24-70mm f/2.8 GM II\", \"FocalLength\": \"135mm\", \"ExposureTime\": \"1/500\", \"DateTimeOriginal\": \"2024:11:21 19:13:29\"}}',NULL,NULL,'2024-11-18 23:24:18','2025-10-25 10:20:08'),(65,91,152,NULL,'YJE3Z3m5c9Xt','Aliquam est repudiandae est qui est consequatur. Qui consequatur dolorum ipsam eius quo distinctio nobis. Est distinctio qui fugiat dicta minima est. Asperiores optio rerum eos sapiente voluptas eveniet.','photos/sample/57e565cc-2a62-35b2-9be8-9caacf42e8d5.jpg','photos/sample/original/2825a671-a78d-3ef2-831a-e16408f7b9ae.jpg','photos/sample/thumbnail/0292829c-1d33-33b1-8f94-eda48f3e0e56.jpg','photos/sample/medium/ebb1c7f4-d2b6-34d6-b939-c20443bc2ee7.jpg','image/jpeg',2317636,4096,1080,246,10,'{\"gps\": null, \"exif\": {\"ISO\": 200, \"Make\": \"Fujifilm\", \"Model\": \"X-T5\", \"FNumber\": \"f/5.6\", \"LensModel\": \"Canon RF 24-70mm f/2.8L\", \"FocalLength\": \"200mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2025:04:21 02:58:12\"}}',NULL,NULL,'2025-09-04 12:05:41','2025-10-25 10:20:08'),(66,91,152,'Nemo Sed Laboriosam Reiciendis Commodi','nemo-sed-laboriosam-reiciendis-commodi',NULL,'photos/sample/74116a71-46a1-3a0f-a4a4-3de9c1228468.jpg','photos/sample/original/bbe5d045-3654-32f6-ba44-61e936eed214.jpg','photos/sample/thumbnail/946a240a-6596-3740-9845-06e3e7d0aae1.jpg','photos/sample/medium/0e73b594-206b-3e9a-b95c-20ef085ce729.jpg','image/jpeg',717528,1920,1440,231,22,'{\"gps\": null, \"exif\": {\"ISO\": 1600, \"Make\": \"Fujifilm\", \"Model\": \"X-T5\", \"FNumber\": \"f/1.8\", \"LensModel\": null, \"FocalLength\": \"35mm\", \"ExposureTime\": \"1/1000\", \"DateTimeOriginal\": \"2024:10:28 09:43:18\"}}',NULL,NULL,'2025-07-27 20:14:48','2025-10-25 10:20:08'),(67,92,154,NULL,'-1',NULL,'photos/154/test-visibility/large_test-visibility_1761431415_68fd4f77cbb1c.jpg','photos/154/test-visibility/original_test-visibility_1761431415_68fd4f77cbb1c.webp','photos/154/test-visibility/thumb_test-visibility_1761431415_68fd4f77cbb1c.jpg','photos/154/test-visibility/medium_test-visibility_1761431415_68fd4f77cbb1c.jpg','image/webp',20410,411,274,6,0,'[]',NULL,NULL,'2025-10-25 22:30:16','2025-10-25 22:31:16'),(68,90,152,NULL,'-2',NULL,'photos/152/test-album-1/large_test-album_1761815054_69032a0e22392.jpg','photos/152/test-album-1/original_test-album_1761815054_69032a0e22392.webp','photos/152/test-album-1/thumb_test-album_1761815054_69032a0e22392.jpg','photos/152/test-album-1/medium_test-album_1761815054_69032a0e22392.jpg','image/webp',19956,438,251,0,0,'[]',NULL,NULL,'2025-10-30 09:04:14','2025-10-30 09:04:14');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_attachments`
--

DROP TABLE IF EXISTS `post_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_attachments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int DEFAULT NULL,
  `created_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_attachments_post_id_foreign` (`post_id`),
  KEY `post_attachments_created_by_foreign` (`created_by`),
  CONSTRAINT `post_attachments_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `post_attachments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_attachments`
--

LOCK TABLES `post_attachments` WRITE;
/*!40000 ALTER TABLE `post_attachments` DISABLE KEYS */;
INSERT INTO `post_attachments` VALUES (1,10,'Project Plan.pdf','post_attachments/1761814257_690326f1ab155.pdf','application/pdf',275173,152,NULL),(2,10,'database_EER.png','post_attachments/1761814258_690326f25517d.png','image/png',174386,152,NULL),(3,11,'OIP (2).webp','post_attachments/1761814744_690328d8b2cca.webp','image/webp',19956,154,NULL);
/*!40000 ALTER TABLE `post_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_reactions`
--

DROP TABLE IF EXISTS `post_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_reactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reactable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reactable_id` bigint unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_reactions_reactable_type_reactable_id_index` (`reactable_type`,`reactable_id`),
  KEY `post_reactions_user_id_foreign` (`user_id`),
  CONSTRAINT `post_reactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_reactions`
--

LOCK TABLES `post_reactions` WRITE;
/*!40000 ALTER TABLE `post_reactions` DISABLE KEYS */;
INSERT INTO `post_reactions` VALUES (3,'App\\Models\\Post',2,'love',152,'2025-10-28 08:51:19'),(4,'App\\Models\\Comment',2,'like',154,'2025-10-28 08:52:29'),(5,'App\\Models\\Post',10,'love',152,'2025-10-30 08:51:31'),(6,'App\\Models\\Post',9,'love',154,'2025-10-30 08:57:57'),(7,'App\\Models\\Comment',3,'like',154,'2025-10-30 09:01:03');
/*!40000 ALTER TABLE `post_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `visibility` enum('public','private','followers_only') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'public',
  `user_id` bigint unsigned NOT NULL,
  `group_id` bigint unsigned DEFAULT NULL,
  `deleted_by` bigint unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_user_id_foreign` (`user_id`),
  KEY `posts_group_id_foreign` (`group_id`),
  KEY `posts_deleted_by_foreign` (`deleted_by`),
  CONSTRAINT `posts_deleted_by_foreign` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  CONSTRAINT `posts_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'<h2>my first post</h2>','public',152,NULL,NULL,NULL,'2025-10-25 10:52:29','2025-10-25 10:52:29'),(2,'<h2>Another post by me</h2>','public',154,NULL,NULL,NULL,'2025-10-25 14:16:02','2025-10-25 14:16:02'),(3,'<p>wewwdadasd</p>','public',152,NULL,NULL,'2025-10-26 01:27:25','2025-10-26 01:27:10','2025-10-26 01:27:25'),(4,'<p>Great win <strong>#good-game #best-score </strong>Score: 2-5</p>','public',152,NULL,NULL,'2025-10-26 01:45:01','2025-10-26 01:44:24','2025-10-26 01:45:01'),(5,'<p>Football article</p>','public',152,NULL,NULL,'2025-10-29 13:05:53','2025-10-29 13:05:43','2025-10-29 13:05:53'),(6,'\"It\'s official: I\'m not the quarterback. My team just proved it for me ?\"','public',152,NULL,NULL,NULL,'2025-10-29 14:09:47','2025-10-29 14:09:47'),(7,'\"Who says the impossible is impossible? Let\'s crush this game and make it a reality! What\'s your game plan?\"','public',152,NULL,NULL,NULL,'2025-10-29 14:10:22','2025-10-29 14:10:22'),(8,'<p>\"WOW, what an EPIC game yesterday!\" Indeed crazy</p>','public',152,NULL,NULL,NULL,'2025-10-29 14:29:04','2025-10-29 14:29:04'),(9,'\"We\'re excited to announce a new initiative to take our company to the next level. Stay tuned for updates! #ComingSoon\"','public',152,NULL,NULL,NULL,'2025-10-29 14:41:25','2025-10-29 14:41:25'),(10,'<p>Nice game</p>','public',152,NULL,NULL,NULL,'2025-10-30 08:50:57','2025-10-30 08:50:57'),(11,'<p>This is something from the other user</p>','public',154,5,NULL,'2025-10-30 09:10:13','2025-10-30 08:59:04','2025-10-30 09:10:13'),(12,'<p>Change </p>','public',154,5,NULL,NULL,'2025-10-30 09:11:07','2025-10-30 09:11:27'),(13,'<p>vcadsbchadsbchasdca</p><p> </p>','public',152,5,NULL,NULL,'2025-10-30 09:11:49','2025-10-30 09:11:49'),(14,'<blockquote><h3>\"Dream Big, Train Harder! Want to dominate any sport? Focus on your weaknesses, practice consistently, and never give up on your goals. Believe in yourself and watch your potential soar!\" </h3></blockquote>','public',154,5,NULL,NULL,'2025-10-30 09:23:29','2025-10-30 09:23:29');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('5RIO2zeBQ4gbWeUbrdhtpFXzIYBgv2NZ4HpjSwni',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmdVSWJZOElLSVhCN0lrQWdJZmZ0UkpkeFh1TUIwbHA4Y0NNcFYwSyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2dyb3Vwcy90ZXN0LWdyb3VwLTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1761825682),('BjaFKIOzmltd3vkpkANM7qVwb9oe3983ohSacaIY',154,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoia0RvbWIzTmttdnk3c1I0MVVpeUJ5allxYXBzQkpiS2FQSndlYW1qQyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZ3JvdXBzL3Rlc3QtZ3JvdXAtMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1NDt9',1761817318),('bL7FWOCHOPgZGAnBmFZN6mZnNQkyENcH9E8AOWcv',152,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRmRrTDlPOTlYTHdKc0pPMjJoSUNEbkNBUFpEM1RxT053OVUxazR4YSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZ3JvdXBzL3Rlc3QtZ3JvdXAtMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE1Mjt9',1761817327),('rRIRXREHiw5qP60ufKjpc8iVglvuX430rAQeSMpL',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36 Edg/141.0.0.0','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQUJnb2pkUHo3SlpWRXloZzU2aFR2THZ3Y0IwTmFxWFMxck5DSThsaiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2dyb3Vwcy90ZXN0LWdyb3VwLTEvZWRpdCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1761825682);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture_path` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (152,'Test User','test@example.com','2025-10-25 10:20:07','$2y$12$GbbtbzkKBSWjuf4QFPyCg.2Ajp4OR815/XWiG/l2zKA6JIaTVcIje',NULL,NULL,NULL,'enigN7dppW','2025-10-25 10:20:08','2025-10-30 09:02:21','test-user','/storage/user/152/cover_1761814939_6903299b36466.jpg','/storage/users/152/avatar_1761641454_690083ee3664a.jpg'),(154,'Jame Doe','jame@gmail.com','2025-10-25 14:15:32','$2y$12$sCr7ly7uZLr1883qtdxJTebiH0aAi6QNSAIUmoKtLBsbPRw5L3WAy',NULL,NULL,NULL,NULL,'2025-10-25 14:15:05','2025-10-25 14:20:28','jame-doe','/storage/user/154/cover_1761402028_68fcdcac8a478.jpg','/storage/users/154/avatar_1761402019_68fcdca34a678.jpg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-30 19:20:51
