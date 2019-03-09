package com.cg.mobilebilling.controllers;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cg.mobilebilling.beans.Bill;
import com.cg.mobilebilling.beans.Customer;
import com.cg.mobilebilling.beans.Plan;
import com.cg.mobilebilling.services.BillingServices;
@Controller
public class URIController {
	private Customer customer;
	private Bill bill;
	@Autowired
	private BillingServices billingServices;
	@RequestMapping(value={"/","indexPage"})
	public String getIndexPage() {
		return "indexPage";
	}
	@RequestMapping("/registration")
	public String getRegisterationPage(){
		return "customerRegistrationPage";
	}
	@RequestMapping("/generateBill")
	public String getGenerateMonthlyBillSuccessPage(){
		return "generateMonthlyBillPage";
	}
	@RequestMapping("/openAccount")
	public ModelAndView getOpenPostpaidAccountPage(){
		List<Plan>plans;
		plans=billingServices.getAllPlanDetails();
		return new ModelAndView("openPostpaidAccountPage","plans",plans);
	}
	@RequestMapping("/displayCustomer")
	public String getDisplayCustomerDetailsPage(){
		return "displayCustomerDetailsPage";
	}
	@RequestMapping("/displayAccount")
	public String getDisplayPostpaidAccountDetailsPage(){
		return "displayPostpaidAccountDetailsPage";
	}
	@RequestMapping("/showPlans")
	public ModelAndView getShowPlansPage(){
		List<Plan>plans;
		plans=billingServices.getAllPlanDetails();
		return new ModelAndView("showPlansPage","plans",plans);
	}
	@RequestMapping("/changePlan")
	public ModelAndView getChangePlanPage(){
		List<Plan>plans;
		plans=billingServices.getAllPlanDetails();
		return new ModelAndView("changePlanPage","plans",plans);
	}
	@RequestMapping("/displayAccountBills")
	public String getDisplayPostpaidAccountAllBills(){
		return "displayPostpaidAccountAllBills";
	}
	@RequestMapping("/deleteAccount")
	public String getDeletePostpaidAccountPage(){
		return "deletePostpaidAccountPage";
	}
	@RequestMapping("/deleteCustomer")
	public String getDeleteCustomerPage(){
		return "deleteCustomerPage";
	}
	@RequestMapping("/displayMonthlyBill")
	public String getDisplayMonthlyBillPage(){
		return "displayMonthlyBillPage";
	}
	@ModelAttribute
	public Customer getAssociate() {
		customer=new Customer();
		return customer;
	}
	@ModelAttribute
	public Bill getBill() {
		bill=new Bill();
		return bill;
	}
}
