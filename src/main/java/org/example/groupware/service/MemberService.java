package org.example.groupware.service;

import lombok.RequiredArgsConstructor;
import org.example.groupware.dto.MemberDTO;
import org.example.groupware.repository.MemberRepository;
import org.example.groupware.utility.Validator;
import org.springframework.stereotype.Service;
import org.w3c.dom.css.CSSValueList;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    public int save(MemberDTO memberDTO) {
        Validator v=new Validator();
        if(!v.EmailValidate(memberDTO.getMemberEmail())){
            return 0;
        }
        else if(!v.PasswordValidate(memberDTO.getMemberPassword())){
            return 0;
        }
        else if(!v.NameValidate(memberDTO.getMemberName())){
            return 0;
        }
        else if(!v.AgeValidate(memberDTO.getMemberAge())){
            return 0;
        }
        else if(!v.PhoneValidate(memberDTO.getMemberMobile())){
            return 0;
        }
        else
            return memberRepository.save(memberDTO);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO loginMember = memberRepository.login(memberDTO);
        if (loginMember != null) {
            return true;
        } else {
            return false;
        }
    }

    public List<MemberDTO> findAll() {
        return memberRepository.findAll();
    }

    public MemberDTO findById(Long id) {
        return memberRepository.findById(id);
    }

    public void delete(Long id) {
        memberRepository.delete(id);
    }

    public MemberDTO findByMemberEmail(String loginEmail) {
        return memberRepository.findByMemberEmail(loginEmail);
    }

    public boolean update(MemberDTO memberDTO) {
        int result = memberRepository.update(memberDTO);
        if (result > 0) {
            return true;
        } else {
            return false;
        }
    }

    public String emailCheck(String memberEmail) {
        MemberDTO memberDTO = memberRepository.findByMemberEmail(memberEmail);
        if (memberDTO == null) {
            return "ok";
        } else {
            return "no";
        }
    }
}
