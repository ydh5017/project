package poly.persistance.mapper;

import config.Mapper;
import poly.dto.MyMovieDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("MyMovieMapper")
public interface MyMovieMapper {
    int mymovieAdd(MyMovieDTO mDTO) throws Exception;

    List<MyMovieDTO> mymovieCheck(HashMap<String, String> yMap) throws Exception;
}
