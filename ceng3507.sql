-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 19, 2015 at 02:30 AM
-- Server version: 5.6.19-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ceng3507`
--

-- --------------------------------------------------------

--
-- Table structure for table `abilities`
--

CREATE TABLE IF NOT EXISTS `abilities` (
  `ability_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `manacost` varchar(32) DEFAULT NULL,
  `cooldown` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `abilities`
--

INSERT INTO `abilities` (`ability_id`, `name`, `description`, `image`, `manacost`, `cooldown`) VALUES
(1, 'Fissure', 'Slams the ground with a mighty totem, creating an impassible ridge of stone while stunning and damaging enemy units in a line.', '/static/images/skills/earthshaker_fissure.png', '125/140/155/170', '15'),
(2, 'Enchant Totem', 'Empowers Earthshaker''s totem, causing it to deal extra damage on the next attack.', '/static/images/skills/earthshaker_enchant_totem.png', '20/30/40/50', '5'),
(3, 'Aftershock', 'Causes the earth to shake underfoot, adding additional damage and stuns to nearby enemy units when Earthshaker casts his abilities.', '/static/images/skills/earthshaker_aftershock.png', '', ''),
(4, 'Echo Slam', 'Shockwaves travel through the ground, damaging enemy units. Each enemy hit causes an echo to damage nearby units. Upgradable by Aghanim''s Scepter.', '/static/images/skills/earthshaker_echo_slam.png', '145/205/265', '150/130/110');

-- --------------------------------------------------------

--
-- Table structure for table `announcaments`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` int(11) NOT NULL,
  `headline` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `announcaments`
--

INSERT INTO `announcements` (`announcement_id`, `headline`, `image`, `content`) VALUES
(1, 'Preparing for International', '/static/images/announcement01.jpg', 'We wanted to share some information about The International so that you’re able to start making room in your schedules. This year the Main Event in Seattle will include 16 teams and will run for 6 full days, from Monday August 3rd through Saturday August 8th. Ticket availability will be announced on this blog prior to going on sale. Team invitations will occur shortly after May 1st.'),
(2, 'The Shifting Snows Update', '/static/images/announcement02.jpg', 'Light dwindles and cold creeps in. The Shifting Snows Update has arrived, bringing with it this year’s Winter Map as well as a small gameplay update. As heroes shiver down the lanes to meet their fate, a new effigy material has emerged from the ice, new treasures have brought new armor to warm by the fire, and the arrival of Gift Wrap heralds the season of Givening. Check out the Shifting Snows Update page for more information.'),
(3, 'New Bloom 2015 Call to Arms', '/static/images/announcement03.jpg', 'Once again, we’re putting out a call to artists to create items based around the themes of Chinese New Year, Chinese history, and springtime, and submit them to the Dota 2 Workshop to be considered for the next New Bloom Festival. This time around we would like to ask artists to avoid the use of dragons and written Chinese characters, as well any concepts that involve human skulls, blood and gore. Additionally, to have the best chance of having your work make it into the game, please be careful not to mix cultural concepts in your designs, such as traditional divisions between the dress of children and adults, warriors and civilians and upper and lower classes. Also, our workshop particle process is due to be reworked, so please refrain from using custom particles in your submission.\r\n\r\nRemember to mark your submissions with the “Spring2015″ tag when placing your items on the Workshop. All submissions must be on the Dota 2 Workshop by January 19th. To everyone else: remember to visit the workshop and vote through your queue to make sure your voice is heard.\r\n\r\nAlso, the excellent people at WeLoveFine are hosting a contest for Dota 2 merchandise designs for the New Bloom Festival, so if your talents lean toward creating awesome swag, they’ll have you covered.');

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE IF NOT EXISTS `heroes` (
  `hero_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `roles` varchar(128) NOT NULL,
  `attack_type` varchar(128) NOT NULL,
  `primary_attribute` varchar(128) NOT NULL,
  `faction` varchar(32) NOT NULL,
  `str` varchar(32) NOT NULL,
  `agi` varchar(32) NOT NULL,
  `int` varchar(32) NOT NULL,
  `bio` text NOT NULL,
  `image_full` varchar(128) NOT NULL,
  PRIMARY KEY (`hero_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`hero_id`, `name`, `image`, `roles`, `attack_type`, `primary_attribute`, `faction`, `str`, `agi`, `int`, `bio`, `image_full`) VALUES
(1, 'Earth Shaker', '/static/images/heroes/earthshaker.jpg', 'Disabler, Initiator, Support, Lane Support', 'Melee', 'Strength', 'The Dire', '22+2.9/level', '12+1.4/level', '16+1.8/level', 'Like a golem or gargoyle, Earthshaker was one with the earth but now walks freely upon it. Unlike those other entities, he created himself through an act of will, and serves no other master. In restless slumbers, encased in a deep seam of stone, he became aware of the life drifting freely above him. He grew curious. During a season of tremors, the peaks of Nishai shook themselves loose of avalanches, shifting the course of rivers and turning shallow valleys into bottomless chasms. When the land finally ceased quaking, Earthshaker stepped from the settling dust, tossing aside massive boulders as if throwing off a light blanket. He had shaped himself in the image of a mortal beast, and named himself Raigor Stonehoof. He bleeds now, and breathes, and therefore he can die. But his spirit is still that of the earth; he carries its power in the magical totem that never leaves him. And on the day he returns to dust, the earth will greet him as a prodigal son.', '/static/images/heroes/earthshaker_full.png'),
(2, 'Dragon Knight', '/static/images/heroes/dragon_knight.jpg', 'Carry, Durable, Disabler, Pusher', 'Melee', 'Strength', 'The Dire', '19 + 2.80/level', '19 + 2.20/level', '15 + 1.70/level', 'After years on the trail of a legendary Eldwurm, the Knight Davion found himself facing a disappointing foe: the dreaded Slyrak had grown ancient and frail, its wings tattered, its few remaining scales stricken with scale-rot, its fangs ground to nubs, and its fire-gouts no more threatening than a pack of wet matchsticks. Seeing no honor to be gained in dragon-murder, Knight Davion prepared to turn away and leave his old foe to die in peace. But a voice crept into his thoughts, and Slyrak gave a whispered plea that Davion might honor him with death in combat. Davion agreed, and found himself rewarded beyond expectation for his act of mercy: As he sank his blade in Slyrak''s breast, the dragon pierced Davion''s throat with a talon. As their blood mingled, Slyrak sent his power out along the Blood Route, sending all its strength and centuries of wisdom to the knight. The dragon''s death sealed their bond and Dragon Knight was born. The ancient power slumbers in the Dragon Knight Davion, waking when he calls it. Or perhaps it is the Dragon that calls the Knight... ', '/static/images/heroes/dragon_knight_full.png'),
(3, 'Drow Ranger', '/static/images/heroes/drow_ranger.jpg', 'Carry', 'Ranged', 'Agility', 'The Radiant', '17 + 1.90/level', '26 + 1.90/level', '15 + 1.40/level', 'Drow Ranger''s given name is Traxex--a name well suited to the short, trollish, rather repulsive Drow people. But Traxex herself is not a Drow. Her parents were travelers in a caravan set upon by bandits, whose noisy slaughter of innocents roused the ire of the quiet Drow people. After the battle settled, the Drow discovered a small girl-child hiding in the ruined wagons, and agreed she could not be abandoned. Even as child, Traxex showed herself naturally adept at the arts they prized: Stealth, silence, subtlety. In spirit, if not in physique, she might have been a Drow changeling, returned to her proper home. But as she grew, she towered above her family and came to think of herself as ugly. After all, her features were smooth and symmetrical, entirely devoid of warts and coarse whiskers. Estranged from her adopted tribe, she withdrew to live alone in the woods. Lost travelers who find their way from the forest sometimes speak of an impossibly beautiful Ranger who peered at them from deep among the trees, then vanished like a dream before they could approach. Lithe and stealthy, icy hot, she moves like mist in silence. That whispering you hear is her frozen arrows finding an enemy''s heart. ', '/static/images/heroes/drow_ranger_full.png'),
(4, 'Queen of Pain', '/static/images/heroes/queenofpain.jpg', 'Nuker, Escape, Carry', 'Ranged', 'Intelligence', 'The Dire', '16 + 1.70/level', '18 + 2.00/level', '24 + 2.50/level', '\r\nThe Ecclesiast-King of Elze nursed a desire for pain--forbidden pain. In a less prominent political figure, such desires might be considered unwise, but in a monarch of his stature, to satisfy such thirsts would have threatened the virtue of the Divine Throne itself. Therefore he turned to his dungeon full of demonologists, promising freedom to whoever could summon a personal succubus of torment and bind it entirely to his service. The creature who arrived, Akasha by name, visited upon him such exquisite torments that he named her his Secret Queen, and he began to spend all his spare moments submitting to her clever torments--eventually abdicating all his responsibilities in his pursuit of the painful pleasures that only she could bring. Queen of Pain could bring him to the brink of death, but she was rune-bound to keep him alive. At last the King''s neglect of state brought on an uprising. He was dragged from his chamber and hurled from the Tower of Invocations, and at the moment of death, Queen of Pain was let loose into the world, freed from servitude--freed to visit her sufferings on anyone she deigned to notice. ', '/static/images/heroes/queenofpain_full.png');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `image`) VALUES
(1, 'Xboct', '/static/images/players/xboct.jpeg'),
(2, 'Dendi', '/static/images/players/dendi.jpeg'),
(3, 'Funn1k', '/static/images/players/funnik.jpeg'),
(4, 'Vanskor', '/static/images/players/vanskor.jpeg'),
(5, 'Goblak', '/static/images/players/goblak.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(128) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `image`, `content`) VALUES
(1, 'Natus Vincere', '/static/images/teams/navi.jpeg', 'Natus Vincere (Latin for "born to win"), often abbreviated as Na`Vi, is a Ukranian multigaming organization which was founded in 2009 as a Counter-Strike team after the collapse of the team KerchNET.\r\n\r\nIts DotA section was created in October 2010 with the pickup of Goblak, XBOCT, Mag~, Deff-, and Axypa. After Mag~ and Deff- left the team they instead acquired Danylo "Dendi" Ishutin and Ivan "Artstyle" Antonov. The team was later invited to the first version of The International 2011, eventually winning it after defeating the Chinese team EHOME 3-1 in the finals.');

-- --------------------------------------------------------

--
-- Table structure for table `teams_players`
--

CREATE TABLE IF NOT EXISTS `teams_players` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  KEY `tid` (`tid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams_players`
--

INSERT INTO `teams_players` (`tid`, `pid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
