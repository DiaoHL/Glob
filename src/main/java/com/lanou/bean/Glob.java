package com.lanou.bean;

/**
 * Created by dllo on 17/8/23.
 */
public class Glob {
    private Integer globId;
    private String globTitle;
    private String globDes;
    private String globContent;

    @Override
    public String toString() {
        return "Glob{" +
                "globId=" + globId +
                ", globTitle='" + globTitle + '\'' +
                ", globDes='" + globDes + '\'' +
                ", globContent='" + globContent + '\'' +
                '}';
    }

    public Integer getGlobId() {
        return globId;
    }

    public void setGlobId(Integer globId) {
        this.globId = globId;
    }

    public String getGlobTitle() {
        return globTitle;
    }

    public void setGlobTitle(String globTitle) {
        this.globTitle = globTitle;
    }

    public String getGlobDes() {
        return globDes;
    }

    public void setGlobDes(String globDes) {
        this.globDes = globDes;
    }

    public String getGlobContent() {
        return globContent;
    }

    public void setGlobContent(String globContent) {
        this.globContent = globContent;
    }
}
