package caloless.dao;

import caloless.vo.UserVO;

public class UserDao extends DBConn {
    /* 해당유저 select */
    public UserVO select(String userid) {// 운동기록지 출력
        UserVO vo = new UserVO();
        String sql = "select userid, upw, uname, uage, uemail, ugender, uheight, uweight, ugrade "
                + " from tb_user where userid=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, userid);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setUserid(rs.getString(1));
                vo.setUpw(rs.getString(2));
                vo.setUname(rs.getString(3));
                vo.setUage(rs.getInt(4));
                vo.setUemail(rs.getString(5));
                vo.setUgender(rs.getString(6));
                vo.setUheight(rs.getInt(7));
                vo.setUweight(rs.getInt(8));
                vo.setUgrade(rs.getString(9));
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    /** 유저 회원가입 **/
    public int insert(UserVO vo) {
        int result = 0;
        String sql = "insert into tb_user values(?,?,?,?,?,?,?,?,'user')";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getUserid());
            pstmt.setString(2, vo.getUpw());
            pstmt.setString(3, vo.getUname());
            pstmt.setInt(4, vo.getUage());
            pstmt.setString(5, vo.getUemail());
            pstmt.setString(6, vo.getUgender());
            pstmt.setInt(7, vo.getUheight());
            pstmt.setInt(8, vo.getUweight());

            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    /** 유저 로그인 **/
    public int getLoginResult(UserVO vo) {
        int result = 0;
        String sql = "select count(*) from tb_user where userid=? and upw=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getUserid());
            pstmt.setString(2, vo.getUpw());

            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    /*** 마이페이지 회원정보 수정 ***/
    public int update(UserVO vo, String userid) {
        int result = 0;
        String sql = "update tb_user set uage=?, uemail=?, upw=?, ugender=?, uheight=?, uweight=? where userid=?";
        getPreparedStatement(sql);
        try {
            pstmt.setInt(1, vo.getUage());
            pstmt.setString(2, vo.getUemail());
            pstmt.setString(3, vo.getUpw());
            pstmt.setString(4, vo.getUgender());
            pstmt.setInt(5, vo.getUheight());
            pstmt.setInt(6, vo.getUweight());
            pstmt.setString(7, userid);

            result = pstmt.executeUpdate();

            close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /* 비밀번호찾기 select */
    public UserVO pwfind(String userid, String umail) {
        UserVO vo = new UserVO();
        String sql = "select upw from tb_user where userid=? and uemail=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, userid);
            pstmt.setString(2, umail);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setUpw(rs.getString(1));
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    /* 비번 카운트 */
    public int pwfindcount(String userid, String umail) {
        int result = 0;
        String sql = "select count(*) from tb_user where userid=? and uemail=?";
        getPreparedStatement(sql);
        try {
            pstmt.setString(1, userid);
            pstmt.setString(2, umail);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /* 아이디찾기 select */
    public UserVO idfind(String uname, String umail) {// 운동기록지 출력
        UserVO vo = new UserVO();
        String sql = "select userid from tb_user where uname=? and uemail=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, uname);
            pstmt.setString(2, umail);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setUserid(rs.getString(1));
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    /* 아이디 카운트 */
    public int idfindcount(String uname, String uemail) {
        System.out.println(uname);
        System.out.println(uemail);
        int result = 0;
        String sql = "select count(*) from tb_user where uname=? and uemail=?";
        getPreparedStatement(sql);
        try {
            pstmt.setString(1, uname);
            pstmt.setString(2, uemail);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.print(result);
        return result;
    }

}
