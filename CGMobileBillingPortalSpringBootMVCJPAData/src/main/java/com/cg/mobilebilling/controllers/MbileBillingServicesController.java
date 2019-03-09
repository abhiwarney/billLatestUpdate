package com.cg.mobilebilling.controllers;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cg.mobilebilling.beans.Bill;
import com.cg.mobilebilling.beans.Customer;
import com.cg.mobilebilling.beans.PostpaidAccount;
import com.cg.mobilebilling.exceptions.BillDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.CustomerDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.InvalidBillMonthException;
import com.cg.mobilebilling.exceptions.PlanDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.PostpaidAccountNotFoundException;
import com.cg.mobilebilling.services.BillingServices;
@Controller
public class MbileBillingServicesController {
	@Autowired
	BillingServices billingServices;

	@RequestMapping("/registerCustomer")
	public ModelAndView registerCustomer(@Valid@ModelAttribute Customer customer,BindingResult result) {
		if(result.hasErrors()) return new ModelAndView("customerRegistartionPage");
		int customerID=billingServices.acceptCustomerDetails(customer);
		return new ModelAndView("customerRegistrationPage","customerID",customerID);
	}
	@RequestMapping("/customerDetails")
	public ModelAndView getCustomerDetails(@RequestParam int customerID) throws CustomerDetailsNotFoundException{
		Customer customer=billingServices.getCustomerDetails(customerID);
		return new ModelAndView("displayCustomerDetailsPage","customer",customer);
	}
	@RequestMapping("/postpaidAccountDetails")
	public ModelAndView getPostpaidAccountDetails(@RequestParam int customerID,int mobileNo) throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException{
		PostpaidAccount postpaidAccount=billingServices.getPostPaidAccountDetails(customerID, mobileNo);
		return new ModelAndView("displayPostpaidAccountDetailsPage","postpaidAccount",postpaidAccount);
	}
	@RequestMapping("/openPostpaidAccount")
	public ModelAndView openPostpaidAccount(@RequestParam int customerID,int planID) throws CustomerDetailsNotFoundException, PlanDetailsNotFoundException{
		long mobileNo=billingServices.openPostpaidMobileAccount(customerID, planID);
		return new ModelAndView("openPostpaidAccountSuccess","mobileNo",mobileNo);
	}
	@RequestMapping("/generateBillAccept")
	public ModelAndView generateMonthlyBill(@Valid@ModelAttribute Bill bill,@RequestParam int customerID,long mobileNo,BindingResult result) throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, InvalidBillMonthException, PlanDetailsNotFoundException {
		if(result.hasErrors()) return new ModelAndView("generateMonthlyBillPage");
		bill=billingServices.generateMonthlyMobileBill(customerID, mobileNo, bill);
		return new ModelAndView("gnerateBillSuccessPage","bill",bill);
	}
	@RequestMapping("/changePlanAccept")
	public ModelAndView openPostpaidAccount(@RequestParam int customerID,long mobileNo,int planID) throws CustomerDetailsNotFoundException, PlanDetailsNotFoundException, PostpaidAccountNotFoundException{
		billingServices.changePlan(customerID, mobileNo, planID);
		return new ModelAndView("changePlanSuccessPage","stringMessage","Plan successfully Changed to planID:-"+planID);
	}
	@RequestMapping("/displayAllBillsAccept")
	public ModelAndView displayCustomerAllBill(@RequestParam int customerID,long mobileNo) throws CustomerDetailsNotFoundException,PostpaidAccountNotFoundException{
		List<Bill>bills=billingServices.getCustomerPostPaidAccountAllBillDetails(customerID, mobileNo);
		return new ModelAndView("displayPostpaidAccountAllBillsSuccess","bills",bills);
	}
	@RequestMapping("/deletePostpaidAccountAccept")
	public ModelAndView deletePostpaidAccount(@RequestParam int customerID,long mobileNo) throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException{
		billingServices.closeCustomerPostPaidAccount(customerID, mobileNo);
		return new ModelAndView("deletePostpaidAccountPageSuccess","stringMessage","PostPaid Account Successfully Deleted,MobileNo:-"+mobileNo);
	}
	@RequestMapping("/deleteCustomerAccept")
	public ModelAndView deleteCustomer(@RequestParam int customerID) throws CustomerDetailsNotFoundException{
		billingServices.removeCustomerDetails(customerID);
		return new ModelAndView("deleteCustomerSuccessPage","stringMessage","Customer Details Successfully Deleted,Customer ID:-"+customerID);
	}
	@RequestMapping("/monthlyBillAccept")
	public ModelAndView displayMonthlyBill(@RequestParam int customerID,long mobileNo,String billMonth) throws CustomerDetailsNotFoundException,PostpaidAccountNotFoundException, InvalidBillMonthException, BillDetailsNotFoundException{
		Bill bill=billingServices.getMobileBillDetails(customerID, mobileNo, billMonth);
		return new ModelAndView("displayMonthlyBillPageSuccess","bill",bill);
	}
}
