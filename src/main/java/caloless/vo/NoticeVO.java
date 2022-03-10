package caloless.vo;

public class NoticeVO {
    String ntitle, ncontent, userid, ndate, userid2, ndate2;
    int nnum;

    public String getNtitle() {
        return ntitle.replaceAll("(?i)<script", "&lt;script");
    }

    public void setNtitle(String ntitle) {
        this.ntitle = ntitle;
    }

    public String getNcontent() {
        return ncontent.replaceAll("(?i)<script", "&lt;script");

    }

    public void setNcontent(String ncontent) {
        this.ncontent = ncontent;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getNdate() {
        return ndate;
    }

    public void setNdate(String ndate) {
        this.ndate = ndate;
    }

    public String getUserid2() {
        return userid2;
    }

    public void setUserid2(String userid2) {
        this.userid2 = userid2;
    }

    public String getNdate2() {
        return ndate2;
    }

    public void setNdate2(String ndate2) {
        this.ndate2 = ndate2;
    }

    public int getNnum() {
        return nnum;
    }

    public void setNnum(int nnum) {
        this.nnum = nnum;
    }

}
