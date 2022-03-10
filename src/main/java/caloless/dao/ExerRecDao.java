package caloless.dao;

import java.util.ArrayList;

import caloless.vo.ExerRecVO;

public class ExerRecDao extends DBConn {

    public ArrayList<ExerRecVO> select() {// 운동기록지 출력
        ArrayList<ExerRecVO> list = new ArrayList<ExerRecVO>();
        String sql = "SELECT EIINOUT, EIKIND, EIMET, ERTIME, UWEIGHT, TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS') ERDATE, ERYEAR, ERMONTH, ERDAY "
                + " FROM TB_USER, TB_EXER_REC, TB_EXER_INFO "
                + " WHERE TB_USER.USERID = TB_EXER_REC.USERID AND TB_EXER_REC.EINUM = TB_EXER_INFO.EINUM";
        getPreparedStatement(sql);
        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ExerRecVO vo = new ExerRecVO();
                vo.setInout(rs.getString(1));
                vo.setKind(rs.getString(2));
                vo.setEimet(rs.getInt(3));
                vo.setErtime(rs.getInt(4));
                vo.setUweight(rs.getInt(5));
                vo.setErdate(rs.getString(6));
                vo.setEryear(rs.getInt(7));
                vo.setErmonth(rs.getInt(8));
                vo.setErday(rs.getInt(9));
                list.add(vo);
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /************ 운동기록지 출력 id 받기 **************/
    public ArrayList<ExerRecVO> select(String userid) {// 운동기록지 출력 id 받기
        ArrayList<ExerRecVO> list = new ArrayList<ExerRecVO>();
        String sql = "select eiinout, eikind, eimet, ertime, TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS') ERDATE , ERYEAR, ERMONTH, ERDAY "
                + " from tb_exer_rec ter,tb_exer_info tei "
                + " where ter.einum=tei.einum and ter.userid=? order by eryear desc , ermonth desc, erday desc";
        getPreparedStatement(sql);
        try {
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ExerRecVO vo = new ExerRecVO();
                vo.setInout(rs.getString(1));
                vo.setKind(rs.getString(2));
                vo.setEimet(rs.getInt(3));
                vo.setErtime(rs.getInt(4));
                vo.setErdate(rs.getString(5));
                vo.setEryear(rs.getInt(6));
                vo.setErmonth(rs.getInt(7));
                vo.setErday(rs.getInt(8));
                list.add(vo);
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    /************ 운동기록지 수정 id, 등록날짜 받고 뿌리기 **************/
    public ExerRecVO select(String userid, String erdate) {// 운동기록지 상세보기 id 날짜 받기
        ExerRecVO vo = new ExerRecVO();
        String sql = "SELECT EIINOUT, EIKIND, EIMET, ERTIME, TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS') ERDATE, ERYEAR, ERMONTH, ERDAY, tei.einum "
                + " FROM TB_EXER_REC ter, TB_EXER_INFO tei "
                + " WHERE ?= ter.USERID  AND  TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS')=?  AND ter.EINUM = tei.EINUM";
        getPreparedStatement(sql);
        try {
            pstmt.setString(1, userid);
            pstmt.setString(2, erdate);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setInout(rs.getString(1));
                vo.setKind(rs.getString(2));
                vo.setEimet(rs.getInt(3));
                vo.setErtime(rs.getInt(4));
                vo.setErdate(rs.getString(5));
                vo.setEryear(rs.getInt(6));
                vo.setErmonth(rs.getInt(7));
                vo.setErday(rs.getInt(8));
                vo.setEinum(rs.getInt(9));
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    /************** 운동기록지 등록(insert) ***************/
    public int insert(ExerRecVO vo) {
        int result = 0;
        String sql = "INSERT INTO tb_exer_rec VALUES(sysdate,?,?,?,?,?,?,null,null)";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getUserid());
            pstmt.setInt(2, vo.getEinum());
            pstmt.setInt(3, vo.getErtime2());
            pstmt.setInt(4, vo.getEryear());
            pstmt.setInt(5, vo.getErmonth());
            pstmt.setInt(6, vo.getErday());

            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public int update(ExerRecVO vo) {
        int result = 0;
        String sql = "update tb_exer_rec set einum=?, ertime=? where userid=? and TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS')=?";
        getPreparedStatement(sql);
        try {
            pstmt.setInt(1, vo.getEinum());
            pstmt.setInt(2, vo.getErtime2());
            pstmt.setString(3, vo.getUserid());
            pstmt.setString(4, vo.getErdate());

            result = pstmt.executeUpdate();

            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("result =" + result);
        return result;
    }

    public int delete(String userid, String erdate) {
        int result = 0;
        String sql = "delete from tb_exer_rec where TO_CHAR(ERDATE,'YYYY-MM-DD/HH:MI:SS')=? and userid=?";

        getPreparedStatement(sql);
        try {
            pstmt.setString(1, erdate);
            pstmt.setString(2, userid);
            result = pstmt.executeUpdate();

            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
