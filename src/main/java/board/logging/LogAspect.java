package board.logging;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component	//스프링 빈으로 등록하기 [component-scan 등록 필요, <anotation-driven />태그 필요] 
@Aspect	//AspectJ의 관리를 받도록 설정하기 [<aop:aspectj-autoproxy /> 태그 필요]
public class LogAspect {

	//로그 객체 v2
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	//포인트컷 설정하는 메소드 - Advice가 적용될 메소드(위치) 지정
	@Pointcut("execution(* board.service.impl.*ServiceImpl.*(..))")
	private static void logPointcut() {}

	
	//어드바이스 코드 작성 - 포인트컷에 맞춰 코드가 실행될 시점 지정
//	@Before("logPointcut()")
	@After("logPointcut()")
	public void logBefore() {
		logger.info("AOP 테스트");
	}
	
	//---------------------------------------------------------------
	
//	@Before("execution(void web.controller.DeptController.deptList(Model))") 
//	@Before("execution(* *..controller..*.*(..))") //controller메소드전부다
//	@Before("execution(* *..service..*.*(..))") 
	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))") 
	public void log(JoinPoint joinPoint) {
		
//		logger.info("#### {}", joinPoint); 
//		logger.info("#### {}", joinPoint.getSignature());
		
		Signature signature = joinPoint.getSignature();
		
//		logger.info(">>>> {}", signature.getName());  //메소드명
//		logger.info(">>>> {}", signature.toString()); 	//메소드 정보 전체 (반환타입, 클래스명, 메소드명, 매개변수)
		logger.info(">>>> {}", signature.toShortString()); //클래스명.메소드명(..)
//		logger.info(">>>> {}", signature.toLongString());  //접근제한자 포함, 매개변수 패키지 포함
	}
	
	//쌤이 작성하신 코드들~ 아직 이해못했으니 제대로 공부해~
//	@Before("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
//	public void logBefore(JoinPoint joinPoint) {
//		logger.debug("##### {} 시작", joinPoint.getSignature().toShortString());
//	}
//	
//	@After("execution(* *..controller..*.*(..)) || execution(* *..service..*.*(..))")
//	public void logAfter(JoinPoint joinPoint) {
//		logger.debug("##### {} 종료", joinPoint.getSignature().toShortString());
//	}

}


















