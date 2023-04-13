package org.example.groupware.service;

import lombok.RequiredArgsConstructor;
import org.example.groupware.dto.MemberDTO;
import org.example.groupware.repository.MemberRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;
    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }
}
