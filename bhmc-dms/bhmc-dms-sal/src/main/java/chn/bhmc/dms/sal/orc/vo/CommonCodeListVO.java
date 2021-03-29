package chn.bhmc.dms.sal.orc.vo;

import java.util.List;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.sal.orm.vo.BtoCreateOrderEtcVO;
import chn.bhmc.dms.sal.veh.vo.VehicleSpecVO;

public class CommonCodeListVO extends BaseVO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6050693986020695590L;
	
	private long total = 0;
	
   /**
    * 订单综合现况订单类型实体类
    */
	private List<OrderStatusVO>  orderStatuslistVO;
	
	/**
	 * 订单综合现况订购状态实体类
	 */
	private List<OrderTypeVO>   orderTypeListVO;
	
	/**
	 * BTO订购状态信息
	 */
	private List<BtoOrdStatCdVO>  btoOrdStatCdListVO;

	/**
	 * 工厂信息实体类
	 */
	private List<VinmVlocVO> vinmVlocListVO ;
	/**
	 * 订单周期实体类
	 */
	private List<BtoCreateOrderEtcVO> ordYyMmPridInfoListVO;
	
	/**
	 * 车种实体类
	 */
	private List<VehicleSpecVO> CarLineCdInfoListVO;
	
	/**
	 * 查询数据
	 */
	private List<SumOrderCntVO> sumOrderCntListVO;
	
	/**
	 * 订单综合现况 --详情信息
	 */
	private List<SumOrderCntSubVO> sumOrderCntSubListVO;
	
	
	public List<OrderStatusVO> getOrderStatuslistVO() {
		return orderStatuslistVO;
	}

	public void setOrderStatuslistVO(List<OrderStatusVO> orderStatuslistVO) {
		this.orderStatuslistVO = orderStatuslistVO;
	}

	public List<OrderTypeVO> getOrderTypeListVO() {
		return orderTypeListVO;
	}

	public void setOrderTypeListVO(List<OrderTypeVO> orderTypeListVO) {
		this.orderTypeListVO = orderTypeListVO;
	}

	public List<BtoOrdStatCdVO> getBtoOrdStatCdListVO() {
		return btoOrdStatCdListVO;
	}

	public void setBtoOrdStatCdListVO(List<BtoOrdStatCdVO> btoOrdStatCdListVO) {
		this.btoOrdStatCdListVO = btoOrdStatCdListVO;
	}

	public List<VinmVlocVO> getVinmVlocListVO() {
		return vinmVlocListVO;
	}

	public void setVinmVlocListVO(List<VinmVlocVO> vinmVlocListVO) {
		this.vinmVlocListVO = vinmVlocListVO;
	}

	public List<BtoCreateOrderEtcVO> getOrdYyMmPridInfoListVO() {
		return ordYyMmPridInfoListVO;
	}

	public void setOrdYyMmPridInfoListVO(
			List<BtoCreateOrderEtcVO> ordYyMmPridInfoListVO) {
		this.ordYyMmPridInfoListVO = ordYyMmPridInfoListVO;
	}

	public List<VehicleSpecVO> getCarLineCdInfoListVO() {
		return CarLineCdInfoListVO;
	}

	public void setCarLineCdInfoListVO(List<VehicleSpecVO> carLineCdInfoListVO) {
		CarLineCdInfoListVO = carLineCdInfoListVO;
	}

	public List<SumOrderCntVO> getSumOrderCntListVO() {
		return sumOrderCntListVO;
	}

	public void setSumOrderCntListVO(List<SumOrderCntVO> sumOrderCntListVO) {
		this.sumOrderCntListVO = sumOrderCntListVO;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public List<SumOrderCntSubVO> getSumOrderCntSubListVO() {
		return sumOrderCntSubListVO;
	}

	public void setSumOrderCntSubListVO(List<SumOrderCntSubVO> sumOrderCntSubListVO) {
		this.sumOrderCntSubListVO = sumOrderCntSubListVO;
	}
	
	
}
