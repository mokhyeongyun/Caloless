package caloless.vo;

public class ExerInfoVO {
    int einum, eimet;
    String eiinout, eiadv, eiweak, eipre, eidate, userid2, eiupdate, eikind, userid;

    public int getEinum() {
        return einum;
    }

    public void setEinum(int einum) {
        this.einum = einum;
    }

    public int getEimet() {
        return eimet;
    }

    public void setEimet(int eimet) {
        this.eimet = eimet;
    }

    public String getEiinout() {
        return eiinout;
    }

    public void setEiinout(String eiinout) {
        this.eiinout = eiinout;
    }

    public String getEiadv() {
        return eiadv.replaceAll("(?i)<script", "&lt;script");
    }

    public void setEiadv(String eiadv) {
        this.eiadv = eiadv;
    }

    public String getEiweak() {
        return eiweak.replaceAll("(?i)<script", "&lt;script");
    }

    public void setEiweak(String eiweak) {
        this.eiweak = eiweak;
    }

    public String getEipre() {
        return eipre.replaceAll("(?i)<script", "&lt;script");
    }

    public void setEipre(String eipre) {
        this.eipre = eipre;
    }

    public String getEidate() {
        return eidate;
    }

    public void setEidate(String eidate) {
        this.eidate = eidate;
    }

    public String getUserid2() {
        return userid2;
    }

    public void setUserid2(String userid2) {
        this.userid2 = userid2;
    }

    public String getEiupdate() {
        return eiupdate;
    }

    public void setEiupdate(String eiupdate) {
        this.eiupdate = eiupdate;
    }

    public String getEikind() {
        return eikind;
    }

    public void setEikind(String eikind) {
        this.eikind = eikind;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }
}
