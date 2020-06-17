package poly.service.impl;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;
import poly.persistance.mongo.IMovieMapper;
import poly.service.IMovieService;
import poly.util.DateUtil;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Service("MovieService")
public class MovieService implements IMovieService {

    @Resource(name = "MovieMapper")
    private IMovieMapper movieMapper; // MongoDB에 저장할 Mapper

    private Logger log = Logger.getLogger(this.getClass());

    @Override
    public int collectMovieRank() throws Exception {

        log.info(this.getClass().getName() + ".collectMovieRank Start");

        int res = 0;

        List<MovieDTO> pList = new ArrayList<MovieDTO>();

        String url = "https://movie.naver.com/movie/running/current.nhn?view=image&tab=normal&order=reserve";

        Document doc = null;

        doc = Jsoup.connect(url).get();

        Elements element = doc.select("div.lst_wrap ul.lst_default_t1");

        Iterator<Element> MovieRankList = element.select("li").iterator();

        int rank = 0;

        while (MovieRankList.hasNext()) {

            Element movieInfo = MovieRankList.next();

            String mid2 = movieInfo.select("a").attr("href"); // 영화 번호
//            String image = movieInfo.select("img").attr("src"); // 영화 이미지
            String title = movieInfo.select("strong.tit").text(); // 영화 제목
            String ticket = movieInfo.select("span.dsc em.num").text(); // 예매율
            rank++;

            System.out.println(mid2);
            String[] mids = mid2.split("=");
            String mid = mids[1];
            System.out.println(mid);
            log.info("mid : " + mid);

            String url2 = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=" + mid;
            Document doc2 = null;
            doc2 = Jsoup.connect(url2).get();
            Elements element2 = doc2.select("body");
            String image = element2.select("div a img").attr("src");

            movieInfo = null;

            MovieDTO pDTO = new MovieDTO();
            pDTO.setCollect_time(DateUtil.getDateTime("yyyyMMddhhmmss"));
            pDTO.setMid(mid);
            pDTO.setImage(image);
            pDTO.setTitle(title);
            pDTO.setTicket(ticket);
            pDTO.setRank(rank);

            pList.add(pDTO);

        }

        String colNm = "MovieRank_" + DateUtil.getDateTime("yyyyMMdd");

        movieMapper.createCollection(colNm);

        movieMapper.insertRank(pList, colNm);

        log.info(this.getClass().getName() + ".collectMovieRank End");

        return res;
    }

    @Override
    public List<MovieDTO> getRank() throws Exception {
        log.info(this.getClass().getName() + ".getRank Start");

        String colNm = "MovieRank_" + DateUtil.getDateTime("yyyyMMdd");

        List<MovieDTO> rList = movieMapper.getRank(colNm);

        if (rList == null) {
            rList = new ArrayList<MovieDTO>();
        }

        log.info(this.getClass().getName() + ".getRank End");

        return rList;
    }

    @Override
    public int collectMovieDetail() throws Exception {

        log.info(this.getClass().getName() + ".collectMovieDetail Start");

        int res = 0;

        String colNm = "MovieRank_" + DateUtil.getDateTime("yyyyMMdd");

        List<MovieDTO> rList = movieMapper.getRank(colNm);

        if (rList == null) {
            rList = new ArrayList<MovieDTO>();
        }

        log.info("rList : " + rList);

        List<MovieDetailDTO> dList = new ArrayList<MovieDetailDTO>();

        for (int i = 0; i < rList.size(); i++) {

            String mid = rList.get(i).getMid();

            log.info("mid : " + mid);

            String url = "https://movie.naver.com/movie/bi/mi/basic.nhn?code=" + mid;
            String url2 = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode=" + mid;

            Document doc = null;
            Document doc2 = null;

            doc = Jsoup.connect(url).get();
            doc2 = Jsoup.connect(url2).get();

            Elements element = doc.select("div.article");
            Elements element2 = doc2.select("body");

            String titles = element.select("div.wide_info_area div.mv_info h3.h_movie a").text();
            String mv_infos = element.select("div.wide_info_area div.mv_info p.info_spec").text();
            String director = element.select("div.info_spec2 dl.step1 dd a").text();
            String actor = element.select("div.info_spec2 dl.step2 dd a").text();
            String h_context = element.select("div.story_area h5.h_tx_story").text();
            String context = element.select("div.story_area p.con_tx").text();
//            String image = element.select("div.poster a img").attr("src");
            String image = element2.select("div a img").attr("src");
            String backimg = element.select("div.viewer_img img").attr("src");

            String[] title2 = titles.split("상영중");
            String title = title2[0];

            String[] mv_info2 = mv_infos.split("\\[");
            String mv_info = mv_info2[0];


            log.info(title);
            log.info(mv_info);
            log.info(director);
            log.info(actor);
            log.info(h_context);
            log.info(context);
            log.info(image);
            log.info(backimg);

            MovieDetailDTO pDTO = new MovieDetailDTO();
            pDTO.setCollect_time(DateUtil.getDateTime("yyyyMMddhhmmss"));
            pDTO.setMid(mid);
            pDTO.setTitle(title);
            pDTO.setMv_info(mv_info);
            pDTO.setDirector(director);
            pDTO.setActor(actor);
            pDTO.setH_context(h_context);
            pDTO.setContext(context);
            pDTO.setImage(image);
            pDTO.setBackimg(backimg);

            dList.add(pDTO);

            String colNm2 = "MovieDetail_" + DateUtil.getDateTime("yyyyMMdd");

            movieMapper.createCollectionDetail(colNm2);

            movieMapper.insertDetail(dList, colNm2);

            log.info(this.getClass().getName() + ".collectMovieDetail End");


        }
        return res;
    }

    @Override
    public List<MovieDetailDTO> getMovieDetail() throws Exception {
        log.info(this.getClass().getName() + ".getMovieDetail Start");

        String colNm = "MovieDetail_" + DateUtil.getDateTime("yyyyMMdd");

        List<MovieDetailDTO> rList = movieMapper.getMovieDetail(colNm);

        if (rList == null) {
            rList = new ArrayList<MovieDetailDTO>();
        }

        log.info(this.getClass().getName() + ".getMovieDetail End");

        return rList;
    }

    @Override
    public List<MovieDetailDTO> getMovieInfo(String mid) throws Exception {
        return movieMapper.getMovieInfo(mid);
    }

}
