package com.ssafy.pj6.member.model.repo;

import com.ssafy.pj6.member.model.MemberDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface MemberRepo {

    int idCheck(String userId) throws SQLException;
    void joinMember(MemberDto memberDto) throws SQLException;
    MemberDto loginMember(Map<String, String> map) throws SQLException;

    /* Admin */
    List<MemberDto> listMember(Map<String, Object> map) throws SQLException;
    MemberDto getMember(String userId) throws SQLException;
    void updateMember(MemberDto memberDto) throws SQLException;
    void deleteMember(String userId) throws SQLException;
}
