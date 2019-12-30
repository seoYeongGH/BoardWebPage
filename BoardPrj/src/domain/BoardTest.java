package domain;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.PlatformTransactionManager;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="/domain/applicationContext.xml")
public class BoardTest {
	@Autowired BoardDAO dao;
	@Autowired PlatformTransactionManager transactionManager;
	
	@Test
	public void testSelectTotalBbsCount() {
		
		int count = dao.selectTotalBbsCount();
		assertThat(count,is(12));
	}
}

