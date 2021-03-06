package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.BoardDTO;
import poly.persistance.mapper.BoardMapper;
import poly.service.IBoardService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("BoardService")
public class BoardService implements IBoardService {

    @Resource(name="BoardMapper")
    private BoardMapper boardMapper;

    @Override
    public int boardAddproc(BoardDTO bDTO) throws Exception {
        return boardMapper.boardAddproc(bDTO);
    }

    @Override
    public List<BoardDTO> getBoardList(HashMap<String, Integer> hMap) throws Exception {
        System.out.println("service");
        return boardMapper.getBoardList(hMap);
    }

    @Override
    public BoardDTO boardDetail(BoardDTO bDTO) throws Exception {
        return boardMapper.boardDetail(bDTO);
    }

    @Override
    public int boardDelete(BoardDTO bDTO) throws Exception {
        return boardMapper.boardDelete(bDTO);
    }

    @Override
    public int boardMod(BoardDTO bDTO) throws Exception {
        return boardMapper.boardMod(bDTO);
    }

    @Override
    public int count(BoardDTO bDTO) throws Exception {
        return boardMapper.count(bDTO);
    }

    @Override
    public int TotalCount() throws Exception {
        return boardMapper.TotalCount();
    }
}
