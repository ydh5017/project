package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.Board_ReviewDTO;
import poly.persistance.mapper.Board_ReviewMapper;
import poly.service.IBoard_ReviewService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("Board_ReviewService")
public class Board_ReviewService implements IBoard_ReviewService {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "Board_ReviewMapper")
    private Board_ReviewMapper board_reviewMapper;

    @Override
    public List<Board_ReviewDTO> getReviewList(HashMap<String, String> rMap) throws Exception {
        return board_reviewMapper.getReviewList(rMap);
    }

    @Override
    public int reviewAdd(Board_ReviewDTO rDTO) throws Exception {
        return board_reviewMapper.reviewAdd(rDTO);
    }

    @Override
    public int reviewDel(Board_ReviewDTO rDTO) throws Exception {
        return board_reviewMapper.reviewDel(rDTO);
    }

    @Override
    public int reviewMod(Board_ReviewDTO rDTO) throws Exception {
        return board_reviewMapper.reviewMod(rDTO);
    }
}
