package caloless.dao;

import java.util.ArrayList;

import caloless.vo.NoticeVO;

public class NoticeDao extends DBConn {

    // 글 등록
    public int insert(NoticeVO vo) {
        int result = 0;
        String sql = "insert into tb_notice values(sequ_tb_notice_nnum.nextval,?,?,'admin',sysdate,null,null)"; // admin(userid)

        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getNtitle());
            pstmt.setString(2, vo.getNcontent());
            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }

    // 리스트 목록
    public ArrayList<NoticeVO> select() {
        ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
        String sql = "select nnum,ntitle,ncontent,userid,to_char(ndate, 'yyyy/mm/dd') ndate,userid2,to_char(ndate2, 'yyyy/mm/dd') ndate2 from tb_notice order by nnum desc";
        getPreparedStatement(sql);

        try {
            rs = pstmt.executeQuery();
            while (rs.next()) {
                NoticeVO vo = new NoticeVO();
                vo.setNnum(rs.getInt(1));
                vo.setNtitle(rs.getString(2));
                vo.setNcontent(rs.getString(3));
                vo.setUserid(rs.getString(4));
                vo.setNdate(rs.getString(5));
                vo.setUserid2(rs.getString(6));
                vo.setNdate2(rs.getString(7));

                list.add(vo);
            }
            close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public NoticeVO select(int nnum) {
        NoticeVO vo = new NoticeVO();
        String sql = "select nnum,ntitle,ncontent,userid,to_char(ndate, 'yyyy/mm/dd') ndate,userid2,to_char(ndate2, 'yyyy/mm/dd') ndate2 from tb_notice where nnum=? order by nnum desc";
        getPreparedStatement(sql);

        try {
            pstmt.setInt(1, nnum);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                vo.setNtitle(rs.getString(2));
                vo.setNcontent(rs.getString(3));
                vo.setNnum(rs.getInt(1));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return vo;
    }

    // 공지사항 수정하기
    public int update(NoticeVO vo, int nnum) {
        int result = 0;
        String sql = "update tb_notice set ntitle=?, ncontent=?, userid2='admin', ndate2=sysdate where nnum=?";
        getPreparedStatement(sql);

        try {
            pstmt.setString(1, vo.getNtitle());
            pstmt.setString(2, vo.getNcontent());
            pstmt.setInt(3, nnum);

            result = pstmt.executeUpdate();

            close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    // 공지사항 삭제하기
    public int delete(int nnum) {
        int result = 0;

        String sql = "DELETE FROM tb_notice WHERE nnum = ?";
        getPreparedStatement(sql);

        try {
            pstmt.setInt(1, nnum);

            result = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
