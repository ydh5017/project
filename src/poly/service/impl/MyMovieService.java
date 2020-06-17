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

    @Override
    public int mymovieDel(MyMovieDTO mDTO) throws Exception {
        return myMovieMapper.mymovieDel(mDTO);
    }

    @Override
    public List<MyMovieDTO> getMyMovieList(String user_seq) throws Exception {
        return myMovieMapper.getMyMovieList(user_seq);
    }

    @Override
    public int mymovieListDel(MyMovieDTO mDTO) throws Exception {
        return myMovieMapper.mymovieListDel(mDTO);
    }
}
