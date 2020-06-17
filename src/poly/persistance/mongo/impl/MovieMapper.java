package poly.persistance.mongo.impl;

import com.mongodb.BasicDBObject;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import poly.dto.MovieDTO;
import poly.dto.MovieDetailDTO;
import poly.persistance.mongo.IMovieMapper;
import poly.util.CmmUtil;
import poly.util.DateUtil;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Component("MovieMapper")
public class MovieMapper implements IMovieMapper {

    @Autowired
    private MongoTemplate mongodb;

    private Logger log = Logger.getLogger(this.getClass());

    @Override
    public boolean createCollection(String colNm) throws Exception {

        log.info(this.getClass().getName() + ".createCollection Start");

        boolean res = false;

        if (mongodb.collectionExists(colNm)) {
            mongodb.dropCollection(colNm);
        }

        mongodb.createCollection(colNm).createIndex(new BasicDBObject("collect_time", 1).append("rank", 1), "rankIdx");

        res = true;

        log.info(this.getClass().getName() + ".createCollection End");

        return res;
    }

    @Override
    public int insertRank(List<MovieDTO> pList, String colNm) throws Exception {

        log.info(this.getClass().getName() + ".insertRank Start");

        int res = 0;

        if (pList == null) {
            pList = new ArrayList<MovieDTO>();
        }

        Iterator<MovieDTO> it = pList.iterator();

        while (it.hasNext()) {
            MovieDTO pDTO = (MovieDTO) it.next();

            if (pDTO == null) {
                pDTO = new MovieDTO();
            }

            mongodb.insert(pDTO, colNm);

        }

        res = 1;

        log.info(this.getClass().getName() + ".insertRank End");

        return res;
    }

    @Override
    public List<MovieDTO> getRank(String colNm) throws Exception {

        log.info(this.getClass().getName() + ".getRank Start");

        DBCollection rCol = mongodb.getCollection(colNm);

        Iterator<DBObject> cursor = rCol.find();

        List<MovieDTO> rList = new ArrayList<MovieDTO>();

        MovieDTO rDTO = null;

        while (cursor.hasNext()) {

            rDTO = new MovieDTO();

            final DBObject current = cursor.next();

            String collect_time = CmmUtil.nvl((String) current.get("collect_time"));
            String mid = CmmUtil.nvl((String) current.get("mid"));
            String image = CmmUtil.nvl((String) current.get("image"));
            String title = CmmUtil.nvl((String) current.get("title"));
            String ticket = CmmUtil.nvl((String) current.get("ticket"));
            int rank = (int) current.get("rank");

            rDTO.setCollect_time(collect_time);
            rDTO.setMid(mid);
            rDTO.setImage(image);
            rDTO.setTitle(title);
            rDTO.setTicket(ticket);
            rDTO.setRank(rank);

            rList.add(rDTO);

            rDTO = null;
        }

        log.info("rList : " + rList.size());

        log.info(this.getClass().getName() + "getRank End");

        return rList;
    }

    @Override
    public boolean createCollectionDetail(String colNm2) throws Exception {

        log.info(this.getClass().getName() + ".createCollectionDetail Start");

        boolean res = false;

        if (mongodb.collectionExists(colNm2)) {
            mongodb.dropCollection(colNm2);
        }

        mongodb.createCollection(colNm2).createIndex(new BasicDBObject("collect_time", 1).append("rank", 1), "rankIdx");

        res = true;

        log.info(this.getClass().getName() + ".createCollectionDetail End");

        return res;
    }


    @Override
    public int insertDetail(List<MovieDetailDTO> dList, String colNm2) throws Exception {

        log.info(this.getClass().getName() + ".insertDetail Start");

        int res = 0;

        if (dList == null) {
            dList = new ArrayList<MovieDetailDTO>();
        }

        Iterator<MovieDetailDTO> it = dList.iterator();

        while (it.hasNext()) {
            MovieDetailDTO pDTO = (MovieDetailDTO) it.next();

            if (pDTO == null) {
                pDTO = new MovieDetailDTO();
            }

            mongodb.insert(pDTO, colNm2);

        }

        res = 1;

        log.info(this.getClass().getName() + ".insertDetail End");

        return res;
    }

    @Override
    public List<MovieDetailDTO> getMovieDetail(String colNm) throws Exception {

        log.info(this.getClass().getName() + ".getMovieDetail Start");

        DBCollection rCol = mongodb.getCollection(colNm);

        Iterator<DBObject> cursor = rCol.find();

        List<MovieDetailDTO> rList = new ArrayList<MovieDetailDTO>();

        MovieDetailDTO rDTO = null;

        while (cursor.hasNext()) {

            rDTO = new MovieDetailDTO();

            final DBObject current = cursor.next();

            String collect_time = CmmUtil.nvl((String) current.get("collect_time"));
            String mid = CmmUtil.nvl((String) current.get("mid"));
            String title = CmmUtil.nvl((String) current.get("title"));
            String mv_info = CmmUtil.nvl((String) current.get("mv_info"));
            String director = CmmUtil.nvl((String) current.get("director"));
            String actor = CmmUtil.nvl((String) current.get("actor"));
            String h_context = CmmUtil.nvl((String) current.get("h_context"));
            String context = CmmUtil.nvl((String) current.get("context"));
            String image = CmmUtil.nvl((String) current.get("image"));
            String backimg = CmmUtil.nvl((String) current.get("backimg"));

            rDTO.setCollect_time(collect_time);
            rDTO.setMid(mid);
            rDTO.setTitle(title);
            rDTO.setMv_info(mv_info);
            rDTO.setDirector(director);
            rDTO.setActor(actor);
            rDTO.setH_context(h_context);
            rDTO.setContext(context);
            rDTO.setImage(image);
            rDTO.setBackimg(backimg);

            rList.add(rDTO);

            rDTO = null;
        }

        log.info("rList : " + rList.size());

        log.info(this.getClass().getName() + "getMovieDetail End");

        return rList;
    }

    @Override
    public List<MovieDetailDTO> getMovieInfo(String mid) {

        String colNm = "MovieDetail_" + DateUtil.getDateTime("yyyyMMdd");

        log.info("colNm : " + colNm);

        DBCollection rCol = mongodb.getCollection(colNm);

        log.info("mid : " + mid);

        BasicDBObject mid2 = new BasicDBObject();
        mid2.put("mid", mid);

        log.info("mid2 : " +mid2);

        Iterator<DBObject> cursor = rCol.find(mid2);
        log.info("cursor : " + cursor);

        List<MovieDetailDTO> mList = new ArrayList<MovieDetailDTO>();

        MovieDetailDTO mDTO = null;

        mDTO = new MovieDetailDTO();


            final DBObject current = cursor.next();
            log.info("current : " + current);

            String collect_time = CmmUtil.nvl((String) current.get("collect_time"));
            String mId = CmmUtil.nvl((String) current.get("mid"));
            String title = CmmUtil.nvl((String) current.get("title"));
            String mv_info = CmmUtil.nvl((String) current.get("mv_info"));
            String director = CmmUtil.nvl((String) current.get("director"));
            String actor = CmmUtil.nvl((String) current.get("actor"));
            String h_context = CmmUtil.nvl((String) current.get("h_context"));
            String context = CmmUtil.nvl((String) current.get("context"));
            String image = CmmUtil.nvl((String) current.get("image"));
            String backimg = CmmUtil.nvl((String) current.get("backimg"));

            log.info("collect_time : " + collect_time);
            log.info("mid : " + mid);
            log.info("title : " + title);
            log.info("mv_info : " + mv_info);
            log.info("director : " + director);
            log.info("actor : " + actor);
            log.info("h_context : " + h_context);
            log.info("context : " + context);
            log.info("image : " + image);
            log.info("backimg : " + backimg);

            mDTO.setCollect_time(collect_time);
            mDTO.setMid(mId);
            mDTO.setTitle(title);
            mDTO.setMv_info(mv_info);
            mDTO.setDirector(director);
            mDTO.setActor(actor);
            mDTO.setH_context(h_context);
            mDTO.setContext(context);
            mDTO.setImage(image);
            mDTO.setBackimg(backimg);

            mList.add(mDTO);

            mDTO = null;

        log.info("mList : " + mList.size());

        return mList;
    }
}
