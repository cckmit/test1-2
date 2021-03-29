package chn.bhmc.dms.par.pmm.vo;

import java.util.*;



import chn.bhmc.dms.core.datatype.SearchVO;

/**
 * 공급처별 부품판매가격 마스터 관리 검색 VO
 *
 * @ClassName   : PartsVenderSalPriceMasterListSearchVO.java
 * @Description : PartsVenderSalPriceMasterListSearchVO Class
 * @author Haegun Jung
 * @since 2018. 6. 11.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 6. 11.     Haegun Jung     최초 생성
 * </pre>
 */

public class PartsVenderSalPriceMasterListSearchVO extends SearchVO {

    /**
     * Statements
     * (long)serialVersionUID
     */
    private static final long serialVersionUID = -3371526599085643039L;

    private List<PartsVenderSalPriceMasterSearchVO> list;

    /**
     * @param list the list to set
     */
    public void setList(List<PartsVenderSalPriceMasterSearchVO> list) {
        this.list = list;
    }

    /**
     * @return the list
     */
    public List<PartsVenderSalPriceMasterSearchVO> getList() {
        return list;
    }

}
