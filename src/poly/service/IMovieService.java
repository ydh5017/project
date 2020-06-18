package poly.service;

import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;

import java.util.List;

public interface IMovieService {

    /**
     * 예매순위 수집
     */
    public int collectMovieRank() throws Exception;

    /**
     * 영화 데이터 가져오기
     */
    public List<MovieDTO> getRank() throws Exception;

    /**
     * 영화 상세정보 수집
     */
    public int collectMovieDetail() throws Exception;

    /**
     * 영화 상세데이터 가져오기
     */
    public List<MovieDetailDTO> getMovieDetail() throws Exception;

    /**
     * 영화 코드별 상세데이터 가져오기
     */
    public List<MovieDetailDTO> getMovieInfo(String mid) throws Exception;

    List<MovieDetailDTO> getMovieSerch(String keyword) throws Exception;
}
