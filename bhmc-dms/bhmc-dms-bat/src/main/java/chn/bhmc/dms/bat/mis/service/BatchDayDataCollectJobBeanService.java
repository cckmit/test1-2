package chn.bhmc.dms.bat.mis.service;

/**
 * <pre>
 * [BatchJob] 고객정보(MS_1004T_2016)
 * </pre>
 *
 * @ClassName   : BatchDayCrmStatusJobService.java
 * @Description : [BatchJob] 고객정보(MS_1004T_2016)
 * @author chibeom.song
 * @since 2016. 9. 25.
 * @version 1.0
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 9. 25.   chibeom.song     최초 생성
 * </pre>
 */

public interface BatchDayDataCollectJobBeanService {

    /**
     * [BatchJob] 고객정보(MS_1004T)
     * @param null
     * @return Count
     */
    public int selectDayDataCollectJob() throws Exception;
    //public int selectCrmStatusJob() throws Exception;

}
