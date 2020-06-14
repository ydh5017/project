package poly.persistance.mongo;

import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;

import java.util.List;

public interface IMovieMapper {

    /**
     * MongoDB 컬렉션 생성
     */
    public boolean createCollection(String colNm) throws Exception;

    /**
     * 데이터 저장하기
     */
    public int insertRank(List<MovieDTO> pList, String colNm) throws Exception;

    /**
     * 영화 데이터 가져오기
     */
    public List<MovieDTO> getRank(String colNm) throws Exception;


    /**
     * 영화 상세정보 데이터 저장하기
     */
    public int insertDetail(List<MovieDetailDTO> dList, String colNm) throws Exception;

    /**
     * MongoDB 컬렉션 Detail 생성
     */
    public boolean createCollectionDetail(String colNm2) throws Exception;

    /**
     * 영화 상세데이터 가져오기
     */
    public List<MovieDetailDTO> getMovieDetail(String colNm) throws Exception;

    /**
     * 영화 코드별 상세데이터 가져오기
     */
    public List<MovieDetailDTO> getMovieInfo(String mid) throws Exception;

}
