package caloless.dao;

import java.util.ArrayList;

import caloless.vo.ExerInfoVO;

public class ExerInfoDao extends DBConn {
    public ArrayList<ExerInfoVO> select() {// 운동기록지 출력
        ArrayList<ExerInfoVO> list = new ArrayList<ExerInfoVO>();
        String sql = "select einum, eiinout, eimet,eikind from tb_exer_info";
        getPreparedStatement(sql);
        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ExerInfoVO vo = new ExerInfoVO();
                vo.setEinum(rs.getInt(1));
                vo.setEiinout(rs.getString(2));
                vo.setEimet(rs.getInt(3));
                vo.setEikind(rs.getString(4));

                list.add(vo);
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
