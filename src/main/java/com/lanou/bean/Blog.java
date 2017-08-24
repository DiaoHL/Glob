package com.lanou.bean;

/**
 * Created by dllo on 17/8/23.
 */
public class Blog {
    private Integer globId;
    private String globTitle;
    private String globDes;
    private String globContent;
    private User user;

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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "globId=" + globId +
                ", globTitle='" + globTitle + '\'' +
                ", globDes='" + globDes + '\'' +
                ", globContent='" + globContent + '\'' +
                ", user=" + user +
                '}';
    }
}
