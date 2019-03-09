package com.cg.mobilebilling.services;
import java.util.List;

import com.cg.mobilebilling.beans.Bill;
import com.cg.mobilebilling.beans.Customer;
import com.cg.mobilebilling.beans.Plan;
import com.cg.mobilebilling.beans.PostpaidAccount;
import com.cg.mobilebilling.exceptions.BillDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.CustomerDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.InvalidBillMonthException;
import com.cg.mobilebilling.exceptions.PlanDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.PostpaidAccountNotFoundException;
public interface BillingServices {
	Plan getPlanAllDetails(int planId)throws PlanDetailsNotFoundException;
	
	int acceptCustomerDetails(Customer customer);

	long openPostpaidMobileAccount(int customerID, int planID) 
			throws PlanDetailsNotFoundException,CustomerDetailsNotFoundException;
	
	Bill  generateMonthlyMobileBill(int customerID,long mobileNo,Bill bill) 
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, 
			InvalidBillMonthException,PlanDetailsNotFoundException;
	
	Customer getCustomerDetails(int customerID)
			throws CustomerDetailsNotFoundException;
	
	List<Customer>  getAllCustomerDetails() ;
	
	PostpaidAccount getPostPaidAccountDetails(int customerID, long mobileNo) 
			throws CustomerDetailsNotFoundException, 
			PostpaidAccountNotFoundException;
	
	List<PostpaidAccount> getCustomerAllPostpaidAccountsDetails(int customerID)
			throws CustomerDetailsNotFoundException;
	
	Bill getMobileBillDetails(int customerID, long mobileNo, String billMonth)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, 
			InvalidBillMonthException, BillDetailsNotFoundException;
	
	List<Bill>   getCustomerPostPaidAccountAllBillDetails(int customerID, long mobileNo) 
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException;
	
	boolean changePlan(int customerID, long mobileNo, int planID)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException,PlanDetailsNotFoundException;
	
	boolean closeCustomerPostPaidAccount(int customerID, long mobileNo) 
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException;
	
	boolean removeCustomerDetails(int customerID) 
			throws CustomerDetailsNotFoundException;
	
	Plan getCustomerPostPaidAccountPlanDetails(int customerID, long mobileNo) 
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException,PlanDetailsNotFoundException ;
	List<Plan>getAllPlanDetails();
}