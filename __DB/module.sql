-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 27 2017 г., 16:27
-- Версия сервера: 5.7.16
-- Версия PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `module`
--

-- --------------------------------------------------------

--
-- Структура таблицы `advertising`
--

CREATE TABLE `advertising` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` float NOT NULL DEFAULT '0',
  `site_url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `advertising`
--

INSERT INTO `advertising` (`id`, `title`, `price`, `site_url`, `status`) VALUES
(1, 'Samsung Galaxy S8', 589.99, 'http://www.ebay.com', 0),
(2, 'Apple Watch Gen 2 Series 2', 250, 'http://www.ebay.com', 0),
(3, 'Halo Sport - Unlock Your Potential', 549, 'www.amazon.com', 0),
(4, 'Muse Headband Hard Carrying Case', 39, 'www.amazon.com', 0),
(5, 'Earphone Case PU Small ', 6, 'www.amazon.com', 1),
(6, 'JBL Flip 4 Black (JBLFLIP4BLK) ', 100, 'https://hard.rozetka.com.ua', 1),
(7, 'Promate Sense with LED', 50, 'https://hard.rozetka.com.ua', 1),
(8, 'Greenwave 8000 mAh Silver', 15, 'https://rozetka.com.ua', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '2', 1506344045);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Admin', NULL, NULL, 1506332680, 1506332680),
('canAdmin', 2, 'Permission to login admin panel', NULL, NULL, 1506343203, 1506343203),
('user', 1, 'User', NULL, NULL, 1506332680, 1506332680);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('admin', 'canAdmin');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment`
--

INSERT INTO `comment` (`id`, `parent_id`, `description`) VALUES
(1, 0, '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes'),
(3, 0, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(4, 0, 'svifdvbsv hsb sfsdi asfklsd  fsd\r\n'),
(5, 0, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(6, 0, 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\n'),
(7, 0, '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"\r\n\r\n'),
(8, 0, '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum '),
(9, 0, '\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"'),
(10, 0, '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"'),
(11, 0, '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"'),
(12, 0, '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"'),
(13, 0, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC'),
(14, 0, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC'),
(15, 0, 'Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC\r\n'),
(16, 0, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC'),
(17, 0, '\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. '),
(18, 0, '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi'),
(19, 0, '\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will\r\n'),
(20, 0, 'Commenet by admin'),
(21, 0, 'comment by admin\r\n'),
(22, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat dolor eu ex porta, ut dignissim ante semper. Cras vestibulum efficitur magna, eget i\r\n'),
(23, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat dolor eu ex porta, ut dignissim ante semper. Cras vestibulum efficitur magna, eget i'),
(24, 0, 'Donec turpis lorem, elementum in sapien eu, luctus malesuada neque. In hac habitasse platea dictumst. Mauris a vestibulum odio. Phasellus blandit sagittis quam ac suscipit. Nulla at ex ultrices, rutrum lectus ut, convallis nunc. Quisque aliquam vehicula erat sit amet sagittis. Mauris eget nunc commodo, consectetur tortor at, tincidunt metus. Nam non neque rutrum turpis aliquet interdum a ut nulla. Cras laoreet ipsum eu tincidunt rhoncus. Sed mollis consectetur porta'),
(25, 0, 'Donec turpis lorem, elementum in sapien eu, luctus malesuada neque. In hac habitasse platea dictumst. Mauris a vestibulum odio. Phasellus blandit sagittis quam ac suscipit. Nulla at ex ultrices, rutrum lectus ut, convallis nunc. Quisque aliquam vehicula erat sit amet sagittis. Mauris eget nunc commodo, consectetur tortor at, tincidunt metus. Nam non neque rutrum turpis aliquet interdum a ut nulla. Cras laoreet ipsum eu tincidunt rhoncus. Sed mollis consectetur porta'),
(26, 0, 'Proin nulla arcu, auctor sit amet pretium ut, eleifend at ligula. Quisque massa massa, sollicitudin eget ipsum ut, posuere varius nulla. Suspendisse feugiat diam in leo malesuada viverra. Aenean sed iaculis libero. Pellentesque blandit metus tempus, semper neque ut, malesuada augue. Donec varius velit ut libero ornare cursus. '),
(27, 0, 'Proin nulla arcu, auctor sit amet pretium ut, eleifend at ligula. Quisque massa massa, sollicitudin eget ipsum ut, posuere varius nulla. Suspendisse feugiat diam in leo malesuada viverra. Aenean sed iaculis libero. Pellentesque blandit metus tempus, semper neque ut, malesuada augue. Donec varius velit ut libero ornare cursus. '),
(28, 0, 'Proin nulla arcu, auctor sit amet pretium ut, eleifend at ligula. Quisque massa massa, sollicitudin eget ipsum ut, posuere varius nulla. Suspendisse feugiat diam in leo malesuada viverra. Aenean sed iaculis libero. Pellentesque blandit metus tempus, semper neque ut, malesuada augue. Donec varius velit ut libero ornare cursus. ');

-- --------------------------------------------------------

--
-- Структура таблицы `comment_like`
--

CREATE TABLE `comment_like` (
  `id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comment_like`
--

INSERT INTO `comment_like` (`id`, `comment_id`, `user_id`) VALUES
(2, 8, 2),
(26, 12, 5),
(27, 4, 5),
(31, 18, 5),
(32, 1, 5),
(33, 6, 5),
(35, 7, 5),
(40, 19, 5),
(41, 3, 2),
(50, 21, 2),
(54, 4, 2),
(60, 15, 6),
(62, 11, 6),
(64, 23, 6),
(65, 24, 6),
(66, 13, 6),
(67, 28, 6),
(68, 3, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `filePath` varchar(400) NOT NULL,
  `itemId` int(11) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT NULL,
  `modelName` varchar(150) NOT NULL,
  `urlAlias` varchar(400) NOT NULL,
  `name` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `image`
--

INSERT INTO `image` (`id`, `filePath`, `itemId`, `isMain`, `modelName`, `urlAlias`, `name`) VALUES
(1, 'Posts/Post11/248ad4.jpg', 11, 1, 'Post', 'ea8dc5451d-1', ''),
(2, 'Posts/Post1/eb1744.jpeg', 1, 1, 'Post', 'dd30357d95-1', ''),
(3, 'Posts/Post2/32ea6f.png', 2, 1, 'Post', '5c43cd4c26-1', ''),
(4, 'Posts/Post3/d3d3ec.jpg', 3, 1, 'Post', 'd85626c5a4-1', ''),
(5, 'Posts/Post4/67edad.jpg', 4, 1, 'Post', '48bc795ac7-1', ''),
(6, 'Posts/Post5/79da2f.jpg', 5, 1, 'Post', 'adb4cd066c-1', ''),
(7, 'Posts/Post6/70b3b0.jpg', 6, 1, 'Post', 'c98e5c0cb0-1', ''),
(8, 'Posts/Post7/4f2d4a.jpg', 7, 1, 'Post', '08c56588cd-1', ''),
(9, 'Posts/Post8/1bef92.jpg', 8, 1, 'Post', '46e55e849f-1', ''),
(10, 'Posts/Post9/ce7de9.jpg', 9, 1, 'Post', 'fd5550064a-1', ''),
(11, 'Posts/Post10/169d42.jpg', 10, 1, 'Post', '2f97b49b75-1', ''),
(12, 'Posts/Post12/7eda5b.jpg', 12, 1, 'Post', 'e504349762-1', ''),
(13, 'Posts/Post13/9e33e9.jpg', 13, 1, 'Post', '095a121dab-1', ''),
(14, 'Posts/Post17/370696.jpg', 17, 1, 'Post', '1b10269a79-1', ''),
(15, 'Posts/Post20/6ae17d.jpg', 20, 1, 'Post', '4603ceb06a-1', ''),
(16, 'Posts/Post21/4221bd.jpg', 21, 1, 'Post', '6636555e86-1', ''),
(17, 'Posts/Post14/e08ae9.jpg', 14, 1, 'Post', 'c6c6fc1a29-1', ''),
(18, 'Posts/Post18/adacc3.jpg', 18, 1, 'Post', '3d36b6635d-1', ''),
(19, 'Posts/Post19/64b628.jpg', 19, 1, 'Post', '8e6634dcb6-1', ''),
(20, 'Posts/Post15/38b2df.jpg', 15, 1, 'Post', '3dd13538e9-1', ''),
(21, 'Posts/Post16/265d7b.jpg', 16, 1, 'Post', '8d8c0e7d09-1', ''),
(22, 'Posts/Post22/f73f08.jpg', 22, 1, 'Post', 'ed21f8fd51-1', ''),
(23, 'Posts/Post23/e5e5d6.jpg', 23, 1, 'Post', '12e0cbd797-1', ''),
(24, 'Posts/Post24/d66ff5.jpg', 24, 1, 'Post', '3ff272140a-1', ''),
(25, 'Posts/Post25/561d83.jpg', 25, 1, 'Post', 'c2400803ae-1', ''),
(26, 'Posts/Post26/fc7486.jpg', 26, 1, 'Post', '7d992fe2e3-1', ''),
(27, 'Posts/Post27/904ee5.jpg', 27, 1, 'Post', '2a961a682e-1', ''),
(28, 'Posts/Post28/faceb6.jpg', 28, 1, 'Post', '89ad127566-1', ''),
(29, 'Posts/Post29/f1956d.jpg', 29, 1, 'Post', '5f7f34cc02-1', ''),
(30, 'Posts/Post30/7c109d.jpg', 30, 1, 'Post', 'b49ef68ead-1', ''),
(31, 'Advertisings/Advertising1/d6a07e.jpg', 1, 1, 'Advertising', '6392d9df3f-1', ''),
(32, 'Advertisings/Advertising2/abdb01.jpg', 2, 1, 'Advertising', 'e9524d92f1-1', ''),
(33, 'Advertisings/Advertising3/ea59f1.jpg', 3, 1, 'Advertising', '7ad7b90957-1', ''),
(34, 'Advertisings/Advertising4/6f443c.jpg', 4, 1, 'Advertising', '1748011702-1', ''),
(35, 'Advertisings/Advertising5/f6c509.jpg', 5, 1, 'Advertising', 'db3b92730a-1', ''),
(36, 'Advertisings/Advertising6/e9058b.jpg', 6, 1, 'Advertising', '78e61f3a19-1', ''),
(37, 'Advertisings/Advertising7/fc96d8.jpg', 7, 1, 'Advertising', '3ac3b738f5-1', ''),
(38, 'Advertisings/Advertising8/60e23f.jpg', 8, 1, 'Advertising', '9a521f4244-1', '');

-- --------------------------------------------------------

--
-- Структура таблицы `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1505809913),
('m140506_102106_rbac_init', 1506174933),
('m140622_111540_create_image_table', 1505908898),
('m140622_111545_add_name_to_image_table', 1505908898),
('m170919_082537_create_post_category_table', 1505809914),
('m170919_082828_create_post_table', 1505809915),
('m170921_115453_create_tag_table', 1506002303),
('m170921_135200_create_post_tag_table', 1506002303),
('m170923_120450_create_user_table', 1506168353),
('m170925_140216_create_comment_table', 1506412483),
('m170925_140643_create_post_comment_table', 1506412483),
('m170926_114549_create_comment_like_table', 1506426850),
('m170926_135251_create_adversting_table', 1506435719);

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `view_total` int(255) NOT NULL DEFAULT '0',
  `view_current` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post`
--

INSERT INTO `post` (`id`, `category_id`, `title`, `description`, `created_at`, `updated_at`, `view_total`, `view_current`) VALUES
(1, 1, '1914 translation by H. Rackham', '\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"', '2017-09-20 13:02:43', '2017-09-27 12:10:13', 864, 1),
(2, 10, 'Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC', '\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"', '2017-09-20 13:03:55', '2017-09-27 16:15:05', 162, 2),
(3, 5, 'The standard Lorem Ipsum passage, used since the 1500s', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"', '2017-09-20 13:05:05', '2017-09-27 16:10:15', 133, 1),
(4, 13, 'Suspendisse sed justo imperdiet, ', 'Suspendisse sed justo imperdiet, elementum ante vitae, tristique felis. Praesent justo lacus, facilisis vitae eros eu, pharetra mollis leo. Maecenas eu eleifend nisl. Integer ultricies pharetra erat id posuere. Quisque feugiat ullamcorper elit, ac fringilla ipsum molestie a. In et mi sapien. Sed consectetur nulla est, et congue urna pulvinar vitae. Mauris a rhoncus nisl, id maximus est.\r\n\r\n', '2017-09-20 13:12:47', '2017-09-27 16:17:42', 11274, 4),
(5, 1, 'Cras ac erat pellentesque, lobortis diam quis, volutpat sapien.', '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', '2017-09-20 15:09:46', '2017-09-27 16:17:08', 564, 4),
(6, 1, 'Cras ac erat pellentesque, lobortis diam quis, volutpat sapien.', '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', '2017-09-20 15:10:15', '2017-09-27 13:00:36', 5786, 2),
(7, 1, 'Cras ac erat pellentesque, lobortis diam quis, volutpat sapien.', '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', '2017-09-20 15:12:02', '2017-09-26 15:41:16', 4187, 4),
(8, 1, 'Cras ac erat pellentesque, lobortis diam quis, volutpat sapien.', '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', '2017-09-20 15:12:34', '2017-09-27 16:07:53', 203, 4),
(9, 1, 'Cras ac erat pellentesque, lobortis diam quis, volutpat sapien.', '\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...\"\r\n\"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...\"', '2017-09-20 15:12:56', '2017-09-20 15:22:11', 0, 0),
(10, 1, 'Pellentesque nec ipsum at enim hendrerit faucibus ac sit amet eros.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-09-20 15:13:46', '2017-09-22 13:12:55', 0, 0),
(11, 1, 'Pellentesque nec ipsum at enim hendrerit faucibus ac sit amet eros.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2017-09-20 15:13:57', '2017-09-22 13:13:56', 0, 0),
(12, 1, 'Sed id tellus nec magna maximus aliquam.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pellentesque non urna eu egestas. Fusce maximus est ut odio luctus egestas. Integer dictum commodo nisl et vehicula. Nulla bibendum auctor porta. Nulla fringilla ligula ac lectus efficitur tincidunt. Nulla aliquam sapien quis mi volutpat suscipit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi gravida, ipsum ullamcorper maximus gravida, felis justo volutpat ante, non feugiat diam nibh eget metus. Nunc finibus eros sed nibh semper, ut ultricies lacus ultrices. Duis dapibus finibus velit non vestibulum. Donec pharetra erat nec tellus porta, vel commodo dolor finibus. Morbi quis est ligula. Aliquam velit leo, malesuada ut sapien id, semper scelerisque ex. In nibh orci, iaculis non tristique eget, auctor at nunc.\r\n', '2017-09-20 15:23:58', '2017-09-26 13:46:40', 332, 3),
(13, 9, 'Curabitur vulputate lorem id accumsan imperdiet.', 'Etiam id auctor risus, vitae sollicitudin arcu. Etiam posuere felis vitae congue dignissim. Phasellus ut est sed lorem congue efficitur. Vivamus risus nulla, rutrum eget auctor in, viverra vitae eros. Quisque id arcu sit amet mauris aliquet placerat at non eros. Etiam egestas, magna ac ultrices aliquet, felis massa bibendum neque, ut malesuada sem nibh nec mi. Nullam tincidunt sit amet libero eu congue. Sed condimentum enim sem, et interdum nisi tincidunt tempus.', '2017-09-20 15:32:14', '2017-09-27 16:14:50', 1514, 0),
(14, 1, 'Donec commodo lorem et dolor vehicula tincidunt.', 'Maecenas eu eleifend nunc. Proin posuere pharetra est. Praesent ut sem euismod, mattis felis eu, euismod lorem. Suspendisse in orci quis lorem sagittis gravida. Maecenas id facilisis sem. Phasellus tempor lectus diam, non posuere risus aliquam ut. Curabitur elit mi, semper non ligula id, fringilla tempus ante. Nullam facilisis lectus ut gravida elementum. Nam faucibus sodales est sit amet fringilla. Donec erat lacus, viverra ut risus vitae, dignissim tempus augue. Quisque ac ex sed est placerat sollicitudin. Nam vel nulla auctor, egestas urna in, accumsan tortor.', '2017-09-20 15:45:07', '2017-09-22 13:14:30', 0, 0),
(15, 1, 'Suspendisse ut lacus sed lorem mattis imperdiet.', 'Morbi rhoncus, mi vitae finibus scelerisque, mi arcu fermentum ex, sed accumsan dolor ante vitae ipsum. Pellentesque arcu dolor, imperdiet in elementum a, faucibus ut sem. Sed odio enim, malesuada a metus non, porttitor ultricies lectus. Quisque scelerisque vehicula lacus at semper. In hac habitasse platea dictumst. Nullam in faucibus ipsum. Aliquam eget vestibulum nibh, non ultrices ante. Phasellus nunc neque, convallis at leo vel, venenatis elementum tortor. Mauris ultrices nisl a pharetra sollicitudin. Integer fermentum massa id mi molestie, a efficitur lacus placerat. Curabitur mauris mauris, feugiat non vulputate sed, dictum sit amet nunc. Vivamus massa libero, posuere quis cursus eget, pharetra a libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2017-09-20 15:45:22', '2017-09-21 13:19:17', 71, 4),
(16, 6, 'Morbi aliquam nibh quis nisl cursus, in interdum massa maximus.', 'Nulla consectetur fermentum metus, id consectetur nunc maximus at. In eget efficitur eros, ac pharetra massa. Phasellus venenatis metus elementum, ullamcorper lectus eget, consectetur erat. Vestibulum cursus magna et arcu dapibus, et laoreet tortor finibus. Proin hendrerit pellentesque sem vel pretium. Suspendisse quis tortor sit amet nisl bibendum varius. In pellentesque erat nulla, vitae porta libero posuere at. Maecenas orci diam, eleifend nec vestibulum lobortis, posuere sed tellus. Maecenas tincidunt tempor iaculis. Nullam nec tincidunt metus. Morbi facilisis felis non massa laoreet, eu facilisis tortor sollicitudin. Ut eget pretium lacus, eu laoreet odio. Suspendisse at massa vel sem ultricies feugiat vitae eget eros. Nulla felis nibh, maximus ut fermentum ut, bibendum a sapien.', '2017-09-20 15:45:47', '2017-09-22 13:14:40', 0, 0),
(17, 2, 'Quisque non ligula a metus ultricies luctus a nec enim.', 'Phasellus luctus dolor ex, ut consequat mauris volutpat sit amet. Mauris eget facilisis dolor. Nunc dapibus lorem vel augue vestibulum, in pharetra orci tincidunt. Aliquam ut bibendum orci. Morbi in dui volutpat, pulvinar magna sit amet, blandit magna. Proin felis sapien, pellentesque a cursus vel, hendrerit non massa. Phasellus suscipit sem mauris, sed pretium felis rhoncus ac. Maecenas maximus lectus sit amet suscipit semper. In hac habitasse platea dictumst. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum sapien felis, tempus ac interdum vitae, maximus a nisi. Praesent faucibus augue eget semper sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed dolor metus, pellentesque vel metus eget, scelerisque finibus ligula. Aliquam porta malesuada odio ac vulputate.', '2017-09-20 15:46:07', '2017-09-26 18:22:37', 448, 0),
(18, 14, 'Integer bibendum urna ut nisi posuere porta.', 'In hac habitasse platea dictumst. Sed mollis odio at odio pulvinar semper. Sed cursus eu eros sed sollicitudin. Nulla volutpat ex tellus, sed aliquam dolor feugiat vitae. Phasellus mauris massa, iaculis et metus ut, placerat fringilla elit. Sed ligula libero, dictum sit amet porta in, faucibus ac orci. Donec eleifend nulla elit, accumsan ultricies elit porta nec. Mauris at tortor sed purus porta interdum sit amet eu elit. Cras vitae felis in ex sollicitudin molestie. Ut vel felis porta, porta ligula et, maximus dui. Morbi orci lorem, faucibus interdum orci non, bibendum gravida justo. Nulla tristique dignissim lorem, nec molestie tellus tempus sit amet.', '2017-09-20 15:46:30', '2017-09-27 16:16:12', 76, 2),
(19, 4, 'Curabitur in libero ac dolor condimentum blandit eu id nisl.', 'Aliquam vestibulum lectus a augue imperdiet dictum. Vestibulum vehicula pulvinar pulvinar. Nullam vulputate orci ac orci venenatis, in lacinia ante vehicula. Etiam luctus mi finibus arcu gravida, sed tincidunt mauris aliquam. Quisque non tincidunt dui. Curabitur interdum risus in felis tincidunt, ac finibus dui sodales. Maecenas est ante, laoreet in purus et, lobortis ullamcorper nulla. Ut gravida urna a magna rhoncus finibus. Nulla varius non turpis in auctor. Curabitur ac accumsan metus. Ut ipsum magna, rhoncus ac nulla non, convallis elementum mi.', '2017-09-20 15:46:49', '2017-09-26 15:41:48', 1964, 0),
(20, 1, 'In malesuada ligula nec aliquet vestibulum.', 'Sed accumsan rhoncus risus, dictum volutpat sapien laoreet ut. Maecenas faucibus dignissim nisi, tempus tincidunt urna dapibus eget. Duis ac libero nec orci lobortis iaculis. Duis et lacus neque. In auctor nunc non pulvinar bibendum. In nunc turpis, sodales vestibulum fermentum at, venenatis quis neque. Proin finibus est efficitur libero consectetur sollicitudin semper sed mauris. Pellentesque pretium ante ac mi scelerisque, sit amet semper erat commodo. Donec accumsan velit a enim tincidunt efficitur. Suspendisse nec turpis vel sapien viverra blandit ut nec massa. Quisque sapien purus, hendrerit ut elementum vel, congue sit amet ligula. Donec aliquet turpis sit amet diam placerat varius. Curabitur et metus ligula. Curabitur sed eleifend dolor, non elementum neque. Fusce tortor lacus, tincidunt et placerat et, gravida nec mi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;', '2017-09-20 15:47:06', '2017-09-26 15:55:52', 626, 0),
(21, 5, 'Proin sed erat dictum augue blandit hendrerit.', 'Proin sollicitudin lacus nec fermentum ultricies. Nullam quis tempus urna, sit amet tempor nunc. Vivamus lectus nulla, volutpat nec augue ac, pharetra tincidunt sem. Nullam pulvinar odio vitae nibh aliquam convallis. Vestibulum efficitur ipsum et ultrices convallis. Morbi congue mi in rutrum interdum. Mauris sit amet convallis sapien.', '2017-09-20 15:47:24', '2017-09-26 16:18:02', 1925, 4),
(22, 13, 'Etiam tristique eros at vestibulum tristique.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus et lectus lorem. Praesent quam metus, vestibulum ut ultrices et, tristique vel urna. Phasellus tempus vel ligula non dignissim. Nulla a enim et libero volutpat tristique at ut odio. Praesent eu odio ut arcu elementum tempor. Duis id dignissim elit, sit amet porttitor metus. Nullam sit amet consequat urna, vitae sagittis ligula. Aliquam suscipit nunc non justo semper iaculis. Donec pretium dolor sed est ultricies commodo. Donec enim neque, volutpat ac ullamcorper sit amet, facilisis nec neque. Aliquam nunc nisi, iaculis in aliquam at, bibendum id nulla.', '2017-09-20 15:50:23', '2017-09-26 14:13:00', 114, 2),
(23, 1, 'Quisque consequat est aliquet, pulvinar libero eget, laoreet felis.', 'Cras tristique ipsum vel quam ultricies tincidunt. Ut malesuada efficitur rutrum. In scelerisque fringilla iaculis. Donec mollis et urna consectetur mattis. Quisque sed libero feugiat sem imperdiet ullamcorper. Etiam quis quam sapien. Quisque sed sem malesuada, varius nisi vel, elementum risus. Donec quis risus vulputate, interdum odio in, vestibulum massa. Maecenas ultrices nulla dui, vel malesuada neque facilisis in. Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2017-09-20 15:50:44', '2017-09-21 14:14:48', 2487, 3),
(24, 1, 'Aenean efficitur arcu ac vehicula placerat', 'Nullam quis tempor elit, et varius sapien. Suspendisse malesuada luctus lectus, ut dignissim neque iaculis a. Nam in lectus non erat interdum hendrerit vitae vel nisl. Sed nisi quam, posuere id eleifend sit amet, porta quis ante. Donec non erat turpis. Nunc tempus massa nec odio tempus elementum. Integer nec mi id sem ultrices vehicula non sed ex. Etiam vel congue velit. Etiam tempus dictum diam, ut dictum felis. Fusce pharetra erat in lorem fermentum molestie. Morbi maximus turpis est, eu tempor tortor vulputate sit amet. Sed ut enim sed ex dapibus tempus. Nullam pharetra nisl eu euismod vehicula. Nunc eu turpis felis', '2017-09-20 15:51:08', '2017-09-27 12:11:43', 1169, 1),
(25, 4, 'Praesent in metus facilisis, ornare dui eget, congue tortor.', 'Cras quis consequat tortor, eget rhoncus lacus. Cras nec iaculis metus. Vivamus faucibus porta arcu. Aliquam ullamcorper ante urna, in suscipit turpis facilisis non. Phasellus dignissim ornare eros eu consectetur. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Duis sodales velit nulla, non pulvinar mauris lobortis et. Curabitur vestibulum fermentum mauris eget vestibulum. Maecenas commodo, nibh ac vehicula bibendum, massa lectus faucibus orci, sit amet tempor risus quam a lorem. Sed nec posuere arcu. Praesent tincidunt lacinia est, et suscipit mi pellentesque pretium. Donec sit amet urna lectus. Curabitur eu quam ac augue mollis porta. Nunc tincidunt viverra libero vitae feugiat. Maecenas quam felis, tristique quis aliquet in, tempor eu diam.', '2017-09-20 15:51:31', '2017-09-27 15:46:52', 40, 3),
(26, 7, 'Etiam semper nisl quis blandit vestibulum.', 'Donec sit amet blandit dolor, eget condimentum elit. Sed pellentesque, lectus quis auctor dignissim, nisl felis scelerisque leo, ultricies facilisis lacus elit vitae orci. Maecenas a odio at magna ultricies venenatis quis id lacus. Aliquam erat volutpat. Praesent laoreet, lacus nec feugiat fringilla, arcu magna sollicitudin felis, vitae dignissim arcu lectus ac neque. Quisque eget fermentum nunc, vel dictum arcu. Fusce nec lobortis nunc. Suspendisse sodales mauris a enim feugiat, vitae dapibus quam condimentum. Proin et nisi neque. Nam eget ipsum ligula. In eu posuere erat.', '2017-09-20 15:51:49', '2017-09-22 13:16:11', 0, 0),
(27, 6, 'Nullam lacinia erat sodales nisi iaculis, quis lacinia nisl egestas.', 'Integer lacinia nisi mattis enim tincidunt lobortis. Vivamus vitae libero sit amet mi placerat feugiat in in mi. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In a erat eget odio condimentum varius. Curabitur in eros in est auctor laoreet eget quis eros. Suspendisse potenti. Integer eu nulla facilisis, aliquam lectus a, vehicula ipsum. Vestibulum a augue et ante mollis interdum eu a ligula. Nullam eu tortor convallis, volutpat magna vel, rhoncus tortor. Duis quis condimentum arcu, ut dignissim velit.', '2017-09-20 15:52:14', '2017-09-26 14:15:48', 12, 0),
(28, 1, 'Integer convallis neque vel facilisis auctor.', 'Aliquam erat volutpat. Aenean id risus pharetra, dapibus sapien sit amet, sollicitudin libero. Curabitur ut mi dignissim, congue nisi ut, bibendum risus. Ut quis pellentesque nisi. Donec a metus consequat, aliquet metus ac, tempus sem. Fusce felis quam, porta eu neque a, interdum elementum mauris. Maecenas gravida velit eu tellus euismod, fermentum malesuada velit interdum. Maecenas lobortis felis ac maximus consectetur.', '2017-09-20 15:52:32', '2017-09-22 13:16:24', 47, 1),
(29, 10, 'Donec ultrices lorem id turpis faucibus molestie.', 'Vivamus porta quis ante placerat imperdiet. Quisque quis arcu diam. Suspendisse quis magna suscipit orci pellentesque condimentum. Etiam ullamcorper pulvinar porta. Quisque elementum interdum venenatis. Nam eget finibus ante. Ut et tincidunt purus. Quisque vel rhoncus enim, sit amet posuere eros. Vivamus viverra placerat quam eget accumsan. Sed sit amet sem est. Maecenas egestas pharetra mauris, sit amet cursus nisi. Phasellus in enim vel enim porta eleifend. Morbi enim purus, lacinia et viverra non, facilisis bibendum ex.', '2017-09-20 15:52:53', '2017-09-27 16:15:28', 14, 4),
(30, 1, 'Test photo', 'Sunset pictures · Pexels · Free Stock Photos\r\nPexels3000 × 1999Пошук за зображенням\r\nSeaport during Daytime', '2017-09-22 11:25:22', '2017-09-22 13:17:41', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post_category`
--

INSERT INTO `post_category` (`id`, `parent_id`, `title`) VALUES
(1, 0, 'What is Lorem Ipsum?'),
(2, 0, ' Where does it come from?'),
(4, 2, 'Where can I get some?'),
(5, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6, 1, 'Duis mattis lectus ut urna finibus, eget finibus ligula vulputate.'),
(7, 2, 'Integer tincidunt arcu ac fermentum aliquam.'),
(9, 7, 'Etiam et felis vitae lacus varius faucibus eu quis turpis.'),
(10, 7, 'Duis maximus ex ut velit cursus dignissim.'),
(11, 10, 'Mauris eget eros sit amet urna congue molestie ut quis felis.'),
(12, 10, 'Donec vel tortor non nibh egestas dictum vel a enim.'),
(13, 1, 'Nulla sollicitudin turpis ac dui sodales, eget porttitor mi dictum.'),
(14, 0, 'Mauris vitae purus in enim porttitor pellentesque eu at augue.');

-- --------------------------------------------------------

--
-- Структура таблицы `post_comment`
--

CREATE TABLE `post_comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post_comment`
--

INSERT INTO `post_comment` (`id`, `post_id`, `comment_id`, `user_id`) VALUES
(1, 6, 1, 3),
(3, 4, 3, 3),
(4, 6, 4, 3),
(5, 17, 5, 4),
(6, 20, 6, 4),
(7, 20, 7, 4),
(8, 7, 8, 4),
(9, 7, 9, 5),
(10, 7, 10, 3),
(11, 3, 11, 3),
(12, 6, 12, 4),
(13, 18, 13, 4),
(14, 22, 14, 4),
(15, 8, 15, 4),
(16, 27, 16, 4),
(17, 5, 17, 4),
(18, 6, 18, 5),
(19, 21, 19, 5),
(20, 24, 20, 2),
(21, 6, 21, 2),
(22, 8, 22, 6),
(23, 3, 23, 6),
(24, 2, 24, 6),
(25, 13, 25, 6),
(26, 29, 26, 6),
(27, 18, 27, 6),
(28, 4, 28, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `post_tag`
--

CREATE TABLE `post_tag` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `post_tag`
--

INSERT INTO `post_tag` (`id`, `post_id`, `tag_id`) VALUES
(37, 10, 1),
(38, 10, 4),
(39, 10, 5),
(40, 10, 7),
(50, 11, 9),
(51, 11, 10),
(52, 11, 11),
(58, 14, 9),
(59, 14, 10),
(60, 14, 11),
(61, 16, 8),
(62, 16, 10),
(63, 16, 11),
(87, 26, 1),
(88, 26, 2),
(89, 26, 3),
(90, 28, 1),
(91, 28, 2),
(92, 28, 3),
(96, 30, 1),
(97, 30, 2),
(98, 30, 3),
(18649, 12, 1),
(18650, 12, 2),
(18651, 12, 3),
(19921, 22, 4),
(19922, 22, 5),
(19923, 22, 7),
(24231, 7, 4),
(24232, 7, 5),
(24233, 7, 7),
(24234, 19, 4),
(24235, 19, 5),
(24236, 19, 7),
(25211, 20, 2),
(25212, 20, 3),
(25213, 20, 4),
(25214, 20, 5),
(25652, 21, 4),
(25917, 17, 3),
(25918, 17, 4),
(25919, 17, 5),
(26028, 1, 2),
(26029, 1, 3),
(26030, 1, 8),
(26112, 24, 1),
(26113, 24, 2),
(26114, 24, 3),
(29244, 6, 1),
(29245, 6, 2),
(29246, 6, 3),
(29247, 6, 4),
(29248, 6, 5),
(38062, 25, 1),
(38063, 25, 2),
(38064, 25, 3),
(38392, 8, 3),
(38393, 8, 4),
(38394, 8, 5),
(38589, 13, 3),
(38590, 13, 5),
(38591, 2, 1),
(38592, 2, 3),
(38593, 2, 7),
(38609, 29, 3),
(38610, 29, 5),
(38611, 29, 7),
(38618, 5, 1),
(38625, 4, 2),
(38626, 4, 3),
(38627, 4, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `tag`
--

INSERT INTO `tag` (`id`, `title`) VALUES
(1, 'test'),
(2, 'testo'),
(3, 'lorem'),
(4, 'tag'),
(5, 'const'),
(7, 'developer'),
(8, 'custom'),
(9, 'new'),
(10, 'modern'),
(11, 'pro');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'oy_bP93BoIa2rj-si1M3Ft0rgnMg66rn', '$2y$13$iqzdQsPU5qvSOkgxL70FKeC50WZKTaBbYbvVEo97jEXlHTvzVNPhG', NULL, 'admin@gmail.com', 10, 1506173128, 1506173128),
(3, 'user 1', '7OwZnMzC0F5HIywEI9uQWMVVbSQI-ZJA', '$2y$13$PcmvyokGq9LjeEI5Oi/mIutxVik1QlAjIF.ymhzYqHbteZAGA0r.C', NULL, 'user1@mail.com', 10, 1506173907, 1506173907),
(4, 'user 2', '1mxk5rLapSoq35ykpIgLnTJqgrML8NDZ', '$2y$13$fWZYrA7XRv2MP/OKO37Z5OOdvVU8.NaHIgiXLGSn6TsdjDjuSi4We', NULL, 'user2@gmail.com', 10, 1506173957, 1506173957),
(5, 'user 3', 'v03ddkDA6181Tcs-IGqbJLMt_DZb8xjJ', '$2y$13$ZN2ikZEqUSaPLs652NFc3.EAKpn2yVUpTdXUeM.z90mAeEfBObZbu', NULL, 'user3@gmail.com', 10, 1506173981, 1506173981),
(6, 'user_4', 'jFGlKpYtNWqp0b3-jVg8W6OYOLkjUpvr', '$2y$13$UzdjoNt7tLyYTj2.PpRkiOxOdc2k.bkwC4uYpOzlpkwdwUt2C1Jwu', NULL, 'user_4@gmail.com', 10, 1506517607, 1506517607);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Индексы таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Индексы таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Индексы таблицы `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comment_like`
--
ALTER TABLE `comment_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-comment_like-comment_id` (`comment_id`),
  ADD KEY `idx-comment_like-user_id` (`user_id`);

--
-- Индексы таблицы `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-post-category_id` (`category_id`);

--
-- Индексы таблицы `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post_comment`
--
ALTER TABLE `post_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-post_comment-post_id` (`post_id`),
  ADD KEY `idx-post_comment-comment_id` (`comment_id`),
  ADD KEY `idx-post_comment-user_id` (`user_id`);

--
-- Индексы таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx-post_tag-post_id` (`post_id`),
  ADD KEY `idx-post_tag-tag_id` (`tag_id`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `comment_like`
--
ALTER TABLE `comment_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT для таблицы `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT для таблицы `post_comment`
--
ALTER TABLE `post_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT для таблицы `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38628;
--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `comment_like`
--
ALTER TABLE `comment_like`
  ADD CONSTRAINT `fk-comment_like-comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-comment_like-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk-post-category_id` FOREIGN KEY (`category_id`) REFERENCES `post_category` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post_comment`
--
ALTER TABLE `post_comment`
  ADD CONSTRAINT `fk-post_comment-comment_id` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-post_comment-post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-post_comment-user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `fk-post_tag-post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-post_tag-tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
