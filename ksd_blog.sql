/*
 Navicat Premium Data Transfer

 Source Server         : first
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : ksd_blog

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 20/07/2025 10:43:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `ad_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ad_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型id',
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告的标题',
  `ad_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告链接地址',
  `ad_sort` int NULL DEFAULT NULL COMMENT '广告排序越小越前',
  `ad_begin_time` datetime NULL DEFAULT NULL COMMENT '广告开始时间',
  `ad_end_time` datetime NULL DEFAULT NULL COMMENT '广告结束时间',
  `ad_add_time` datetime NULL DEFAULT NULL COMMENT '广告添加时间',
  `status` int NULL DEFAULT NULL,
  PRIMARY KEY (`ad_id`) USING BTREE,
  INDEX `FKery517tbsjy8dr1tbry9h5cqm`(`ad_type_id` ASC) USING BTREE,
  CONSTRAINT `FKery517tbsjy8dr1tbry9h5cqm` FOREIGN KEY (`ad_type_id`) REFERENCES `ad_type` (`ad_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('ad1', 'adt1', '联系方式', '/cover/cover2.jpg', 1, '2025-07-15 12:06:34', '2025-08-01 23:59:59', '2025-07-15 12:06:34', 1);
INSERT INTO `ad` VALUES ('ad2', 'adt2', '618大促', '/cover/cover3.jpg', 0, '2025-05-16 21:03:35', '2025-06-18 21:03:38', '2025-05-15 21:03:44', 1);

-- ----------------------------
-- Table structure for ad_type
-- ----------------------------
DROP TABLE IF EXISTS `ad_type`;
CREATE TABLE `ad_type`  (
  `ad_type_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告类型id',
  `ad_type_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型标题',
  `ad_type_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型标签',
  `ad_type_sort` int NULL DEFAULT NULL COMMENT '广告类型排序越小越靠前',
  `ad_type_add_time` datetime NULL DEFAULT NULL COMMENT '广告类型添加时间',
  PRIMARY KEY (`ad_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '广告类型' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad_type
-- ----------------------------
INSERT INTO `ad_type` VALUES ('adt1', '首页轮播', 'index_banner', 1, '2025-07-15 12:04:34');
INSERT INTO `ad_type` VALUES ('adt2', '滚动公告', 'rolling_announcement', 0, '2025-07-16 21:05:00');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章作者id',
  `article_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_add_time` datetime NULL DEFAULT NULL COMMENT '文章添加时间',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `article_like_count` int NULL DEFAULT NULL COMMENT '点赞次数',
  `article_view_count` int NULL DEFAULT NULL COMMENT '观看次数',
  `article_collection_count` int NULL DEFAULT NULL COMMENT '收藏次数',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '封面',
  `article_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：草稿或文章',
  PRIMARY KEY (`article_id`) USING BTREE,
  INDEX `FKt1jt7qefg596leiwp395fvg4q`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKt1jt7qefg596leiwp395fvg4q` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', 'windows通过cmd查看端口占用，并停止该端口，杀死进程kill等命令', '2025-07-13 16:01:14', '通过cmd查看端口占用，并停止该端口，杀死进程kill等命令\r\n首先需要打开cmd命令窗口\r\n\r\n方式一： 使用 win + R 快捷键方式打开运行窗口，输入“cmd”，然后点击确定按钮打开命令提示符;如图所示：\r\nwin + R 快捷键\r\n\r\n方式二： 按 win 键会弹出一个窗口，这时直接输入 “cmd”，可直接打开cmd窗口，也可以使用管理员身份打开cmd\r\n\r\nwin 快捷键\r\n进入命令提示符窗口后，输入“netstat -ano”并按下回车执行，之后就会显示电脑上运行的所有端口号，如图所示：\r\n\r\nnetstat -ano\r\nAI写代码\r\njava\r\n运行\r\n1\r\nnetstat -ano 显示所有运行的端口号\r\n【Tip：如果已知被占用的端口时，可以用命令 netstat -aon|findstr 7009 直接找到端口号为7009的进程PID 】\r\n\r\n我在idea启动的时候显示 “port 7009” 被占用，所以根据上述的命令可以找到端口号为7009的PID(进程号)，如上图所示，70009的PID是：4628，现在需要把它终止。\r\n\r\n端口号为7009的被占用\r\n接下来，输入“tasklist | findstr “4628””并按下回车，查询PID为4628的进程名称，如图所示：\r\n\r\n//tasklist | findstr \"PID\"\r\ntasklist | findstr \"4628\"\r\nAI写代码\r\njava\r\n运行\r\n1\r\n2\r\ntasklist | findstr “PID”=根据PID查询该进程的名称\r\n》\r\n\r\n结束指定进程，输入以下其中一种命令，按回车执行即可。\r\n\r\n命令一：根据PID进程号结束进程\r\n\r\ntaskkill /pid 4628 -t -f\r\nAI写代码\r\njava\r\n运行\r\n1\r\n命令二：根据进程名称结束进程\r\n\r\ntaskkill /f /t /im Postman.exe\r\nAI写代码\r\njava\r\n运行\r\n1\r\n两种命令结束进程\r\n有没有帮助到你们解决问题呢? 遇到困难不放弃，一定有前辈遇到和你一样的问题，但是他们解决了，慢慢日积月累，他们成为了前辈，成为了大佬，所以我们也得努力，加油加油吖~\r\n\r\n一起努力成为一名优秀的程序媛吧~ 🤭', 51, 62000, 95, 'https://picsum.photos/1200/300', '1');
INSERT INTO `article` VALUES ('2', '2', '使用阿里云服务器部署(完整步骤）', '2025-07-13 16:03:35', '部署项目前需要环境：阿里云云服务器ECS，宝塔面板\r\n\r\n阿里云云服务器ECS实例创建过程\r\n先登录阿里云网站注册账号,进入控制台左侧导航栏中云服务器ECS页面\r\n根据自己的需求去创建一个新的实例（需要付费）\r\n如果是学生的话，完成认证之后可以免费试用一个月，过期之前完成实验和测试任务拿到证书还可以再免费使用6月。\r\n添加实例安全组\r\n服务器是需要端口放行的，否则你的端口将无法访问，因为安全需要，所以云服务器存在安全组这个东西。常用需要放行的端口：tomcat 8080端口，mysql 3306端口 https 443和80端口\r\n在这里插入图片描述\r\n\r\n基于阿里云安装宝塔面板\r\n注意事项：出于性能考虑，服务器的操作系统一定要选Linux版本（centos或者ubuntu），不要选Window。\r\n\r\n阿里云的云服务器，即阿里云ECS，默认的用户名 root，密码的话建议修改。\r\n\r\n远程连接云服务器，使用用户名密码登录workbench，使用的是公网ip\r\n在这里插入图片描述\r\n\r\n输入宝塔安装命令\r\n\r\nyum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh\r\nAI写代码\r\nc\r\n运行\r\n1\r\n中途会弹出是否安装，输入y，按照提示继续安装\r\n\r\n不同系统的安装命令不同，具体可以在宝塔官网查看\r\n\r\nhttps://www.bt.cn/new/download.html\r\n在这里插入图片描述\r\n\r\n宝塔面板安装成功后，如下图所示：\r\n\r\n在这里插入图片描述\r\n\r\n上面三个是很重要的参数，一定要记住！\r\n\r\n打开上面的宝塔链接，输入用户名和密码，进入宝塔面板：\r\n在这里插入图片描述\r\n\r\nLNMP: Linux + Nginx + Mysql + PHP\r\nLAMP: Linux + Apache + Mysql + PHP\r\n\r\n两者区别：静态内容多建议选择Nginx内存占用更少。 动态内容较多建议选择Apache更稳定。\r\n\r\n修改登录宝塔的路径以及用户名和，密码，重新登录即可\r\n\r\n阿里云ecs参考视频：https://www.bilibili.com/video/BV12b4y18725?p=1&vd_source=d14cc35dc785edf94050c3a6a05600fc\r\n\r\n宝塔面板部署go项目\r\n我们都知道，部署项目，其实就是他的二进制文件，基本都是有多种方式部署：\r\n\r\n将项目文件打包进入服务器，并下载go环境，build该go项目，并run起来；即和本地跑项目没太大区别；但是该方法不太适合大型的项目，因为build会占用较大的内存，而服务器内存通常都较小，会有概率失败，而且下载各种环境也是一个弊端，日常项目自然是没有问题的；\r\n使用docker部署项目到服务器；\r\n事先生成项目的linux版本二进制文件为main，单独将main拉进服务器，并配置启动项，若没有问题可直接运行，直接少了build和下载环境的步骤；\r\n1.手动配置部署\r\n环境配置\r\n在go官方下载linux的go包，网址：\r\n\r\nAll releases - The Go Programming Language (google.cn)\r\n\r\n下载完毕后上传到服务器\r\n\r\nimage-20240324111614365\r\n\r\n然后将文件解压（解压地址可以自己设置）\r\n\r\ntar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz\r\n\r\nAI写代码\r\nlinux\r\n1\r\n2\r\n将Go语言的可执行文件路径添加到系统的PATH环境变量中，以便在任何位置都能够访问到Go相关的命令。\r\n\r\necho \'export PATH=$PATH:/usr/local/go/bin\' >> ~/.bashrc\r\nAI写代码\r\n1\r\n然后运行以下命令使其生效：\r\n\r\nsource ~/.bashrc\r\nAI写代码\r\n1\r\n验证安装： 执行以下命令验证Go语言是否成功安装：\r\n\r\ngo version\r\nAI写代码\r\n1\r\n如果输出Go的版本信息，则表示安装成功。\r\n\r\n然后设置go的代理地址，建议设置，不然可能会下载库很慢；\r\n\r\ngo env -w GO111MODULE=on\r\ngo env -w GOPROXY=https://goproxy.cn\r\nAI写代码\r\n1\r\n2\r\n将源代码拉入服务器并生成项目二进制文件\r\n1.进入项目指定目录，上传自己本地项目的压缩包，效果图如下，并解压成文件夹；\r\n\r\n上传项目文件\r\n进入项目根目录，打开终端，输入go mod tidy下载项目需要的依赖库，再使用go build main.go生成二进制可执行文件main；\r\n在这里插入图片描述\r\n\r\n创建项目\r\nimage-20240324112704223\r\n\r\n将项目生成的二进制main文件填入（仿照下边这个）\r\n\r\n在这里插入图片描述\r\n\r\n保存之后使用ip+端口+路由就可以访问了；\r\n\r\n若想要配置域名，需要点击域名管理，增加域名，并申请ssl证书；\r\n\r\n如果有数据库，也需要建立对应的数据库用户和密码，并将表结构导入；（同代码配置文件中写的一致）；\r\n\r\n2docker配置部署\r\n为了能够更完整的演示docker部署，教程会先演示在本地生成docker镜像并提交到dockerhub，然后在服务器上拉取先前提交的docker镜像生成容器运行；\r\n\r\n以一个启动main.go文件启动的项目示例\r\n\r\n前置条件：\r\n\r\n1.windows上下载docker desktop\r\n\r\n2.注册dockerhub账号，并在本地登录dockerhub\r\n\r\n好了，下边是演示：\r\n\r\n首先要保证你的项目可以运行，新建一个Dockerfile文件，输入以下基础go项目配置\r\n\r\n输入：image-20240324142720131\r\n\r\n# 基于 golang 镜像构建 Docker 容器\r\nFROM golang:latest\r\n\r\n# 设置工作目录为 /app\r\nWORKDIR /app\r\n\r\n# 将当前目录下的所有文件复制到工作目录 /app 中\r\nCOPY . .\r\n\r\n# 编译 Go 语言程序\r\nRUN go build -o main .\r\n\r\n# 暴露容器的端口，如果您的 Go 语言程序监听了某个端口，则需要暴露该端口\r\nEXPOSE 8080\r\n\r\n# 运行 Go 语言程序\r\nCMD [\"./main\"]\r\n\r\nAI写代码\r\nDockerfile\r\n\r\n1\r\n2\r\n3\r\n4\r\n5\r\n6\r\n7\r\n8\r\n9\r\n10\r\n11\r\n12\r\n13\r\n14\r\n15\r\n16\r\n17\r\n18\r\n在终端输入：\r\n\r\ndocker login \r\nAI写代码\r\n1\r\n若第一次登录是需要输入账号密码；\r\n\r\n生成docker镜像\r\n\r\ndocker build -t test:v1\r\nAI写代码\r\n1\r\n-t 设置镜像名称和版本号 test是镜像名称 v1是版本号；\r\n\r\n先测试运行下\r\n\r\ndocker run -p主机端口号:容器端口号 -d --name 容器名 镜像名:版本号；\r\nAI写代码\r\n1\r\n如果项目能运行就将其推送到dockerhub；：\r\n\r\n标记你的本地镜像以指定 Docker Hub 中的目标仓库和标签：\r\n\r\ndocker tag [本地镜像名称] [你的 Docker Hub 用户名]/[目标仓库名称]:[标签]\r\nAI写代码\r\n1\r\n最后，推送镜像到 Docker Hub：\r\n\r\ndocker push [你的 Docker Hub 用户名]/[目标仓库名称]:[标签]\r\nAI写代码\r\n1\r\n然后进入服务器，同样输入docker login登录\r\n\r\n从 Docker Hub 拉取并运行镜像：\r\n\r\n使用以下命令从 Docker Hub 拉取镜像：\r\n\r\ndocker pull [你的 Docker Hub 用户名]/[目标仓库名称]:[标签]\r\nAI写代码\r\n1\r\n拉取完成后，你可以运行该镜像：\r\n\r\ndocker run [你的 Docker Hub 用户名]/[目标仓库名称]:[标签]\r\nAI写代码\r\n1\r\n此时你的项目就在服务器上运行了，嗯，非常的方便；\r\n\r\n3可执行文件配置\r\n第三种是先生成main可执行文件，只将可执行文件拉入服务器中，之后过程和方法一配置网站一样…', 34, 12000, 174, '/cover/cover2.jpg', '1');
INSERT INTO `article` VALUES ('285ec847-1623-4ea0-b1e6-bc8b41970a15', NULL, 'Cali Remix', '2025-07-18 14:29:11', '# Cali Remix\n<!-- 网易云外链播放器 -->\n<iframe\n  frameborder=\"no\"\n  border=\"0\"\n  marginwidth=\"0\"\n  marginheight=\"0\"\n  width=\"330\"\n  height=\"86\"\n  src=\"//music.163.com/outchain/player?type=2&id=33367876&auto=0&height=66\">\n</iframe>', NULL, 0, NULL, '', NULL);
INSERT INTO `article` VALUES ('29cc1e14-ff45-4299-970f-a00df61d0f64', NULL, '作者测试', '2025-07-19 02:37:06', '1111111111111111111111', NULL, 0, NULL, '', NULL);
INSERT INTO `article` VALUES ('3', '1', 'Springboot入门到精通（超详细文档）', '2024-07-14 14:12:14', '1. Spring Boot是什么\r\n我们知道，从 2002 年开始，Spring 一直在飞速的发展，如今已经成为了在Java EE（Java Enterprise Edition）开发中真正意义上的标准，但是随着技术的发展，Java EE使用 Spring 逐渐变得笨重起来，大量的 XML 文件存在于项目之中。繁琐的配置，整合第三方框架的配置问题，导致了开发和部署效率的降低。\r\n\r\n2012 年 10 月，Mike Youngstrom 在 Spring jira 中创建了一个功能请求，要求在 Spring 框架中支持无容器 Web 应用程序体系结构。他谈到了在主容器引导 spring 容器内配置 Web 容器服务。这是 jira 请求的摘录：\r\n\r\n我认为 Spring 的 Web 应用体系结构可以大大简化，如果它提供了从上到下利用 Spring 组件和配置模型的工具和参考体系结构。在简单的 main()方法引导的 Spring 容器内嵌入和统一这些常用Web 容器服务的配置。\r\n\r\n这一要求促使了 2013 年初开始的 Spring Boot 项目的研发，到今天，Spring Boot 的版本已经到了 2.0.3 RELEASE。Spring Boot 并不是用来替代 Spring 的解决方案，而是和 Spring 框架紧密结合用于提升 Spring 开发者体验的工具。\r\n\r\n它集成了大量常用的第三方库配置，Spring Boot应用中这些第三方库几乎可以是零配置的开箱即用（out-of-the-box），大部分的 Spring Boot 应用都只需要非常少量的配置代码（基于 Java 的配置），开发者能够更加专注于业务逻辑。', 3437, 100000, 19843, 'https://picsum.photos/1200/300', '1');
INSERT INTO `article` VALUES ('4', '5', 'What are the best online guitar lessons in 2025? I review guitar gear for a living and these are my favourite lessons platforms', '2025-07-16 13:22:27', 'I\'ve been playing guitar for over 20 years, and I still remember my first guitar lessons well. Back when I got started playing your choices were limited lessons from your school if they provided them, an expensive private tutor, an expensive classical guitar school, and that was pretty much it. Nowadays learning the guitar has never been more accessible though, thanks to the advent of the best online guitar lessons.\r\n\r\nI believe getting lessons is a really important component of getting you into the guitar, and without lessons during my first year picking up the instrument, I wouldn\'t be playing today. Between myself and the rest of the MusicRadar team, we\'ve tested a huge selection of online lessons that are available today, so whether you\'re a complete beginner with your first instrument, or you\'ve got some years under your belt and want to plug some of those knowledge gaps, there will be something in this article to suit you.\r\n\r\nAt the moment, my favourite for beginner players is Fender Play. Its slick user experience, quality tutors, and excellent song choice make it perfect for first-timers. If you\'ve already got some playing experience, then I\'d recommend you check out Guitar Tricks. It\'s not quite as slick as Fender Play, but there\'s such a huge amount of content available it won\'t matter too much.\r\n\r\nThe best thing about online lessons is that they\'ll work out a lot cheaper than private tuition, and all you need is a device capable of going online and your instrument to get started. Myself and the expert reviewers here at MusicRadar have chosen a selection to cover all skill levels and budgets. Most of these platforms offer some form of trial, so we\'d highly recommend checking those out before you commit to any particular platform.\r\n\r\nFor more information, check out our FAQs section and our how-to-choose guide for more help choosing an online guitar lessons platform.', 1390, 15070, 500, '/cover/cover3.jpg', '1');
INSERT INTO `article` VALUES ('5', '6', '据日本消息人士透露，《鬼灭之刃 无限城篇》剧场版第一部和TYPE-MOON的《魔法使之夜》剧场版都将于2025年上映！', '2024-11-20 22:48:31', '据日本消息人士透露，《鬼灭之刃 无限城篇》剧场版第一部和TYPE-MOON的《魔法使之夜》剧场版都将于2025年上映！\r\n\r\n进一步的官方信息将在不久的将来公布。 ​​​\r\n\r\n据日本消息人士透露，《鬼灭之刃 无限城篇》剧场版第一部和TYPE-MOON的《魔法使之夜》剧场版都将于2025年上映！\r\n\r\n版权所有：梦次元- 你的二次元日记\r\n文章标题：据日本消息人士透露，《鬼灭之刃 无限城篇》剧场版第一部和TYPE-MOON的《魔法使之夜》剧场版都将于2025年上映！\r\n文章链接：https://www.mengacg.cn/ACGQB/449.html\r\n本站文章均为原创，未经授权请勿用于任何商业用途', 200, 1000, 168, '/cover/cover1.jpg', '1');
INSERT INTO `article` VALUES ('6', '3', 'alist+filmly播放器 集合所有网盘打造家庭影院', '2024-05-16 23:19:16', 'Alist+Filmly播放器：打造家庭影院新体验\r\nalist+filmly播放器 集合所有网盘打造家庭影院\r\n家庭娱乐已成为人们生活中不可或缺的一部分。为了满足家庭用户对高质量影音内容的需求，alist+filmly播放器应运而生。这一播放器能刮削网盘里的视频自动添加海报和信息，alist则能把所有网盘集合成一条链接供播放器调用.\r\n\r\n内容的组织与呈现\r\n一、清晰的内容结构\r\n\r\nalist+filmly播放器内容丰富，结构清晰。它不仅集成了各大网盘的影视资源，还通过智能分类和标签系统，使用户能够轻松找到自己想看的影片。无论是热门大片、经典老片，还是各类纪录片、综艺节目，都能在alist+filmly播放器中找到。\r\n\r\n二、精美的界面设计\r\n\r\n在界面设计上，alist+filmly播放器注重用户体验。界面简洁明了，操作便捷，即使是初次使用的用户也能快速上手。\r\n\r\n功能与特点\r\n一、多网盘支持\r\n\r\nalist+filmly播放器支持多种网盘资源接入，用户无需在不同的网盘之间切换，就能在一个平台上观看所有想看的影片。这一特点极大地提高了用户的观影效率，也方便了用户的管理。\r\n\r\n二、家庭影院体验\r\n\r\n通过alist+filmly播放器，用户可以在家中享受影院级的观影体验。无论是大屏幕投影，还是家庭影院系统，都能与alist+filmly播放器完美配合，为用户带来沉浸式的观影感受。\r\n\r\n视频演示\r\n\r\n下载链接\r\n夸克\r\nhttps://pan.quark.cn/s/b1dd97bcf5da\r\nUC\r\nhttps://drive.uc.cn/s/025c5e5eb0f34?public=1\r\n123盘\r\n123盘微信扫码在小程序里搜索 alist 获取\r\nalist+filmly播放器 集合所有网盘打造家庭影院', 200, 1000, 100, '/cover/cover1.jpg', '1');
INSERT INTO `article` VALUES ('7', '4', '电影2022', '2024-02-17 10:03:46', '2022🔗\r\n 《玛丽与马克思》，✨✨✨，木偶动画片，全剧以一种娓娓道来的故事在讲述一位来自澳大利亚的女孩与远在美国纽约的社会边缘人的通信往来。适合性格比较感性的同学观看（我没有看完，因为是分为两次看的，第二次 partner 自行观看，然后我自己好像又没动力继续一个人看完）\r\n 《死亡诗社》，✨✨✨✨，讲述了美国一家精英贵族学校里新来的一位男老师为受到教育体制，父母的强烈影响下的学生们播下了独立思考的种子。如果再年轻的时候看这部片子的话，我会很受用，但是现在的年纪好像看了，也就是看了，没有想象中的那种精神震动了。\r\n 《不可饶恕》，✨✨✨，美国西部片，讲述了 1880 年左右的一位退休赏金猎人的再次出山。不过现在的我不是很能共情这样的“英雄”了。\r\n 《卡萨布莱卡>,✨✨✨✨, 1942 年的片子，当年德国已经入侵了法国，卡萨布莱卡当时是法属摩洛哥的首都，很多欧洲人会选择这里作为逃亡美国的中转站，影片讲述了开在这里的一间酒吧发生的战争期间的爱情故事。虽然有一点逻辑在现在看来有点过于戏剧化，但是作为 1942 年的片子，各方面来说都是顶级作品。推荐。\r\n 《穿靴子的猫 2》，✨✨✨✨✨，很不错哎，超出预期，相对于 1，讲了了一个不一样的故事。最近疫情高峰，影院人很少，几乎相当于包场，很爽的一次体验，对于动画片，没有小孩的干扰！\r\n 《阿凡达 2》，✨✨✨，好吧，我承认我对特效并不感兴趣，我更喜欢故事。\r\n 地下 , ✨✨✨✨✨，后现代荒诞喜剧，讲述了南斯拉夫的历史。开头很惊艳，随后有点无聊，但是 1 小时后，每一分钟都很精彩，强烈推荐！\r\n 谋杀绿脚趾，✨✨✨✨✨，喜剧，太好看了，以前看过，昨天翻硬盘的时候看到又看了一遍。最后一幕太经典了。推荐所有人看。\r\n 华氏 451 度，2018，✨✨✨✨，豆瓣 5.5 分，但是对于看过原著的人来说，电影是一个非常好的补充，电影在影视方面拍的很不错，情节方面其实老实说，我觉得比原著要好，改编了很多，增加了很多情节和细节。\r\n 悲惨世界，✨✨✨✨，音乐剧，很享受剧本，但是情节就是有点太刻意。\r\n 小妇人，✨✨✨✨，之前看过一点小说。“我爱你，但是我觉得除了爱之外我还有更重要的事”。女性力量。', 200, 800, 120, '/cover/cover1.jpg', '1');
INSERT INTO `article` VALUES ('753eecbf-6943-4140-945d-15f2c020572f', NULL, '图片测试', '2025-07-18 13:04:53', '![](/cover/cover1.jpg)', NULL, 0, NULL, '', NULL);
INSERT INTO `article` VALUES ('a6e6c816-84a2-41fe-8bd8-1902a6fbc7b1', NULL, '传送门2 第4期', '2025-07-18 14:27:12', '<!-- B 站视频 16:9 -->\n<iframe\n  src=\"//player.bilibili.com/player.html?aid=12345678&bvid=BV1xxxxxx&page=1\"\n  scrolling=\"no\"\n  border=\"0\"\n  frameborder=\"no\"\n  framespacing=\"0\"\n  allowfullscreen\n  style=\"width:100%;aspect-ratio:16/9;border-radius:6px\">\n</iframe>', NULL, 0, NULL, '', NULL);
INSERT INTO `article` VALUES ('c6ceaab0-9795-49f8-93d9-bcfea923e57e', NULL, '测试格式', '2025-07-19 05:16:26', '![cover](/cover/cover2.jpg)\n# mc稍后观看\n<iframe src=\"https://player.bilibili.com/player.html?bvid=BV18Fu3zsEZR\"\n        scrolling=\"no\"\n        border=\"0\"\n        frameborder=\"no\"\n        framespacing=\"0\"\n        allowfullscreen=\"true\"\n        width=\"100%\"\n        height=\"400\">\n</iframe>', NULL, 0, NULL, '', NULL);
INSERT INTO `article` VALUES ('ea12e0eb-5d68-4dcf-b38e-ebac7cd87665', NULL, '111', '2025-07-19 16:40:35', '111', NULL, 0, NULL, '', NULL);

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `article_tag_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签名称',
  `article_tag_add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag
-- ----------------------------
INSERT INTO `article_tag` VALUES ('1', '学习', '2020-01-14 14:17:13');
INSERT INTO `article_tag` VALUES ('10', 'Python', '2025-07-14 14:20:11');
INSERT INTO `article_tag` VALUES ('100', 'spring boot', '2025-07-14 14:19:10');
INSERT INTO `article_tag` VALUES ('101', '服务器', '2025-07-14 14:20:09');
INSERT INTO `article_tag` VALUES ('11', 'cmd', '2025-07-14 14:24:16');
INSERT INTO `article_tag` VALUES ('12', 'windows', '2025-07-14 14:24:18');
INSERT INTO `article_tag` VALUES ('13', '编程语言', '2025-07-14 14:24:20');
INSERT INTO `article_tag` VALUES ('14', '后端', '2025-07-15 20:39:54');
INSERT INTO `article_tag` VALUES ('15', '前端', '2025-07-14 14:17:29');
INSERT INTO `article_tag` VALUES ('16', '移动开发', '2025-07-14 14:17:47');
INSERT INTO `article_tag` VALUES ('17', 'Java', '2025-07-14 14:17:58');
INSERT INTO `article_tag` VALUES ('18', '阿里云', '2025-07-14 14:20:07');
INSERT INTO `article_tag` VALUES ('19', 'spring cloud', '2025-07-14 14:18:56');
INSERT INTO `article_tag` VALUES ('2', '娱乐', '2020-07-01 20:46:48');
INSERT INTO `article_tag` VALUES ('20', '音乐', '2025-07-15 20:49:15');
INSERT INTO `article_tag` VALUES ('21', '动漫', '2025-07-15 20:49:33');
INSERT INTO `article_tag` VALUES ('22', '影视', '2025-07-15 20:49:51');
INSERT INTO `article_tag` VALUES ('23', '游戏', '2024-07-17 10:07:23');
INSERT INTO `article_tag` VALUES ('3', '日常', '2025-02-15 20:50:09');
INSERT INTO `article_tag` VALUES ('30', '美食', '2020-07-15 20:50:24');

-- ----------------------------
-- Table structure for article_tag_list
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_list`;
CREATE TABLE `article_tag_list`  (
  `article_tag_list_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章id',
  `article_tag_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`article_tag_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章对应标签的关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag_list
-- ----------------------------
INSERT INTO `article_tag_list` VALUES ('1', '1', '11');
INSERT INTO `article_tag_list` VALUES ('10', '5', '2');
INSERT INTO `article_tag_list` VALUES ('100', '5', '21');
INSERT INTO `article_tag_list` VALUES ('101', '6', '22');
INSERT INTO `article_tag_list` VALUES ('102', '6', '2');
INSERT INTO `article_tag_list` VALUES ('103', '7', '22');
INSERT INTO `article_tag_list` VALUES ('11', '1', '1');
INSERT INTO `article_tag_list` VALUES ('2', '1', '12');
INSERT INTO `article_tag_list` VALUES ('21', '2', '1');
INSERT INTO `article_tag_list` VALUES ('3', '1', '17');
INSERT INTO `article_tag_list` VALUES ('31', '3', '1');
INSERT INTO `article_tag_list` VALUES ('4', '2', '101');
INSERT INTO `article_tag_list` VALUES ('5', '2', '18');
INSERT INTO `article_tag_list` VALUES ('6', '3', '100');
INSERT INTO `article_tag_list` VALUES ('7', '3', '17');
INSERT INTO `article_tag_list` VALUES ('8', '3', '19');
INSERT INTO `article_tag_list` VALUES ('9', '4', '20');
INSERT INTO `article_tag_list` VALUES ('91', '4', '2');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `article_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论的文章id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  `comment_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `comment_like_count` int NULL DEFAULT NULL COMMENT '点赞次数',
  `article_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '评论内容',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `FKd3v4haygsy325q1j873y347ge`(`user_id` ASC) USING BTREE,
  CONSTRAINT `FKd3v4haygsy325q1j873y347ge` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '3', '成功解决，但是这为什么会是Java.exe占用8080端口呢，平时都没有出现这种占用问题', '2025-07-14 13:43:01', 1, NULL);
INSERT INTO `comment` VALUES ('2', '2', '5', '博主你好，我想问一下，我申请的试用云服务器在部署了项目并且域名解析以后，还是无法访问网站，显示我需要网站备案，但是阿里云这边不让我对试用服务器进行备案，这是为什么？有什么解决办法吗', '2024-07-14 14:10:38', 2, NULL);
INSERT INTO `comment` VALUES ('e5705430-a754-4b96-8861-660947a6abde', 'c6ceaab0-9795-49f8-93d9-bcfea923e57e', '3', '测试视频', '2025-07-19 05:16:53', 0, NULL);

-- ----------------------------
-- Table structure for comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply`  (
  `comment_reply_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论回复id',
  `comment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论id',
  `reply_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论者id',
  `secondly_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复评论者的用户id',
  `comment_reply_time` datetime NULL DEFAULT NULL COMMENT '评论回复时间',
  PRIMARY KEY (`comment_reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论回复' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_reply
-- ----------------------------

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `link_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友链id',
  `link_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情链接名称',
  `link_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情链接',
  `link_logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情链接logo id',
  `link_add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '猜位置', 'https://tuxun.fun/', '/link/logo.svg', '2025-07-16 12:49:52');
INSERT INTO `link` VALUES ('2', '免费素材合集', 'https://veleap.com/console/works/material/font', '/link/veleap logo.svg', '2025-07-16 12:56:19');
INSERT INTO `link` VALUES ('3', '听懂一切', 'https://tingdong.cn/', '/link/logo.png', '2025-07-16 22:07:41');
INSERT INTO `link` VALUES ('4', '修理手册', 'https://zh.ifixit.com/', NULL, '2025-07-17 14:27:37');
INSERT INTO `link` VALUES ('5', '环游世界的虚拟之旅', 'https://www.airpano.com/360photo/ancient_petra/', NULL, NULL);
INSERT INTO `link` VALUES ('6', 'PlantUML', 'https://app.timelessq.com/office/plantuml-editor', '', NULL);
INSERT INTO `link` VALUES ('7', 'PlantUML Online', 'https://www.plantuml.com/plantuml/uml/SyfFKj2rKt3CoKnELR1Io4ZDoSa700001', NULL, NULL);
INSERT INTO `link` VALUES ('8', 'antdv', 'https://www.antdv.com/components/overview-cn', NULL, NULL);
INSERT INTO `link` VALUES ('9', '搜图', 'https://saucenao.com/index.php', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_register_time` datetime NULL DEFAULT NULL COMMENT '用户注册时间',
  `user_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `user_role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户身份',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'natsuiro', '$2y$10$RCils9kC/od5MD/XTgPW8u6sfp2gOYGQeh87z1LBaEtfIgg1yAsiq', '2019-07-05 10:10:45', 'natsuiro@v.com', 'USER');
INSERT INTO `user` VALUES ('2', 'fubuki', '$2y$10$RCils9kC/od5MD/XTgPW8u6sfp2gOYGQeh87z1LBaEtfIgg1yAsiq', '2019-07-05 10:11:22', 'fubuki@v.com', 'ADMIN');
INSERT INTO `user` VALUES ('3', 'subaru', '$2a$13$NbL2KyQwVMZXHV3QmVtPcOW8EHv.VeX/Wr2IpsrfU6Bk66YBulqxy', '2019-07-14 14:04:58', 'subaru@v.com', 'ADMIN');
INSERT INTO `user` VALUES ('4', 'pekora', '$2y$10$dzVkYIFJFMtrGTuH8kwLHuSkO2OrxgJUN5FT8G/G0QdAXAhbowN86', '2019-07-14 14:05:23', 'pekora@v.com', 'ADMIN');
INSERT INTO `user` VALUES ('5', 'towa', '$2y$10$RCils9kC/od5MD/XTgPW8u6sfp2gOYGQeh87z1LBaEtfIgg1yAsiq', '2020-07-14 14:06:07', 'towa@v.com', 'USER');
INSERT INTO `user` VALUES ('6', 'okayu', '$2y$10$RCils9kC/od5MD/XTgPW8u6sfp2gOYGQeh87z1LBaEtfIgg1yAsiq', '2019-07-14 14:06:41', 'okayu@v.com', 'USER');
INSERT INTO `user` VALUES ('7', 'mio', '$2y$10$RCils9kC/od5MD/XTgPW8u6sfp2gOYGQeh87z1LBaEtfIgg1yAsiq', '2019-07-14 14:07:08', 'mio@v.com', 'ADMIN');
INSERT INTO `user` VALUES ('ab7685d2-6d38-4a98-be25-020f5ccde535', 'ksd', '$2a$10$IyXEUgQV8Ot4IBNfcIOEu.NrAWWA.v1YnLAC5UZ/8cDZYtz2lKBWe', '2025-07-18 15:45:34', '2125818660@qq.com', 'ADMIN');

SET FOREIGN_KEY_CHECKS = 1;
