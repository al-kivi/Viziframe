DROP TABLE IF EXISTS "comments";
CREATE TABLE `comments` (`id` integer PRIMARY KEY AUTOINCREMENT, `username` varchar(255) NULL, `comment` text NOT NULL, `created_at` timestamp, `post_id` integer REFERENCES `posts`(`id`) ON DELETE CASCADE ON UPDATE CASCADE, `user_id` integer REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO "comments" VALUES(2,NULL,'This post is all Greek to me.','2012-07-07 17:16:57.601319-0400',7,1);
DROP TABLE IF EXISTS "posts";
CREATE TABLE `posts` (`id` integer PRIMARY KEY AUTOINCREMENT, `title` varchar(255) NOT NULL, `body` text NOT NULL, `created_at` timestamp, `updated_at` timestamp, `user_id` integer REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE);
INSERT INTO "posts" VALUES(7,'This is the first post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."','2012-07-07 17:07:44.238180-0400','2012-07-07 17:17:22.326805-0400',1);
INSERT INTO "posts" VALUES(8,'This the second post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:09:20.049775-0400','2012-07-07 17:17:37.100769-0400',1);
INSERT INTO "posts" VALUES(9,'This is the third post ...','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:12:45.778865-0400','2012-07-07 17:17:52.943589-0400',1);
INSERT INTO "posts" VALUES(10,'This is the fourth post','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:13:13.005063-0400','2012-07-07 17:18:12.862166-0400',1);
INSERT INTO "posts" VALUES(11,'This is the fifth post','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
<br><br>
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. 
<br><br>
Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2012-07-07 17:13:47.115463-0400','2012-07-07 17:18:26.819391-0400',1);
DROP TABLE IF EXISTS "schema_info";
CREATE TABLE `schema_info` (`version` integer DEFAULT (0) NOT NULL);
INSERT INTO "schema_info" VALUES(1);
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" ("id" integer PRIMARY KEY ,"email" varchar DEFAULT (null) ,"crypted_password" varchar DEFAULT (null) ,"salt" text DEFAULT (null) ,"username" varchar);
INSERT INTO "users" VALUES(1,'admin','eccbbd2239261f0d16f5ea4810a32b35747c03e9','a1ff7a0ebbd04cd70b1f5f389094b68d46a55a90','Administrator');
INSERT INTO "users" VALUES(2,'test@gmail.com','8b5c97e38dbbe1416bed0bc90d2b67d6d17dad8b','0245d6ad472ccebcc08d5afbf8403112154659ac','Test User');
