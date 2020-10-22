package poly.persistance.mapper;

import config.Mapper;
import poly.dto.Board_ReviewDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("Board_ReviewMapper")
public interface Board_ReviewMapper {
    int reviewAdd(Board_ReviewDTO rDTO) throws Exception;

    int reviewDel(Board_ReviewDTO rDTO) throws Exception;

    int reviewMod(Board_ReviewDTO rDTO) throws Exception;

    List<Board_ReviewDTO> getReviewList(HashMap<String, String> rMap) throws Exception;
}
