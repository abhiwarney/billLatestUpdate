package com.cg.mobilebilling.services;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cg.mobilebilling.beans.Bill;
import com.cg.mobilebilling.beans.Customer;
import com.cg.mobilebilling.beans.Plan;
import com.cg.mobilebilling.beans.PostpaidAccount;
import com.cg.mobilebilling.daoservices.BillDao;
import com.cg.mobilebilling.daoservices.CustomerDao;
import com.cg.mobilebilling.daoservices.PlanDao;
import com.cg.mobilebilling.daoservices.PostpaidAccountDao;
import com.cg.mobilebilling.exceptions.BillDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.CustomerDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.InvalidBillMonthException;
import com.cg.mobilebilling.exceptions.PlanDetailsNotFoundException;
import com.cg.mobilebilling.exceptions.PostpaidAccountNotFoundException;
@Component("billingServices")
public class BillingServicesImpl implements BillingServices {
	@Autowired
	CustomerDao customerDao;
	@Autowired
	PlanDao planDao;
	@Autowired
	BillDao billDao;
	@Autowired
	PostpaidAccountDao postpaidAccountDao;
	@Override
	public Plan getPlanAllDetails(int planId)throws PlanDetailsNotFoundException {
		Plan plan=planDao.findById(planId).orElseThrow(()->new PlanDetailsNotFoundException("Plan details Not Found for Plan Id:-"+planId));
		return plan;
	}

	@Override
	public int acceptCustomerDetails(Customer customer) {
		customer=customerDao.save(customer);
		return customer.getCustomerID();
	}

	@Override
	public long openPostpaidMobileAccount(int customerID, int planID)
			throws PlanDetailsNotFoundException, CustomerDetailsNotFoundException {
		PostpaidAccount postpaidAccount=new PostpaidAccount(getPlanAllDetails(planID),getCustomerDetails(customerID));
		postpaidAccountDao.save(postpaidAccount);
		return postpaidAccount.getMobileNo();
	}

	@Override
	public Bill generateMonthlyMobileBill(int customerID,long mobileNo,Bill bill)
					throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, InvalidBillMonthException, PlanDetailsNotFoundException {
		Plan plan=getCustomerPostPaidAccountPlanDetails(customerID, mobileNo);
		float totalBillAmount=0;
		float localSMSAmount=0; 
		float stdSMSAmount=0;
		float localCallAmount=0;
		float stdCallAmount=0;
		float  internetDataUsageAmount=0; 
		float stateGST=0 ;
		float centralGST=0;
		if(bill.getNoOfLocalCalls()>plan.getFreeLocalCalls()) {
			localCallAmount=(bill.getNoOfLocalCalls()-plan.getFreeLocalCalls())*plan.getLocalCallRate();
		}
		if(bill.getNoOfStdCalls()>plan.getFreeStdCalls()) {
			stdCallAmount=(bill.getNoOfStdCalls()-plan.getFreeStdCalls())*plan.getStdCallRate();
		}
		if(bill.getNoOfLocalSMS()>plan.getFreeLocalSMS()) {
			localSMSAmount=(bill.getNoOfLocalSMS()-plan.getFreeLocalSMS())*plan.getLocalSMSRate();
		}
		if(bill.getNoOfStdSMS()>plan.getFreeStdSMS()) {
			stdSMSAmount=(bill.getNoOfStdSMS()-plan.getFreeStdSMS())*plan.getStdSMSRate();
		}
		if(bill.getInternetDataUsageUnits()>plan.getFreeInternetDataUsageUnits()) {
			internetDataUsageAmount= (bill.getInternetDataUsageUnits()-plan.getFreeInternetDataUsageUnits())*plan.getInternetDataUsageRate();
		}
		float sumOfBill=localCallAmount+stdCallAmount+localSMSAmount+stdSMSAmount+internetDataUsageAmount;
		stateGST=(float) 0.3*sumOfBill;
		centralGST=(float) 0.1*sumOfBill;
		totalBillAmount=sumOfBill+stateGST+centralGST;
		bill.setTotalBillAmount(totalBillAmount);
		bill.setLocalCallAmount(localCallAmount);
		bill.setStdCallAmount(stdCallAmount);
		bill.setStdSMSAmount(stdSMSAmount);
		bill.setLocalSMSAmount(localSMSAmount);
		bill.setInternetDataUsageAmount(internetDataUsageAmount);
		bill.setStateGST(stateGST);
		bill.setCentralGST(centralGST);
		bill.setPostpaidAccount(getPostPaidAccountDetails(customerID, mobileNo));
		billDao.save(bill);
		return bill;
	}

	@Override
	public Customer getCustomerDetails(int customerID) throws CustomerDetailsNotFoundException {
		Customer customer = customerDao.findById(customerID).orElseThrow(()->new CustomerDetailsNotFoundException("Customer id not found="+customerID));
		return customer;
	}

	@Override
	public List<Customer> getAllCustomerDetails() {
		return customerDao.findAll();
	}

	@Override
	public PostpaidAccount getPostPaidAccountDetails(int customerID, long mobileNo)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException {
		PostpaidAccount postpaidAccount = null;
		if(getCustomerDetails(customerID).getPostpaidAccounts().containsKey(mobileNo)) {
			postpaidAccount=postpaidAccountDao.findById(mobileNo).orElseThrow(()->new PostpaidAccountNotFoundException("PostPaid Account  not found for Mobile Number:-"+mobileNo));
		}
		return postpaidAccount;
	}
	@Override
	public List<PostpaidAccount> getCustomerAllPostpaidAccountsDetails(int customerID)
			throws CustomerDetailsNotFoundException {
		return new ArrayList<PostpaidAccount>( getCustomerDetails(customerID).getPostpaidAccounts().values());
	}
	@Override
	public Bill getMobileBillDetails(int customerID, long mobileNo, String billMonth)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, InvalidBillMonthException,
			BillDetailsNotFoundException {
		Bill bill=null;
		ArrayList<Integer>billSetKey=new ArrayList<Integer>(getPostPaidAccountDetails(customerID, mobileNo).getBills().keySet());
		for(int i=0;i<billSetKey.size();i++) {
			if(getPostPaidAccountDetails(customerID, mobileNo).getBills().get(billSetKey.get(i)).getBillMonth().equalsIgnoreCase(billMonth)) {
				bill=billDao.findById(billSetKey.get(i)).orElseThrow(()->new BillDetailsNotFoundException("No Bill Found for Month:-"+billMonth+"and MobileNo:-"+mobileNo));
			}
		}
		return bill;
	}

	@Override
	public List<Bill> getCustomerPostPaidAccountAllBillDetails(int customerID, long mobileNo)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException {
		return new ArrayList<Bill>(getPostPaidAccountDetails(customerID, mobileNo).getBills().values());
	}

	@Override
	public boolean changePlan(int customerID, long mobileNo, int planID)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, PlanDetailsNotFoundException {
		postpaidAccountDao.save(new PostpaidAccount(mobileNo, getPlanAllDetails(planID), getCustomerDetails(customerID)));	
		return true;
	}

	@Override
	public boolean closeCustomerPostPaidAccount(int customerID, long mobileNo)      
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException {
		postpaidAccountDao.delete(postpaidAccountDao.findById(mobileNo).orElseThrow(()->new PostpaidAccountNotFoundException("Account Not Found")));
		return true;
	}

	@Override
	public boolean removeCustomerDetails(int customerID) throws CustomerDetailsNotFoundException {
		customerDao.delete(getCustomerDetails(customerID));		
		return true;
	}

	@Override
	public Plan getCustomerPostPaidAccountPlanDetails(int customerID, long mobileNo)
			throws CustomerDetailsNotFoundException, PostpaidAccountNotFoundException, PlanDetailsNotFoundException {	
		
		return 	getPostPaidAccountDetails(customerID, mobileNo).getPlan();
	}

	@Override
	public List<Plan> getAllPlanDetails() {
		return planDao.findAll();
	}
}