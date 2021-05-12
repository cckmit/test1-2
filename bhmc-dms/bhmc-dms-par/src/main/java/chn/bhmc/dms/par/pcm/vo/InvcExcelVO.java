package chn.bhmc.dms.par.pcm.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;

import chn.bhmc.dms.core.datatype.BaseVO;
import chn.bhmc.dms.core.support.databind.JsonDateDeserializer;
import chn.bhmc.dms.core.web.bind.annotation.ValidDescriptor;
import chn.bhmc.dms.core.web.bind.annotation.ValidField;
@ValidDescriptor({
    @ValidField(field="dlrCd", mesgKey="par.lbl.dlrCd")
    ,@ValidField(field="invcDocNo", mesgKey="par.lbl.invcDocNo")
    ,@ValidField(field="invcTp", mesgKey="par.lbl.invcTp")
    ,@ValidField(field="invcDstinCd", mesgKey="par.lbl.invcDstinCd")
    ,@ValidField(field="invcStatCd", mesgKey="par.lbl.invcStatCd")
    ,@ValidField(field="invcDt", mesgKey="par.lbl.invcDt")
    ,@ValidField(field="arrvDt", mesgKey="par.lbl.arrvDt")
    ,@ValidField(field="confirmDt", mesgKey="par.lbl.confirmDt")
    ,@ValidField(field="pltCd", mesgKey="par.lbl.pltCd")
    ,@ValidField(field="bpCd", mesgKey="par.lbl.bpCd")
    ,@ValidField(field="mobisInvcNo", mesgKey="par.lbl.mobisInvcNo")
    ,@ValidField(field="currCd", mesgKey="par.lbl.currency")
    ,@ValidField(field="invcTotAmt", mesgKey="par.lbl.invcTotAmt")
    ,@ValidField(field="vatCd", mesgKey="par.lbl.vatCd")
    ,@ValidField(field="vatAmt", mesgKey="par.lbl.vatAmt")
    ,@ValidField(field="remark", mesgKey="par.lbl.remark")
    ,@ValidField(field="cancYn", mesgKey="par.lbl.cancYn")
})
public class InvcExcelVO extends BaseVO{
	
	 /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -2828539812288053295L;

    /**
     * 저장 성공실패 여부
     **/
    private boolean resultYn;

    /**
     * 딜러코드
     **/
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    private String invcDocNo;

    /**
     * 입고문서번호
     **/
    private String grDocNo;

    /**
     * 입고문서 업무구분
     */
    private String grDocTp;

    /**
     * 송장유형
     **/
    private String invcTp;

    /**
     * 송장구분코드
     **/
    private String invcDstinCd;

    /**
     * 송장상태코드
     **/
    private String invcStatCd;

    /**
     * 운송유형
     **/
    private String trsfTp;

    /**
     * 공급처유형
     **/
    private String bpTp;

    /**
     * 송장일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 도착일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 도착일자CHAR
     **/
    private String arrvDtChar;

    /**
     * 도착일자 시간CHAR
     **/
    private String arrvTmChar;

    /**
     * 등록일자CHAR
     **/
    private String regDtChar;

    /**
     * 확정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date confirmDt;

    /**
     * 입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcGrDt;

    /**
     * 센터코드
     **/
    private String pltCd;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 통화코드
     **/
    private String currCd;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 전송금액
     **/
    private Double trsfAmt;

    /**
     * 보험비
     **/
    private Double incAmt;

    /**
     * 부가세코드
     **/
    private String vatCd;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 비고
     **/
    private String remark;

    /**
     * 취소여부
     **/
    private String cancYn;

    /**
     * 인터페이스여부
     **/
    private String ifYn;

    /**
     * 부품건수
     **/
    private Double itemCnt;

    /**
     * 세금포함 구매금액
     **/
    private Double purcIncTaxAmt;

    /**
     * 구매금액
     **/
    private Double purcAmt;

    /**
     * 부품수량
     **/
    private Double itemQty;

    /**
     * out box count
     **/
    private Double invcCseCnt;

    /**
     * out box CBM
     **/
    private Double invcCbm;

    /**
     * total line no
     **/
    private Double invcTotalLine;

    /**
     * transporter code(물류회사)
     **/
    private String invcTspCode;

    /**
     * TR NO
     **/
    private String invcGcnBlNo;

    /**
     * truck no
     **/
    private String invcTnCnNo;


    /**
     * Invoice Quantity
     **/
    private Double invcSumQt;

    /**
     * 송장 부가세 제외 금액
     **/
    private Double invcAmtCur;

    /**
     * 입고수량
     **/
    private Double grTotQty;

    /**
     * 클레임수량
     **/
    private Double claimTotQty;

    /**
     * 입고금액
     **/
    private Double grIncTaxAmt;

    /**
     * 입고금액(부가세 제외)
     **/
    private Double grAmt;

    /**
     * 입고총금액
     **/
    private Double grTotIncTaxAmt;

    /**
     * 입고총금액(부가세 제외)
     **/
    private Double grTotAmt;

    /**
     * 할인율
     **/
    private Double dcRate;


    /**
     * 구매신청자
     **/
    private String regUsrId;

    /**
     * 구매신청자명
     **/
    private String regUsrNm;

    /**
     * 수정일시(UPDATE시 가능여부 체크용)
     **/
    private String updtDtStr;
    
    
    
    //子表信息
    
    /**
     * 딜러코드
     **/
    @NotEmpty
    private String dlrCd;

    /**
     * 송장문서번호
     **/
    @NotEmpty
    private String invcDocNo;

    /**
     * 송장문서라인번호
     **/
    @NotEmpty
    private int invcDocLineNo;

    /**
     * 모비스송장번호
     **/
    private String mobisInvcNo;

    /**
     * 모비스송장라인번호
     **/
    private int mobisInvcLineNo;

    /**
     * 구매오더유형
     **/
    private String purcOrdTp;

    /**
     * 구매오더번호
     **/
    private String purcOrdNo;

    /**
     * 구매오더라인번호
     **/
    private String purcOrdLineNo;

    /**
     * I/F 구매오더번호
     **/
    private String invcIfOrdNo;

    /**
     * I/F 구매오더라인번호
     **/
    private String invcIfOrdLn;

    /**
     * 구매오더라인구분자
     **/
    private String purcOrdLineDetlNo;

    /**
     * 품목코드
     **/
    private String itemCd;

    /**
     * 품목명
     **/
    private String itemNm;

    /**
     * 가격유형
     **/
    private String prcTp;

    /**
     * 송장대상수량
     **/
    private Double invcTargetQty;

    /**
     * 송장수량
     **/
    private Double invcQty;

    /**
     * 구매수량
     **/
    private Double purcQty;

    /**
     * 엑셀업로드수량
     **/
    private String excelQty;

    /**
     * 엑셀업로드단가
     **/
    private String excelPrc;

    /**
     * 엑셀업로드세전단가
     **/
    private String excelTaxDdctPrc;

    /**
     * 엑셀창고코드
     **/
    private String excelStrgeCd;

    /**
     * 엑셀창고이름
     **/
    private String excelStrgeNm;

    /**
     * 송장원본수량(구매수량)
     **/
    private Double invcQtyOrg;

    /**
     * 송장단위코드
     **/
    private String invcUnitCd;

    /**
     * 공급상
     **/
    private String spyrCd;

    /**
     * 송장단가
     **/
    private Double invcPrc;

    /**
     * 세금공제단가
     **/
    private Double taxDdctPrc;

    /**
     * 할인율
     **/
    private Double dcRate;

    /**
     * 송장단가(세액포함)
     **/
    private Double invcIncTaxPrc;

    /**
     * 송장금액
     **/
    private Double invcAmt;

    /**
     * 부가세금액
     **/
    private Double vatAmt;

    /**
     * 송장총금액
     **/
    private Double invcTotAmt;

    /**
     * 입고총금액
     **/
    private Double grTotAmt;

    /**
     * 입고총금액(세금제외)
     **/
    private Double grTaxDdctAmt;

    /**
     * 세금
     **/
    private Double taxAmt;

    /**
     * 차변대변구분코드
     **/
    private String debitCreditDstinCd;

    /**
     * 참조송장문서번호
     **/
    private String refInvcDocNo;

    /**
     * 참조송장문서라인번호
     **/
    private int refInvcDocLineNo;

    /**
     * 도착예정일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date arrvDt;

    /**
     * 송장입고일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcGrDt;

    /**
     * INVOICE일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date invcDt;

    /**
     * 구매신청일자
     **/
    @JsonDeserialize(using=JsonDateDeserializer.class)
    private Date purcRegDt;

    /**
     * 배송PDC코드
     **/
    private String dlPdcCd;

    /**
     * 입고창고코드
     **/
    private String grStrgeCd;

    /**
     * 입고창고명
     **/
    private String grStrgeNm;

    /**
     * 입고Location
     **/
    private String grLocCd;

    /**
     * 입고Location명
     **/
    private String grLocNm;

    /**
     * 입고수량
     **/
    private Double grQty;

    /**
     * 거래처코드
     **/
    private String bpCd;

    /**
     * 거래처명
     **/
    private String bpNm;

    /**
     * 구매신청자
     **/
    private String ordRegUsrId;

    /**
     * 구매신청자명
     **/
    private String ordRegUsrNm;

    /**
     * 결품신청자
     **/
    private String reqUsrId;

    /**
     * 결품신청자명
     **/
    private String reqUsrNm;

    /**
     * 클레임대상코드
     **/
    private String claimTargCd;

    /**
     * 배송거래처코드
     **/
    private String dlBpCd;

    /**
     * 배송거래처명
     **/
    private String dlBpNm;

    /**
     * 클레임유형
     **/
    private String claimTp;

    /**
     * 송장유형
     **/
    private String invcTp;

    /**
     * 송장상태
     **/
    private String invcStatCd;

    /**
     * 기 클레임수량
     **/
    private Double prevClaimQty;

    /**
     * 클레임수량
     **/
    private Double claimQty;

    /**
     * 차이수량
     **/
    private Double compareQty;

    /**
     * 요청내용
     **/
    private String reqCont;

    /**
     * 문서파일번호
     **/
    private String docFileNo;

    /**
     * 입고완료여부
     */
    private String grEndYn;

    /**
     * BOX번호
     */
    private String boxNo;

    /**
     * BMP구매번호
     */
    private String bmpOrdNo;

    /**
     * BMP구매라인번호
     */
    private String bmpOrdLineNo;

    /**
     * 구매단가
     **/
    private Double purcPrc;

    /**
     * 구매금액
     **/
    private Double purcAmt;

    /**
     * 실구매요청수량
     **/
    private Double purcReqQty;

    /**
     * 가용재고
     **/
    private Double avlbStockQty;

    /**
     * 예약수량
     **/
    private Double resvStockQty;

    /**
     * 재고수량
     **/
    private Double stockQty;

    /**
     * 차입수량
     **/
    private Double borrowQty;

    /**
     * 대여수량
     **/
    private Double rentQty;

    /**
     * 수불문서년월
     **/
    private String mvtDocYyMm;

    /**
     * 수불문서번호
     **/
    private String mvtDocNo;

    /**
     * 수불문서라인번호
     **/
    private int mvtDocLineNo;
    
    
    
    
    
    
    
    
    
    
    

    /**
     * @return the dlrCd
     */
    public String getDlrCd() {
        return dlrCd;
    }

    /**
     * @param dlrCd the dlrCd to set
     */
    public void setDlrCd(String dlrCd) {
        this.dlrCd = dlrCd;
    }

    /**
     * @return the invcDocNo
     */
    public String getInvcDocNo() {
        return invcDocNo;
    }

    /**
     * @param invcDocNo the invcDocNo to set
     */
    public void setInvcDocNo(String invcDocNo) {
        this.invcDocNo = invcDocNo;
    }

    /**
     * @return the invcTp
     */
    public String getInvcTp() {
        return invcTp;
    }

    /**
     * @param invcTp the invcTp to set
     */
    public void setInvcTp(String invcTp) {
        this.invcTp = invcTp;
    }

    /**
     * @return the invcDstinCd
     */
    public String getInvcDstinCd() {
        return invcDstinCd;
    }

    /**
     * @param invcDstinCd the invcDstinCd to set
     */
    public void setInvcDstinCd(String invcDstinCd) {
        this.invcDstinCd = invcDstinCd;
    }

    /**
     * @return the invcStatCd
     */
    public String getInvcStatCd() {
        return invcStatCd;
    }

    /**
     * @param invcStatCd the invcStatCd to set
     */
    public void setInvcStatCd(String invcStatCd) {
        this.invcStatCd = invcStatCd;
    }

    /**
     * @return the invcDt
     */
    public Date getInvcDt() {
        return invcDt;
    }

    /**
     * @param invcDt the invcDt to set
     */
    public void setInvcDt(Date invcDt) {
        this.invcDt = invcDt;
    }

    /**
     * @return the arrvDt
     */
    public Date getArrvDt() {
        return arrvDt;
    }

    /**
     * @param arrvDt the arrvDt to set
     */
    public void setArrvDt(Date arrvDt) {
        this.arrvDt = arrvDt;
    }

    /**
     * @return the confirmDt
     */
    public Date getConfirmDt() {
        return confirmDt;
    }

    /**
     * @param confirmDt the confirmDt to set
     */
    public void setConfirmDt(Date confirmDt) {
        this.confirmDt = confirmDt;
    }

    /**
     * @return the pltCd
     */
    public String getPltCd() {
        return pltCd;
    }

    /**
     * @param pltCd the pltCd to set
     */
    public void setPltCd(String pltCd) {
        this.pltCd = pltCd;
    }

    /**
     * @return the bpCd
     */
    public String getBpCd() {
        return bpCd;
    }

    /**
     * @param bpCd the bpCd to set
     */
    public void setBpCd(String bpCd) {
        this.bpCd = bpCd;
    }

    /**
     * @return the bpNm
     */
    public String getBpNm() {
        return bpNm;
    }

    /**
     * @param bpNm the bpNm to set
     */
    public void setBpNm(String bpNm) {
        this.bpNm = bpNm;
    }

    /**
     * @return the regUsrId
     */
    public String getRegUsrId() {
        return regUsrId;
    }

    /**
     * @param regUsrId the regUsrId to set
     */
    public void setRegUsrId(String regUsrId) {
        this.regUsrId = regUsrId;
    }

    /**
     * @return the regUsrNm
     */
    public String getRegUsrNm() {
        return regUsrNm;
    }

    /**
     * @param regUsrNm the regUsrNm to set
     */
    public void setRegUsrNm(String regUsrNm) {
        this.regUsrNm = regUsrNm;
    }

    /**
     * @return the mobisInvcNo
     */
    public String getMobisInvcNo() {
        return mobisInvcNo;
    }

    /**
     * @param mobisInvcNo the mobisInvcNo to set
     */
    public void setMobisInvcNo(String mobisInvcNo) {
        this.mobisInvcNo = mobisInvcNo;
    }

    /**
     * @return the currCd
     */
    public String getCurrCd() {
        return currCd;
    }

    /**
     * @param currCd the currCd to set
     */
    public void setCurrCd(String currCd) {
        this.currCd = currCd;
    }

    /**
     * @return the invcTotAmt
     */
    public Double getInvcTotAmt() {
        return invcTotAmt;
    }

    /**
     * @param invcTotAmt the invcTotAmt to set
     */
    public void setInvcTotAmt(Double invcTotAmt) {
        this.invcTotAmt = invcTotAmt;
    }

    /**
     * @return the vatCd
     */
    public String getVatCd() {
        return vatCd;
    }

    /**
     * @param vatCd the vatCd to set
     */
    public void setVatCd(String vatCd) {
        this.vatCd = vatCd;
    }

    /**
     * @return the vatAmt
     */
    public Double getVatAmt() {
        return vatAmt;
    }

    /**
     * @param vatAmt the vatAmt to set
     */
    public void setVatAmt(Double vatAmt) {
        this.vatAmt = vatAmt;
    }

    /**
     * @return the remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * @return the cancYn
     */
    public String getCancYn() {
        return cancYn;
    }

    /**
     * @param cancYn the cancYn to set
     */
    public void setCancYn(String cancYn) {
        this.cancYn = cancYn;
    }

    /**
     * @return the resultYn
     */
    public boolean isResultYn() {
        return resultYn;
    }

    /**
     * @param resultYn the resultYn to set
     */
    public void setResultYn(boolean resultYn) {
        this.resultYn = resultYn;
    }

    /**
     * @param ifYn the ifYn to set
     */
    public void setIfYn(String ifYn) {
        this.ifYn = ifYn;
    }

    /**
     * @return the purcOrdNo
     */
    public String getPurcOrdNo() {
        return purcOrdNo;
    }

    /**
     * @param purcOrdNo the purcOrdNo to set
     */
    public void setPurcOrdNo(String purcOrdNo) {
        this.purcOrdNo = purcOrdNo;
    }

    /**
     * @return the itemCnt
     */
    public Double getItemCnt() {
        return itemCnt;
    }

    /**
     * @param itemCnt the itemCnt to set
     */
    public void setItemCnt(Double itemCnt) {
        this.itemCnt = itemCnt;
    }

    /**
     * @return the itemQty
     */
    public Double getItemQty() {
        return itemQty;
    }

    /**
     * @param itemQty the itemQty to set
     */
    public void setItemQty(Double itemQty) {
        this.itemQty = itemQty;
    }

    /**
     * @return the ifYn
     */
    public String getIfYn() {
        return ifYn;
    }

    /**
     * @return the purcIncTaxAmt
     */
    public Double getPurcIncTaxAmt() {
        return purcIncTaxAmt;
    }

    /**
     * @param purcIncTaxAmt the purcIncTaxAmt to set
     */
    public void setPurcIncTaxAmt(Double purcIncTaxAmt) {
        this.purcIncTaxAmt = purcIncTaxAmt;
    }

    /**
     * @return the purcAmt
     */
    public Double getPurcAmt() {
        return purcAmt;
    }

    /**
     * @param purcAmt the purcAmt to set
     */
    public void setPurcAmt(Double purcAmt) {
        this.purcAmt = purcAmt;
    }

    /**
     * @return the invcCseCnt
     */
    public Double getInvcCseCnt() {
        return invcCseCnt;
    }

    /**
     * @param invcCseCnt the invcCseCnt to set
     */
    public void setInvcCseCnt(Double invcCseCnt) {
        this.invcCseCnt = invcCseCnt;
    }

    /**
     * @return the invcCbm
     */
    public Double getInvcCbm() {
        return invcCbm;
    }

    /**
     * @param invcCbm the invcCbm to set
     */
    public void setInvcCbm(Double invcCbm) {
        this.invcCbm = invcCbm;
    }

    /**
     * @return the invcTotalLine
     */
    public Double getInvcTotalLine() {
        return invcTotalLine;
    }

    /**
     * @param invcTotalLine the invcTotalLine to set
     */
    public void setInvcTotalLine(Double invcTotalLine) {
        this.invcTotalLine = invcTotalLine;
    }

    /**
     * @return the invcTspCode
     */
    public String getInvcTspCode() {
        return invcTspCode;
    }

    /**
     * @param invcTspCode the invcTspCode to set
     */
    public void setInvcTspCode(String invcTspCode) {
        this.invcTspCode = invcTspCode;
    }

    /**
     * @return the invcGcnBlNo
     */
    public String getInvcGcnBlNo() {
        return invcGcnBlNo;
    }

    /**
     * @param invcGcnBlNo the invcGcnBlNo to set
     */
    public void setInvcGcnBlNo(String invcGcnBlNo) {
        this.invcGcnBlNo = invcGcnBlNo;
    }

    /**
     * @return the invcTnCnNo
     */
    public String getInvcTnCnNo() {
        return invcTnCnNo;
    }

    /**
     * @param invcTnCnNo the invcTnCnNo to set
     */
    public void setInvcTnCnNo(String invcTnCnNo) {
        this.invcTnCnNo = invcTnCnNo;
    }

    /**
     * @return the invcSumQt
     */
    public Double getInvcSumQt() {
        return invcSumQt;
    }

    /**
     * @param invcSumQt the invcSumQt to set
     */
    public void setInvcSumQt(Double invcSumQt) {
        this.invcSumQt = invcSumQt;
    }

    /**
     * @return the invcAmtCur
     */
    public Double getInvcAmtCur() {
        return invcAmtCur;
    }

    /**
     * @param invcAmtCur the invcAmtCur to set
     */
    public void setInvcAmtCur(Double invcAmtCur) {
        this.invcAmtCur = invcAmtCur;
    }

    /**
     * @return the invcGrDt
     */
    public Date getInvcGrDt() {
        return invcGrDt;
    }

    /**
     * @param invcGrDt the invcGrDt to set
     */
    public void setInvcGrDt(Date invcGrDt) {
        this.invcGrDt = invcGrDt;
    }

    /**
     * @return the grTotIncTaxAmt
     */
    public Double getGrTotIncTaxAmt() {
        return grTotIncTaxAmt;
    }

    /**
     * @param grTotIncTaxAmt the grTotIncTaxAmt to set
     */
    public void setGrTotIncTaxAmt(Double grTotIncTaxAmt) {
        this.grTotIncTaxAmt = grTotIncTaxAmt;
    }

    /**
     * @return the grTotAmt
     */
    public Double getGrTotAmt() {
        return grTotAmt;
    }

    /**
     * @param grTotAmt the grTotAmt to set
     */
    public void setGrTotAmt(Double grTotAmt) {
        this.grTotAmt = grTotAmt;
    }

    /**
     * @return the grIncTaxAmt
     */
    public Double getGrIncTaxAmt() {
        return grIncTaxAmt;
    }

    /**
     * @param grIncTaxAmt the grIncTaxAmt to set
     */
    public void setGrIncTaxAmt(Double grIncTaxAmt) {
        this.grIncTaxAmt = grIncTaxAmt;
    }

    /**
     * @return the grAmt
     */
    public Double getGrAmt() {
        return grAmt;
    }

    /**
     * @param grAmt the grAmt to set
     */
    public void setGrAmt(Double grAmt) {
        this.grAmt = grAmt;
    }

    /**
     * @return the arrvDtChar
     */
    public String getArrvDtChar() {
        return arrvDtChar;
    }

    /**
     * @param arrvDtChar the arrvDtChar to set
     */
    public void setArrvDtChar(String arrvDtChar) {
        this.arrvDtChar = arrvDtChar;
    }

    /**
     * @return the arrvTmChar
     */
    public String getArrvTmChar() {
        return arrvTmChar;
    }

    /**
     * @param arrvTmChar the arrvTmChar to set
     */
    public void setArrvTmChar(String arrvTmChar) {
        this.arrvTmChar = arrvTmChar;
    }

    /**
     * @return the regDtChar
     */
    public String getRegDtChar() {
        return regDtChar;
    }

    /**
     * @param regDtChar the regDtChar to set
     */
    public void setRegDtChar(String regDtChar) {
        this.regDtChar = regDtChar;
    }

    /**
     * @return the dcRate
     */
    public Double getDcRate() {
        return dcRate;
    }

    /**
     * @param dcRate the dcRate to set
     */
    public void setDcRate(Double dcRate) {
        this.dcRate = dcRate;
    }

    /**
     * @return the grDocNo
     */
    public String getGrDocNo() {
        return grDocNo;
    }

    /**
     * @param grDocNo the grDocNo to set
     */
    public void setGrDocNo(String grDocNo) {
        this.grDocNo = grDocNo;
    }


    /**
     * @return the grDocTp
     */
    public String getGrDocTp() {
        return grDocTp;
    }

    /**
     * @param grDocTp the grDocTp to set
     */
    public void setGrDocTp(String grDocTp) {
        this.grDocTp = grDocTp;
    }

    /**
     * @return the grTotQty
     */
    public Double getGrTotQty() {
        return grTotQty;
    }

    /**
     * @param grTotQty the grTotQty to set
     */
    public void setGrTotQty(Double grTotQty) {
        this.grTotQty = grTotQty;
    }

    /**
     * @return the claimTotQty
     */
    public Double getClaimTotQty() {
        return claimTotQty;
    }

    /**
     * @param claimTotQty the claimTotQty to set
     */
    public void setClaimTotQty(Double claimTotQty) {
        this.claimTotQty = claimTotQty;
    }

    /**
     * @return the trsfAmt
     */
    public Double getTrsfAmt() {
        return trsfAmt;
    }

    /**
     * @param trsfAmt the trsfAmt to set
     */
    public void setTrsfAmt(Double trsfAmt) {
        this.trsfAmt = trsfAmt;
    }

    /**
     * @return the incAmt
     */
    public Double getIncAmt() {
        return incAmt;
    }

    /**
     * @param incAmt the incAmt to set
     */
    public void setIncAmt(Double incAmt) {
        this.incAmt = incAmt;
    }

    /**
     * @return the trsfTp
     */
    public String getTrsfTp() {
        return trsfTp;
    }

    /**
     * @param trsfTp the trsfTp to set
     */
    public void setTrsfTp(String trsfTp) {
        this.trsfTp = trsfTp;
    }

    /**
     * @return the bpTp
     */
    public String getBpTp() {
        return bpTp;
    }

    /**
     * @param bpTp the bpTp to set
     */
    public void setBpTp(String bpTp) {
        this.bpTp = bpTp;
    }

    /**
     * @return the updtDtStr
     */
    public String getUpdtDtStr() {
        return updtDtStr;
    }

    /**
     * @param updtDtStr the updtDtStr to set
     */
    public void setUpdtDtStr(String updtDtStr) {
        this.updtDtStr = updtDtStr;
    }

}
