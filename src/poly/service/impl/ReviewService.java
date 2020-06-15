package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.ReviewDTO;
import poly.persistance.mapper.ReviewMapper;
import poly.service.IReviewService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("ReviewService")
public class ReviewService implements IReviewService {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "ReviewMapper")
    private ReviewMapper reviewMapper;

    @Override
    public int reviewAdd(ReviewDTO rDTO) throws Exception {
        log.info("rDTO : " + rDTO);
        return reviewMapper.reviewAdd(rDTO);
    }

    @Override
    public List<ReviewDTO> getReviewList(HashMap<String, String> rMap) throws Exception {
        return reviewMapper.getReviewList(rMap);
    }

    @Override
    public int reviewDel(ReviewDTO rDTO) throws Exception {
        return reviewMapper.reviewDel(rDTO);
    }

    @Override
    public int reviewMod(ReviewDTO rDTO) throws Exception {
        return reviewMapper.reviewMod(rDTO);
    }
}
