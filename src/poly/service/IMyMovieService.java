package poly.service;

import poly.dto.MyMovieDTO;

import java.util.HashMap;
import java.util.List;

public interface IMyMovieService {

    int mymovieAdd(MyMovieDTO mDTO) throws Exception;

    List<MyMovieDTO> mymovieCheck(HashMap<String, String> yMap) throws Exception;
}
