package com.cg.mobilebilling.aspect;
import org.springframework.web.bind.annotation.ControllerAdvice;
@ControllerAdvice
public class MobileBillingExceptionAspect {
	/*
	 * @ExceptionHandler(AccountNotFoundException.class) public ModelAndView
	 * handleAccountNotFoundException(Exception e) { return new
	 * ModelAndView("loginPage", "errorMessage", e.getMessage()); }
	 * 
	 * @ExceptionHandler(InvalidPinNumberException.class) public ModelAndView
	 * handleInvalidPinNumberException(Exception e) { return new
	 * ModelAndView("loginPage", "errorMessage", e.getMessage()); }
	 * 
	 * @ExceptionHandler(InvalidAmountException.class) public ModelAndView
	 * handleInvalidAmountException(Exception e) { ModelAndView modelAndView=new
	 * ModelAndView("registrationPage", "errorMessage", e.getMessage());
	 * modelAndView.addObject("account",new Account()); return modelAndView; }
	 * 
	 * @ExceptionHandler(InsufficentAmountException.class) public ModelAndView
	 * handleInsufficentAmountException(Exception e) { return new
	 * ModelAndView("withdrawAmountPage", "errorMessage", e.getMessage()); }
	 * 
	 * @ExceptionHandler(AccountBlockedException.class) public ModelAndView
	 * handleAccountBlockedException(Exception e) { return new
	 * ModelAndView("loginPage", "errorMessage", e.getMessage()); }
	 */
}
