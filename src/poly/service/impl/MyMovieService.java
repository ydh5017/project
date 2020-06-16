package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import poly.dto.MyMovieDTO;
import poly.persistance.mapper.MyMovieMapper;
import poly.service.IMyMovieService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("MyMovieService")
public class MyMovieService implements IMyMovieService {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MyMovieMapper")
    private MyMovieMapper myMovieMapper;

    @Override
    public int mymovieAdd(MyMovieDTO mDTO) throws Exception {
        return myMovieMapper.mymovieAdd(mDTO);
    }

    @Override
    public List<MyMovieDTO> mymovieCheck(HashMap<String, String> yMap) throws Exception {
        return myMovieMapper.mymovieCheck(yMap);
    }
}
