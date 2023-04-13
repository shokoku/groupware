package org.example.groupware.service;

import lombok.RequiredArgsConstructor;
import org.example.groupware.dto.BoardDTO;
import org.example.groupware.repository.BoardRepository;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class BoardService {

    private final BoardRepository boardRepository;

    public int save(BoardDTO boardDTO) {
        return boardRepository.save(boardDTO);
    }
}