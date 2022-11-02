package com.ssafy.pj6.member.model.service;

import com.ssafy.pj6.member.model.MemberDto;
import com.ssafy.pj6.member.model.repo.MemberRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService{
    private MemberRepo memberRepo;

    @Autowired
    public MemberServiceImpl(MemberRepo memberRepo) {
        this.memberRepo = memberRepo;
    }

    @Override
    public int idCheck(String userId) throws Exception {
        return memberRepo.idCheck(userId);
    }

    @Override
    public void joinMember(MemberDto memberDto) throws Exception {
        memberRepo.joinMember(memberDto);
    }

    @Override
    public MemberDto loginMember(Map<String, String> map) throws Exception {
        return memberRepo.loginMember(map);
    }

    @Override
    public List<MemberDto> listMember(Map<String, Object> map) throws Exception {
        return memberRepo.listMember(map);
    }

    @Override
    public MemberDto getMember(String userId) throws Exception {
        return memberRepo.getMember(userId);
    }

    @Override
    public void updateMember(MemberDto memberDto) throws Exception {
        memberRepo.updateMember(memberDto);
    }

    @Override
    public void deleteMember(String userid) throws Exception {
        memberRepo.deleteMember(userid);
    }
}
