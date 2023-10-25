package HANA_FINAL_OPENAPI.hanaHospital;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@SpringBootApplication
public class HanaHospitalApplication {

	public static void main(String[] args) {
		SpringApplication.run(HanaHospitalApplication.class, args);
	}


	@Bean //이 메서드를 객체생성해줘야 한다.
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {

		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		sessionFactory.setDataSource(dataSource); //의존성 주입 -servlet-context에서 해주는 작업

		Resource[] res = new PathMatchingResourcePatternResolver()
				.getResources("classpath:mybatis/mapper/*.xml");//*를써서 여러개xml을 받아서 배열씀

		sessionFactory.setMapperLocations(res);


		return sessionFactory.getObject();

	}

}
