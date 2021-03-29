package chn.bhmc.dms.sal.cmm.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import able.com.service.HService;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import chn.bhmc.dms.cmm.cmp.vo.DealerVO;
import chn.bhmc.dms.sal.cmm.service.SalesSQLService;
import chn.bhmc.dms.sal.cmm.service.dao.SalesSQLDAO;
import chn.bhmc.dms.sal.cmm.vo.SaleSQLViewVO;

/**
 * @ClassName   : SalesSQLServiceImpl
 * @Description : 판매 공통
 * @author KIM JINSUK
 * @since 2018. 01. 08.
 * @version 1.0
 * @Modification Information
 * <pre>
 *     since          author              description
 *  ===========    =============    ===========================
 *  2018. 01. 08.      KIM JINSUK            최초 생성
 * </pre>
 */

@Service("salesSQLService")
public class SalesSQLServiceImpl extends HService implements SalesSQLService {

    @Autowired
    SalesSQLDAO salesSQLDAO;

    /* 보안상 JSP단으로 안뺐음. */
    /*private String dlrIps[] = {
             개발

            "10.125.211.117"
            ,"10.125.211.115"


             운영 93개 딜러
            "172.25.0.11"
            ,"172.25.150.10"
            ,"172.25.1.10"
            ,"172.28.114.10"
            ,"172.25.71.10"
            ,"172.25.8.10"
            ,"172.25.9.10"
            ,"172.25.5.10"
            ,"172.25.7.10"
            ,"172.28.113.10"
            ,"172.25.6.10"
            ,"172.25.13.10"
            ,"172.25.27.10"
            ,"172.25.22.10"
            ,"172.25.31.10"
            ,"172.25.57.10"
            ,"172.25.49.10"
            ,"172.25.10.10"
            ,"172.25.48.10"
            ,"172.25.53.10"
            ,"172.25.15.10"
            ,"172.25.45.10"
            ,"172.25.55.10"
            ,"172.25.11.10"
            ,"172.25.46.10"
            ,"172.25.29.10"
            ,"172.25.24.10"
            ,"172.27.20.10"
            ,"172.25.102.10"
            ,"172.25.64.10"
            ,"172.25.85.10"
            ,"172.27.203.10"
            ,"172.29.103.10"
            ,"172.25.42.10"
            ,"172.25.30.10"
            ,"172.27.133.10"
            ,"172.25.75.10"
            ,"172.25.25.10"
            ,"172.25.18.10"
            ,"172.25.41.10"
            ,"172.25.67.10"
            ,"172.25.105.10"
            ,"172.25.50.10"
            ,"172.25.77.10"
            ,"172.25.225.10"
            ,"172.25.228.10"
            ,"172.25.211.10"
            ,"172.25.91.10"
            ,"172.25.149.10"
            ,"172.29.120.10"
            ,"172.25.104.10"
            ,"172.25.47.10"
            ,"172.25.51.10"
            ,"172.25.38.10"
            ,"172.25.12.10"
            ,"172.25.32.10"
            ,"172.25.40.10"
            ,"172.25.26.10"
            ,"172.25.54.10"
            ,"172.25.16.10"
            ,"172.25.212.10"
            ,"172.26.50.10"
            ,"172.25.66.10"
            ,"172.25.68.10"
            ,"172.25.95.10"
            ,"172.25.33.10"
            ,"172.25.35.10"
            ,"172.25.39.10"
            ,"172.25.19.10"
            ,"172.25.152.10"
            ,"172.25.21.10"
            ,"172.25.23.10"
            ,"172.25.14.10"
            ,"172.25.44.10"
            ,"172.25.146.10"
            ,"172.25.62.10"
            ,"172.25.81.10"
            ,"172.25.79.10"
            ,"172.25.170.10"
            ,"172.25.171.10"
            ,"172.25.227.10"
            ,"172.25.110.10"
            ,"172.25.131.10"
            ,"172.25.122.10"
            ,"172.25.121.10"
            ,"172.25.160.10"
            ,"172.25.191.10"
            ,"172.25.236.10"
            ,"172.25.235.10"
            ,"172.25.218.10"
            ,"172.25.148.10"
            ,"172.25.207.10"
            ,"172.25.217.10"
    };*/

    /////////////////////////////////////////////////////////////
    // select SQL 테스트
    ////////////////////////////////////////////////////////////
    @Override
    public Map<String, ArrayList<?>> callSendSQLRun(SaleSQLViewVO viewVO)throws Exception{

        HashMap<String, ArrayList<?>> resultMap = new HashMap<String, ArrayList<?>>();
        ArrayList<String> noIpList   = new ArrayList<String>();     // 접속안된 IP리스트
        ArrayList<String> columnList = new ArrayList<String>();     // 헤더 컬럼정보
        ArrayList<HashMap<String,String>> rList = null;

        ArrayList<HashMap<String,String>> dataList = new ArrayList<HashMap<String,String>>();

        List<DealerVO> dealerVOList = selectDealersByCondition(viewVO);

        int count = 1;
        for(DealerVO dealerVO : dealerVOList){
            System.out.println("## ip["+count+"] : "+ dealerVO.getDmsIpNm());

            // 최초 접속된 ip에서 컬럼헤더 정보만 받아온다.
            rList = runSQL(dealerVO.getDmsIpNm(), viewVO.getsSql(), columnList.size()==0?columnList:null);

            // 접속안된 리스트
            if(rList == null){
                noIpList.add(dealerVO.getDmsIpNm());
            }else{
                dataList.addAll(rList);
            }

            count++;
        }

        resultMap.put("NoConnectIp", noIpList);
        resultMap.put("ColumnList", columnList);
        resultMap.put("DataSet", dataList);

        System.out.println("### [ end ] ###");

        return resultMap;

    }

    // 해당 IP로 딜러 코드 받아오기.
    // 멀티 딜러 유/무 판정 후   --
    private ArrayList<HashMap<String,String>> selectSysOwnDlrCd(Statement stmt) throws Exception{
        ArrayList<HashMap<String,String>> dlrList = new ArrayList<HashMap<String,String>>();

        ResultSet rs = null;
        String sSql = "SELECT DLR_CD" +
                      "     , DLR_NM" +
                      "  FROM CM_0101T" +
                      " WHERE SYS_OWNER_YN = 'Y'";
        try {
            rs = stmt.executeQuery(sSql);

            HashMap<String, String> map = null;
            while (rs.next()) {
                map = new HashMap<String, String>();
                map.put("DLR_CD", rs.getString("DLR_CD"));
                map.put("DLR_NM", rs.getString("DLR_NM"));
                dlrList.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                // resultset 종료
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dlrList;
    }

    // 해당 IP로 딜러 코드 받아오기.
    // 멀티 딜러
    private ArrayList<HashMap<String,String>> selectSysMutiDlrCd(Statement stmt) throws Exception{
        ArrayList<HashMap<String,String>> dlrList = new ArrayList<HashMap<String,String>>();

        ResultSet rs = null;
        String sSql = "SELECT DLR_CD" +
                      "     , DLR_NM" +
                      "  FROM CM_0101T" +
                      " WHERE USE_CENTER_DMS_YN = 'Y'";
        try {
            rs = stmt.executeQuery(sSql);

            HashMap<String, String> map = null;
            while (rs.next()) {
                map = new HashMap<String, String>();
                map.put("DLR_CD", rs.getString("DLR_CD"));
                map.put("DLR_NM", rs.getString("DLR_NM"));
                dlrList.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return dlrList;
    }


    private ArrayList<HashMap<String,String>> selectSQL(Statement stmt, String dlrCd, String sSql, ArrayList<String> columnList){
        ArrayList<HashMap<String,String>> List = null;
        ResultSet rs = null;

        try {
            rs = stmt.executeQuery(sSql);

            ResultSetMetaData meta = rs.getMetaData();
            int cLength = meta.getColumnCount();  // 컬럼수

            String[] cols = new String[cLength];
            for(int i=0; i<cLength; i++){
                //cols[i] = meta.getColumnClassName(i+1);       //컬럼 형체크
                cols[i] = meta.getColumnName(i+1);              //컬럼명

                if(columnList != null){
                    columnList.add(cols[i]);
                }
            }

            HashMap<String, String> row = null;
            List = new ArrayList<HashMap<String,String>>();

            while (rs.next()) {
                row = new HashMap<String, String>();
                for (int i=0; i<cLength; i++) {
                    row.put(cols[i], rs.getString(i+1));

                }

                row.put("DLR_CD", dlrCd);

                List.add(row);
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                // resultset 종료
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return List;
    }



    public ArrayList<HashMap<String,String>> runSQL(String dbIP, String sSql, ArrayList<String> columnList){
       Connection conn = null;
       try{
           conn = dbConnection(dbIP);
       }catch(Exception e){
           //e.printStackTrace();
           System.out.println("#"+e.getMessage());
           return null;
       }

        Statement stmt = null;
        ArrayList<HashMap<String,String>> List = null;

        ArrayList<HashMap<String, String>> ownList = null;
        ArrayList<HashMap<String,String>> MultisResultList = null;
        try {
            stmt = conn.createStatement();

            ownList = selectSysOwnDlrCd(stmt);

            if(ownList.size() > 0){
                // 단일딜러.
                HashMap<String, String> ownMap = (HashMap<String, String>)ownList.get(0);
                List = selectSQL(stmt, (String)ownMap.get("DLR_CD"), sSql, columnList);
            }else{

                // 멀티딜러.
                MultisResultList = new ArrayList<HashMap<String,String>>();
                ArrayList<HashMap<String, String>>  MultiList = selectSysMutiDlrCd(stmt);

                for(HashMap<String, String> dlrMap  : MultiList){
                    List = selectSQL(stmt, (String)dlrMap.get("DLR_CD"), sSql, columnList);

                    if(List != null && List.size() > 0){
                        MultisResultList.addAll(List);
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // resultset 종료
                //rs.close();

                // Statement 종료
                stmt.close();
                // Connection 종료
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return ownList.size()>0?List:MultisResultList;
    }// run SQL 종료


    // DB 접속
    public Connection dbConnection(String dlrIP) throws Exception{
        Connection conn = null;

        String url = "jdbc:tibero:thin:@"+dlrIP+":8629:BHDMS";
        String user = "DMSDB";
        String password = "DMSDB_#01";

        // 1. Driver
        try {
            //Class.forName("oracle.jdbc.driver.OracleDriver");
            Class.forName("com.tmax.tibero.jdbc.TbDriver");

        // 2. Connection DB (URL, ID, P/W)
            conn = DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException e) {
            throw e;
        } catch (SQLException e) {
            throw e;
        }catch (Exception e) {
            throw e;
        }

        return conn;
    }

    // insert or update
    @Override
    public Map<String, ArrayList<?>> callSendUpdateSQL(SaleSQLViewVO viewVO)throws Exception{

        HashMap<String, ArrayList<?>> resultMap = new HashMap<String, ArrayList<?>>();
        ArrayList<String> noIpList   = new ArrayList<String>();     // 접속안된 IP리스트
        ArrayList<String> columnList = new ArrayList<String>();     // 헤더 컬럼정보
        columnList.add("DLR_CD");
        columnList.add("RESULT");

        ArrayList<HashMap<String,String>> dataList = new ArrayList<HashMap<String,String>>();

        String dbResult = "";
        HashMap<String,String> dlrMap = null;

        List<DealerVO> dealerVOList = selectDealersByCondition(viewVO);

        int count = 1;
        for(DealerVO dealerVO : dealerVOList){
            System.out.println("## ip["+count+"] : "+ dealerVO.getDmsIpNm());

            dbResult = runUpdateSQL(dealerVO.getDmsIpNm(), viewVO.getsSql());

            // 접속안된 리스트
            if(StringUtils.isBlank(dbResult)){
                noIpList.add(dealerVO.getDmsIpNm());
            }else{
                dlrMap = new HashMap<String,String>();
                dlrMap.put("DLR_CD", dealerVO.getDmsIpNm());
                dlrMap.put("RESULT", dbResult);
                dataList.add(dlrMap);
            }
            count++;
        }
        resultMap.put("NoConnectIp", noIpList);
        resultMap.put("ColumnList", columnList);
        resultMap.put("DataSet", dataList);

        return resultMap;
    }


    private String runUpdateSQL(String dbIP, String sSql){
        Connection conn = null;
        try{
            conn = dbConnection(dbIP);
        }catch(Exception e){
            System.out.println("#"+e.getMessage());
            return null;
        }

        int rs = -1;
        Statement stmt = null;

        try {
            stmt = conn.createStatement();

            rs = stmt.executeUpdate(sSql);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // Statement 종료
                stmt.close();
                // Connection 종료
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        System.out.println("# UPDATE RESULT END : "+ rs);


        return String.valueOf(rs);
    }

    // 특수문자 컴버젼
    /*
    private String  cconvertEscape(String rs){
        String result = "";
        StringUtils.isEmpty(cs);
        return rs.replaceAll("(", "_");

    }
    */

    /**
     * 에러 처리
     */
    @Override
    public void setException(String msgKey, String[] msgKey2)throws Exception{
        throw processException(msgKey, msgKey2);
    }

    public List<DealerVO> selectDealersByCondition(SaleSQLViewVO viewVO) throws Exception{
        return salesSQLDAO.selectDealersByCondition(viewVO);
    }

}