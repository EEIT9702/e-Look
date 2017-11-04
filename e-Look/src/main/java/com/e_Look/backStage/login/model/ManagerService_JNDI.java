package com.e_Look.backStage.login.model;

public class ManagerService_JNDI {
private Manager_interface dao;

public ManagerService_JNDI() {
	dao=new ManagerDAO();
}

public ManagerVO findByManagerID(String managerID) {
	return dao.findByManagerID(managerID);
}


}
