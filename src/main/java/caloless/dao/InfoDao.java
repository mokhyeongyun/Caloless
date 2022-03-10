package caloless.dao;

import java.util.ArrayList;

import caloless.vo.InfoVO;

public class InfoDao extends DBConn {

    // 운동정보 등록
    public int insert(InfoVO vo) {
        int result = 0;
        String sql = "insert into tb_exer_info values(sequ_exer_info_einum.nextval,?,?,?,?,?,sysdate,null,null,?,'admin')";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getEiinout());
            pstmt.setDouble(2, vo.getEimet());
            pstmt.setString(3, vo.getEiadv());
            pstmt.setString(4, vo.getEiweak());
            pstmt.setString(5, vo.getEipre());
            pstmt.setString(6, vo.getEikind());

            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // 운동정보 리스트
    public ArrayList<InfoVO> select() {
        ArrayList<InfoVO> list = new ArrayList<InfoVO>();
        String sql = "select einum, eikind, eiinout from tb_exer_info order by einum";
        getPreparedStatement(sql);

        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                InfoVO vo = new InfoVO();
                vo.setEinum(rs.getInt(1));
                vo.setEikind(rs.getString(2));
                vo.setEiinout(rs.getString(3));

                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 운동정보 상세리스트
    public InfoVO select(int einum) {
        InfoVO vo = new InfoVO();
        String sql = "select eikind, eiinout, eikind, eimet, eiadv, eiweak, eipre from tb_exer_info where einum=?";
        getPreparedStatement(sql);

        try {
            pstmt.setInt(1, einum);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setEikind(rs.getString(1));
                vo.setEiinout(rs.getString(2));
                vo.setEikind(rs.getString(3));
                vo.setEimet(rs.getDouble(4));
                vo.setEiadv(rs.getString(5));
                vo.setEiweak(rs.getString(6));
                vo.setEipre(rs.getString(7));
                // vo.setEinum(rs.getInt(8));
            }
            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    // 운동정보 수정
    public int update(InfoVO vo, int einum) {
        int result = 0;
        String sql = "update tb_exer_info set eiinout=?, eimet=?, eiadv=?, eiweak=?, eipre=?, eikind=? where einum=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getEiinout());
            pstmt.setDouble(2, vo.getEimet());
            pstmt.setString(3, vo.getEiadv());
            pstmt.setString(4, vo.getEiweak());
            pstmt.setString(5, vo.getEipre());
            pstmt.setString(6, vo.getEikind());
            pstmt.setInt(7, einum);

            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // 운동정보 삭제
    public int delete(int einum) {
        int result = 0;
        String sql = "delete from tb_exer_info where einum=?";
        getPreparedStatement(sql);

        try {
            pstmt.setInt(1, einum);
            result = pstmt.executeUpdate();

            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    // 운동정보 검색
    public ArrayList<InfoVO> search() {
        ArrayList<InfoVO> list = new ArrayList<InfoVO>();
        String sql = "select einum, eikind, eiinout from tb_exer_info where eikind LIKE '%?%' order by einum";
        getPreparedStatement(sql);

        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                InfoVO vo = new InfoVO();
                vo.setEinum(rs.getInt(1));
                vo.setEikind(rs.getString(2));
                vo.setEiinout(rs.getString(3));

                list.add(vo);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
