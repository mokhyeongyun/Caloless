package caloless.vo;

public class ExerRecVO {
    String inout, kind, erid, erupdate, userid, erdate;
    int einum, eimet, ertime, uweight, hour, minute, second, eryear, ermonth, erday;

    public int getEryear() {
        return eryear;
    }

    public void setEryear(int eryear) {
        this.eryear = eryear;
    }

    public int getErmonth() {
        return ermonth;
    }

    public void setErmonth(int ermonth) {
        this.ermonth = ermonth;
    }

    public int getErday() {
        return erday;
    }

    public void setErday(int erday) {
        this.erday = erday;
    }

    public String getInout() {
        return inout;
    }

    public void setInout(String inout) {
        this.inout = inout;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getErdate() {
        return erdate;
    }

    public void setErdate(String erdate) {
        this.erdate = erdate;
    }

    public int getEimet() {
        return eimet;
    }

    public void setEimet(int eimet) {
        this.eimet = eimet;
    }

    public int getUweight() {
        return uweight;
    }

    public String getErid() {
        return erid;
    }

    public void setErid(String erid) {
        this.erid = erid;
    }

    public String getErupdate() {
        return erupdate;
    }

    public void setErupdate(String erupdate) {
        this.erupdate = erupdate;
    }

    public int getEinum() {
        return einum;
    }

    public void setEinum(int einum) {
        this.einum = einum;
    }

    public void setUweight(int uweight) {
        this.uweight = uweight;
    }

    public int getHour() {
        return hour;
    }

    public void setHour(int hour) {
        this.hour = hour;
    }

    public int getMinute() {
        return minute;
    }

    public void setMinute(int minute) {
        this.minute = minute;
    }

    public int getSecond() {
        return second;
    }

    public void setSecond(int second) {
        this.second = second;
    }

    public int getErtime() {
        return ertime;

    }

    public void setErtime(int ertime) {
        this.ertime = ertime;
    }

    public int getErtime2() {
        return hour * 3600 + minute * 60 + second;
    }
}
