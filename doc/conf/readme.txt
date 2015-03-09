DWZ Java (Hibernate+Spring+Stuts2) 示例
http://html.duqn.com/ftp/dwz4j-demo.zip

开发环境:

1) 数据库：mysql 
请修改 src/hibernate_mysql.cfg.xml这个文件的数据库连接
创建数据库dwz4j
导入测试数据：db/dwz4j.sql
mysql -u root -p dwz4j < dwz4j.sql
2) JDK 1.6
3) 项目文件UTF-8编码，如果用eclipse打开项目，注意把工作空间编码设成UTF-8
4) 启动tomcat

功能演示：
	Ajax Search
	分页
	添加
	删除
	修改
	导出Excel
	session超时，弹出登入对话框