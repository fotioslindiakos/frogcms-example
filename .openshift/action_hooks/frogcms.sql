-- MySQL dump 10.13  Distrib 5.1.52, for redhat-linux-gnu (x86_64)
--
-- Host: 127.1.22.129    Database: 
-- ------------------------------------------------------
-- Server version	5.1.52

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `frogcms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `frogcms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `frogcms`;

--
-- Table structure for table `layout`
--

DROP TABLE IF EXISTS `layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `content_type` varchar(80) DEFAULT NULL,
  `content` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout`
--

LOCK TABLES `layout` WRITE;
/*!40000 ALTER TABLE `layout` DISABLE KEYS */;
INSERT INTO `layout` VALUES (1,'none','text/html','<?php echo $this->content(); ?>','2011-08-30 00:55:55','2011-08-30 00:55:56',1,1,NULL),(2,'Normal','text/html','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\r\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n<head>\r\n  <title><?php echo $this->title(); ?></title>\r\n\r\n  <meta http-equiv=\"content-type\" content=\"application/xhtml+xml; charset=utf-8\" />\r\n  <meta name=\"robots\" content=\"index, follow\" />\r\n  <meta name=\"description\" content=\"<?php echo ($this->description() != \'\') ? $this->description() : \'Default description goes here\'; ?>\" />\r\n  <meta name=\"keywords\" content=\"<?php echo ($this->keywords() != \'\') ? $this->keywords() : \'default, keywords, here\'; ?>\" />\r\n  <meta name=\"author\" content=\"Author Name\" />\r\n\r\n  <link rel=\"favourites icon\" href=\"<?php echo URL_PUBLIC; ?>favicon.ico\" />\r\n    <link rel=\"stylesheet\" href=\"<?php echo URL_PUBLIC; ?>public/themes/normal/screen.css\" media=\"screen\" type=\"text/css\" />\r\n    <link rel=\"stylesheet\" href=\"<?php echo URL_PUBLIC; ?>public/themes/normal/print.css\" media=\"print\" type=\"text/css\" />\r\n    <link rel=\"alternate\" type=\"application/rss+xml\" title=\"Frog Default RSS Feed\" href=\"<?php echo URL_PUBLIC.((USE_MOD_REWRITE)?\'\':\'/?\'); ?>rss.xml\" />\r\n\r\n</head>\r\n<body>\r\n<div id=\"page\">\r\n<?php $this->includeSnippet(\'header\'); ?>\r\n<div id=\"content\">\r\n\r\n  <h2><?php echo $this->title(); ?></h2>\r\n  <?php echo $this->content(); ?> \r\n  <?php if ($this->hasContent(\'extended\')) echo $this->content(\'extended\'); ?> \r\n\r\n</div> <!-- end #content -->\r\n<div id=\"sidebar\">\r\n\r\n  <?php echo $this->content(\'sidebar\', true); ?> \r\n\r\n</div> <!-- end #sidebar -->\r\n<?php $this->includeSnippet(\'footer\'); ?>\r\n</div> <!-- end #page -->\r\n</body>\r\n</html>','2011-08-30 00:55:57','2011-08-30 00:55:58',1,1,NULL),(3,'RSS XML','application/rss+xml','<?php echo $this->content(); ?>','2011-08-30 00:55:59','2011-08-30 00:56:00',1,1,NULL);
/*!40000 ALTER TABLE `layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `breadcrumb` varchar(160) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text,
  `parent_id` int(11) unsigned DEFAULT NULL,
  `layout_id` int(11) unsigned DEFAULT NULL,
  `behavior_id` varchar(25) NOT NULL,
  `status_id` int(11) unsigned NOT NULL DEFAULT '100',
  `created_on` datetime DEFAULT NULL,
  `published_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `needs_login` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'Home Page','','Home Page',NULL,NULL,0,2,'',100,'2011-08-30 00:56:01','2011-08-30 00:56:02','2011-08-30 00:56:03',1,1,0,1,0),(2,'RSS Feed','rss.xml','RSS Feed',NULL,NULL,1,3,'',101,'2011-08-30 00:56:04','2011-08-30 00:56:05','2011-08-30 00:56:06',1,1,2,1,0),(3,'About us','about_us','About us',NULL,NULL,1,0,'',100,'2011-08-30 00:56:07','2011-08-30 00:56:08','2011-08-30 00:56:09',1,1,0,0,2),(4,'Articles','articles','Articles',NULL,NULL,1,0,'archive',100,'2011-08-30 00:56:10','2011-08-30 00:56:11','2011-08-30 00:56:12',1,1,1,1,2),(5,'My first article','my_first_article','My first article',NULL,NULL,4,0,'',100,'2011-08-30 00:56:13','2011-08-30 00:56:14','2011-08-30 00:56:15',1,1,0,0,2),(6,'My second article','my_second_article','My second article',NULL,NULL,4,0,'',100,'2011-08-30 00:56:16','2011-08-30 00:56:17','2011-08-30 00:56:18',1,1,0,0,2),(7,'%B %Y archive','monthly_archive','%B %Y archive',NULL,NULL,4,0,'archive_month_index',101,'2011-08-30 00:56:19','2011-08-30 00:56:20','2011-08-30 00:56:21',1,1,0,1,2);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_part`
--

DROP TABLE IF EXISTS `page_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_part` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `filter_id` varchar(25) DEFAULT NULL,
  `content` longtext,
  `content_html` longtext,
  `page_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_part`
--

LOCK TABLES `page_part` WRITE;
/*!40000 ALTER TABLE `page_part` DISABLE KEYS */;
INSERT INTO `page_part` VALUES (1,'body','','<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<?php $last_article = $page_article->children(array(\'limit\' => 1, \'order\' => \'page.created_on DESC\')); ?>\r\n\r\n<div class=\"first entry\">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(\'extended\')) echo $last_article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($page_article->children(array(\'limit\' => 4, \'offset\' => 1, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(\'extended\')) echo $article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n<?php endforeach; ?>\r\n','<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<?php $last_article = $page_article->children(array(\'limit\' => 1, \'order\' => \'page.created_on DESC\')); ?>\r\n\r\n<div class=\"first entry\">\r\n  <h3><?php echo $last_article->link(); ?></h3>\r\n  <?php echo $last_article->content(); ?>\r\n  <?php if ($last_article->hasContent(\'extended\')) echo $last_article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $last_article->author(); ?> on <?php echo $last_article->date(); ?></p>\r\n</div>\r\n\r\n<?php foreach ($page_article->children(array(\'limit\' => 4, \'offset\' => 1, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link(); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <?php if ($article->hasContent(\'extended\')) echo $article->link(\'Continue Reading&#8230;\'); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?></p>\r\n</div>\r\n<?php endforeach; ?>\r\n',1),(2,'body','','<?php echo \'<?\'; ?>xml version=\"1.0\" encoding=\"UTF-8\"<?php echo \'?>\'; ?> \r\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\r\n<channel>\r\n	<title>Frog CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href=\"<?php echo BASE_URL ?>/rss.xml\" rel=\"self\" type=\"application/rss+xml\" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(\'Y\'); ?>, madebyfrog.com</copyright>\r\n	<pubDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Frog CMS</generator>\r\n	<description>The main news feed from Frog CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(\'articles\'); ?>\r\n	<?php foreach ($articles->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(\'summary\')) { echo $article->content(\'summary\'); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>','<?php echo \'<?\'; ?>xml version=\"1.0\" encoding=\"UTF-8\"<?php echo \'?>\'; ?> \r\n<rss version=\"2.0\" xmlns:atom=\"http://www.w3.org/2005/Atom\">\r\n<channel>\r\n	<title>Frog CMS</title>\r\n	<link><?php echo BASE_URL ?></link>\r\n	<atom:link href=\"<?php echo BASE_URL ?>/rss.xml\" rel=\"self\" type=\"application/rss+xml\" />\r\n	<language>en-us</language>\r\n	<copyright>Copyright <?php echo date(\'Y\'); ?>, madebyfrog.com</copyright>\r\n	<pubDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n	<lastBuildDate><?php echo strftime(\'%a, %d %b %Y %H:%M:%S %z\'); ?></lastBuildDate>\r\n	<category>any</category>\r\n	<generator>Frog CMS</generator>\r\n	<description>The main news feed from Frog CMS.</description>\r\n	<docs>http://www.rssboard.org/rss-specification</docs>\r\n	<?php $articles = $this->find(\'articles\'); ?>\r\n	<?php foreach ($articles->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n	<item>\r\n		<title><?php echo $article->title(); ?></title>\r\n		<description><?php if ($article->hasContent(\'summary\')) { echo $article->content(\'summary\'); } else { echo strip_tags($article->content()); } ?></description>\r\n		<pubDate><?php echo $article->date(\'%a, %d %b %Y %H:%M:%S %z\'); ?></pubDate>\r\n		<link><?php echo $article->url(); ?></link>\r\n		<guid><?php echo $article->url(); ?></guid>\r\n	</item>\r\n	<?php endforeach; ?>\r\n</channel>\r\n</rss>',2),(3,'body','textile','This is my site. I live in this city ... I do some nice things, like this and that ...','<p>This is my site. I live in this city &#8230; I do some nice things, like this and that &#8230;</p>',3),(4,'body','','<?php $last_articles = $this->children(array(\'limit\'=>5, \'order\'=>\'page.created_on DESC\')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join(\', \', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n','<?php $last_articles = $this->children(array(\'limit\'=>5, \'order\'=>\'page.created_on DESC\')); ?>\r\n<?php foreach ($last_articles as $article): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $article->link($article->title); ?></h3>\r\n  <?php echo $article->content(); ?>\r\n  <p class=\"info\">Posted by <?php echo $article->author(); ?> on <?php echo $article->date(); ?>  \r\n     <br />tags: <?php echo join(\', \', $article->tags()); ?>\r\n  </p>\r\n</div>\r\n<?php endforeach; ?>\r\n\r\n',4),(5,'body','markdown','My **first** test of my first article that uses *Markdown*.','<p>My <strong>first</strong> test of my first article that uses <em>Markdown</em>.</p>\n',5),(7,'body','markdown','This is my second article.','<p>This is my second article.</p>\n',6),(8,'body','','<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class=\"info\">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>','<?php $archives = $this->archive->get(); ?>\r\n<?php foreach ($archives as $archive): ?>\r\n<div class=\"entry\">\r\n  <h3><?php echo $archive->link(); ?></h3>\r\n  <p class=\"info\">Posted by <?php echo $archive->author(); ?> on <?php echo $archive->date(); ?> \r\n  </p>\r\n</div>\r\n<?php endforeach; ?>',7),(9,'sidebar','','<h3>About Me</h3>\r\n\r\n<p>I\'m just a demonstration of how easy it is to use Frog CMS to power a blog. <a href=\"<?php echo BASE_URL; ?>about_us\">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href=\"http://www.madebyfrog.com\">Frog CMS</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(\'/\')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<a href=\"<?php echo BASE_URL; ?>articles\">Archives</a>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<a href=\"<?php echo BASE_URL; ?>rss.xml\">Articles RSS Feed</a>','<h3>About Me</h3>\r\n\r\n<p>I\'m just a demonstration of how easy it is to use Frog CMS to power a blog. <a href=\"<?php echo BASE_URL; ?>about_us\">more ...</a></p>\r\n\r\n<h3>Favorite Sites</h3>\r\n<ul>\r\n  <li><a href=\"http://www.madebyfrog.com\">Frog CMS</a></li>\r\n</ul>\r\n\r\n<?php if(url_match(\'/\')): ?>\r\n<h3>Recent Entries</h3>\r\n<?php $page_article = $this->find(\'/articles/\'); ?>\r\n<ul>\r\n<?php foreach ($page_article->children(array(\'limit\' => 10, \'order\' => \'page.created_on DESC\')) as $article): ?>\r\n  <li><?php echo $article->link(); ?></li> \r\n<?php endforeach; ?>\r\n</ul>\r\n<?php endif; ?>\r\n\r\n<a href=\"<?php echo BASE_URL; ?>articles\">Archives</a>\r\n\r\n<h3>Syndicate</h3>\r\n\r\n<a href=\"<?php echo BASE_URL; ?>rss.xml\">Articles RSS Feed</a>',1),(10,'sidebar','','<?php $article = $this->find(\'articles\'); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href=\"<?php echo BASE_URL . $this->url .\'/\'. $date . URL_SUFFIX; ?>\"><?php echo strftime(\'%B %Y\', strtotime(strtr($date, \'/\', \'-\'))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>','<?php $article = $this->find(\'articles\'); ?>\r\n<?php $archives = $article->archive->archivesByMonth(); ?>\r\n\r\n<h3>Archives By Month</h3>\r\n<ul>\r\n<?php foreach ($archives as $date): ?>\r\n  <li><a href=\"<?php echo BASE_URL . $this->url .\'/\'. $date . URL_SUFFIX; ?>\"><?php echo strftime(\'%B %Y\', strtotime(strtr($date, \'/\', \'-\'))); ?></a></li>\r\n<?php endforeach; ?>\r\n</ul>',4);
/*!40000 ALTER TABLE `page_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_tag`
--

DROP TABLE IF EXISTS `page_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_tag` (
  `page_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  UNIQUE KEY `page_id` (`page_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_tag`
--

LOCK TABLES `page_tag` WRITE;
/*!40000 ALTER TABLE `page_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,'administrator'),(2,'developer'),(3,'editor');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin_settings`
--

DROP TABLE IF EXISTS `plugin_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin_settings` (
  `plugin_id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` varchar(255) NOT NULL,
  UNIQUE KEY `plugin_setting_id` (`plugin_id`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin_settings`
--

LOCK TABLES `plugin_settings` WRITE;
/*!40000 ALTER TABLE `plugin_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `name` varchar(40) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `id` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('admin_title','Frog CMS'),('language','en'),('theme','default'),('default_status_id','1'),('default_filter_id',''),('default_tab',''),('allow_html_title','off'),('plugins','a:5:{s:7:\"textile\";i:1;s:8:\"markdown\";i:1;s:7:\"archive\";i:1;s:14:\"page_not_found\";i:1;s:12:\"file_manager\";i:1;}');
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippet`
--

DROP TABLE IF EXISTS `snippet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snippet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `filter_id` varchar(25) DEFAULT NULL,
  `content` text,
  `content_html` text,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  `position` mediumint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snippet`
--

LOCK TABLES `snippet` WRITE;
/*!40000 ALTER TABLE `snippet` DISABLE KEYS */;
INSERT INTO `snippet` VALUES (1,'header','','<div id=\"header\">\r\n  <h1><a href=\"<?php echo URL_PUBLIC; ?>\">Frog</a> <span>content management simplified</span></h1>\r\n  <div id=\"nav\">\r\n    <ul>\r\n      <li><a<?php echo url_match(\'/\') ? \' class=\"current\"\': \'\'; ?> href=\"<?php echo URL_PUBLIC; ?>\">Home</a></li>\r\n<?php foreach($this->find(\'/\')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(\'/\', $this->url)) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->','<div id=\"header\">\r\n  <h1><a href=\"<?php echo URL_PUBLIC; ?>\">Frog</a> <span>content management simplified</span></h1>\r\n  <div id=\"nav\">\r\n    <ul>\r\n      <li><a<?php echo url_match(\'/\') ? \' class=\"current\"\': \'\'; ?> href=\"<?php echo URL_PUBLIC; ?>\">Home</a></li>\r\n<?php foreach($this->find(\'/\')->children() as $menu): ?>\r\n      <li><?php echo $menu->link($menu->title, (in_array($menu->slug, explode(\'/\', $this->url)) ? \' class=\"current\"\': null)); ?></li>\r\n<?php endforeach; ?> \r\n    </ul>\r\n  </div> <!-- end #navigation -->\r\n</div> <!-- end #header -->','2011-08-30 00:56:22','2011-08-30 00:56:23',1,1,NULL),(2,'footer','','<div id=\"footer\"><div id=\"footer-inner\">\r\n  <p>&copy; Copyright <?php echo date(\'Y\'); ?> <a href=\"http://www.madebyfrog.com/\" title=\"Frog\">Madebyfrog.com</a><br />\r\n  Powered by <a href=\"http://www.madebyfrog.com/\" title=\"Frog CMS\">Frog CMS</a>.\r\n  </p>\r\n</div></div><!-- end #footer -->','<div id=\"footer\"><div id=\"footer-inner\">\r\n  <p>&copy; Copyright <?php echo date(\'Y\'); ?> <a href=\"http://www.madebyfrog.com/\" alt=\"Frog\">Madebyfrog.com</a><br />\r\n  Powered by <a href=\"http://www.madebyfrog.com/\" alt=\"Frog\">Frog CMS</a>.\r\n  </p>\r\n</div></div><!-- end #footer -->','2011-08-30 00:56:24','2011-08-30 00:56:25',1,1,NULL);
/*!40000 ALTER TABLE `snippet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `updated_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Administrator','admin@yoursite.com','admin','a771f30bf1581cadcd658138ef11ffdea99ea1ba','2011-08-30 00:56:26','2011-08-30 00:56:27',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permission`
--

DROP TABLE IF EXISTS `user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_permission` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permission`
--

LOCK TABLES `user_permission` WRITE;
/*!40000 ALTER TABLE `user_permission` DISABLE KEYS */;
INSERT INTO `user_permission` VALUES (1,1);
/*!40000 ALTER TABLE `user_permission` ENABLE KEYS */;
UNLOCK TABLES;

