package com.house.generator;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DbType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;
import org.junit.jupiter.api.Test;

/**
 * mybatis-plus代码生成器
 */
public class GeneratorTest {

    /**
     * 代码生成实例
     */
    @Test
    public void testGenerator() {
        // 1.全局配置
        GlobalConfig config = new GlobalConfig();
        // 是否支持AR模式
        config.setActiveRecord(false)
                // 生成路径，生成到java路径位置
                .setOutputDir("E:\\JAVA\\程序2\\house\\src\\main\\java")
                // 多次生成是否文件覆盖
                .setFileOverride(true)
                // 设置主键策略
                .setIdType(IdType.AUTO)
                // 设置生成的service接口的名字的首字母是否为I，默认有
                .setServiceName("%sService")
                // 生成SQL映射文件
                .setBaseResultMap(true)
                // 生成基本SQL片段
                .setBaseColumnList(true);
        // 2.数据源配置
        DataSourceConfig dataSourceConfig = new DataSourceConfig();
        // 设置数据库类型
        dataSourceConfig.setDbType(DbType.MYSQL)
                .setDriverName("com.mysql.jdbc.Driver")
                .setUrl("jdbc:mysql://localhost:3306/house?serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8")
                .setUsername("root")
                .setPassword("yangdeshi");
        // 3.策略配置
        StrategyConfig strategyConfig = new StrategyConfig();
        // 开启全局大写
        strategyConfig.setCapitalMode(true)
                // 设置数据库表映射到实体时下划线转驼峰策略
                .setNaming(NamingStrategy.underline_to_camel)
                // 设置表名前缀
                .setTablePrefix("h_");
        // 4.包名策略配置
        PackageConfig packageConfig = new PackageConfig();
        // 设置每一种代码生成的包名
        packageConfig.setParent("com.house")
                .setMapper("mapper")
                .setService("service")
                .setController("controller")
                .setEntity("pojo")
                .setXml("mapper");
        // 5.整合配置
        AutoGenerator autoGenerator = new AutoGenerator();
        autoGenerator.setDataSource(dataSourceConfig)
                .setPackageInfo(packageConfig)
                .setGlobalConfig(config)
                .setStrategy(strategyConfig);
        // 6.执行
        autoGenerator.execute();
    }


}
