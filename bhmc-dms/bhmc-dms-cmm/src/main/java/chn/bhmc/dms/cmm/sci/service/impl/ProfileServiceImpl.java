package chn.bhmc.dms.cmm.sci.service.impl;

import java.net.InetAddress;
import java.util.List;

import javax.annotation.Resource;

import able.com.service.HService;

import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.sci.service.ProfileService;
import chn.bhmc.dms.cmm.sci.service.dao.ProfileDAO;
import chn.bhmc.dms.cmm.sci.vo.ProfileSearchVO;
import chn.bhmc.dms.cmm.sci.vo.ProfileVO;

/**
 * <pre>
 * Statements
 * </pre>
 *
 * @ClassName   : ProfileServiceImpl.java
 * @Description : 클래스 설명을 기술합니다.
 * @author Kwon Ki Hyun
 * @since 2016. 3. 29.
 * @version 1.0gv
 * @see
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2016. 3. 29.     Kwon Ki Hyun     최초 생성
 * </pre>
 */
@Service("profileService")
public class ProfileServiceImpl extends HService implements ProfileService{

    @Resource(name="profileDAO")
    ProfileDAO profileDAO;

    /**
     * 사전점검 내역 리스트 수 조회
     *
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectAliveCheckListByConditionCnt(ProfileSearchVO searchVO) throws Exception {

        return profileDAO.selectAliveCheckListByConditionCnt(searchVO);
    }

    /**
     * 사전점검 내역 리스트 조회
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public List<ProfileVO> selectAliveCheckListByCondition(ProfileSearchVO searchVO) throws Exception {

        return profileDAO.selectAliveCheckListByCondition(searchVO);
    }

    @Override
    public void pingSearch(ProfileVO profileVO) throws Exception{
        boolean connectionFlag = false;

        connectionFlag = pingCheck(profileVO.getIpNm());
        if(connectionFlag){
            profileVO.setContYn("Y");
        } else {
            profileVO.setContYn("N");
        }

        profileDAO.pingSearch(profileVO);
    }

    private boolean pingCheck(String url) throws Exception{
        //입력된 호스명으로 IP 어드레스를 던진다.
        InetAddress target = InetAddress.getByName(url);
        //주어진 밀리세컨드 내에 원격호스트에 접근 가능 하면 true, 아니면 false를 던진다.(밀리세컨드 (ms) = 1/1000초)
        return target.isReachable(1000);
    }
}
