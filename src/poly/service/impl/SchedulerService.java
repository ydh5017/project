package poly.service.impl;

import org.apache.log4j.Logger;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import poly.service.IMovieService;
import poly.service.ISchedulerService;

import javax.annotation.Resource;

@Component
@Service("SchedulerService")
public class SchedulerService implements ISchedulerService {

    private Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "MovieService")
    private IMovieService movieService;

    @Scheduled(cron = "0 0 0/12 * * ?")
    @Override
    public void sTest() throws Exception {

        log.info(this.getClass().getName() + "크롤링 스케쥴러 작동");

        movieService.collectMovieRank();

        movieService.collectMovieDetail();
    }


}