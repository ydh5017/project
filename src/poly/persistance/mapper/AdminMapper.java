package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

@Mapper("AdminMapper")
public interface AdminMapper {
    int UserCount() throws Exception;

    List<UserDTO> getUserList(HashMap<String, Integer> hMap) throws Exception;

    int Modass(UserDTO uDTO) throws Exception;
}
