package com.ssafy.pj6.member.model;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@ApiModel(value = "MemberDto (회원정보)", description = "아이디, 비번, 이름.을 가진   Domain Class")
public class MemberDto {

    @ApiModelProperty(value = "회원아이디")
    private String userId;
    @ApiModelProperty(value = "회원이름")
    private String userName;
    @ApiModelProperty(value = "회원비밀번호")
    private String userPwd;
    @ApiModelProperty(value = "이메일")
    private String userEmail;
    @ApiModelProperty(value = "가입일")
    private String joinDate;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", userPwd='" + userPwd + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", joinDate='" + joinDate + '\'' +
                '}';
    }
}
