package poly.service;

import poly.dto.Board_ReviewDTO;

import java.util.HashMap;
import java.util.List;

public interface IBoard_ReviewService {

    int reviewAdd(Board_ReviewDTO rDTO) throws Exception;

    List<Board_ReviewDTO> getReviewList(HashMap<String, String> rMap) throws Exception;

    int reviewDel(Board_ReviewDTO rDTO) throws Exception;

    int reviewMod(Board_ReviewDTO rDTO) throws Exception;
}
