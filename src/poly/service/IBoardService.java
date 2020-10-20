package poly.service;

import poly.dto.BoardDTO;

import java.util.HashMap;
import java.util.List;

public interface IBoardService {

    int boardAddproc(BoardDTO bDTO)throws Exception;

    List<BoardDTO> getBoardList(HashMap<String, Integer> hMap)throws Exception;

    BoardDTO boardDetail(BoardDTO bDTO)throws Exception;

    int boardDelete(BoardDTO bDTO)throws Exception;

    int boardMod(BoardDTO bDTO) throws Exception;

    int count(BoardDTO bDTO)throws Exception;

    int TotalCount()throws Exception;
}
