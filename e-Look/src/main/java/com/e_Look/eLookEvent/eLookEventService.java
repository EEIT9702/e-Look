package com.e_Look.eLookEvent;

public class eLookEventService {
private eLookEvent_interface dao;
public eLookEventService() {
	dao=new eLookEventDAO();
}
public eLookEventVO addEmp(String eventName,java.sql.Date eStartDate, java.sql.Date eEndDate,
		Double discount) {

	eLookEventVO eLookEventVO = new eLookEventVO();

	eLookEventVO.setEventName(eventName);
	eLookEventVO.seteStartDate(eStartDate);
	eLookEventVO.seteEndDate(eEndDate);
	eLookEventVO.setDiscount(discount);
	dao.insert(eLookEventVO);

	return eLookEventVO;
}

}
