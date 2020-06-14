package poly.persistance.mongo;

public interface IMongoTestMapper {
    /**
     * MongoDB 컬렉션 생성하기
     */
    public boolean createCollection(String colNm) throws Exception;
}
