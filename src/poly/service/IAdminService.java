package poly.service;

import poly.dto.UserDTO;

import java.util.HashMap;
import java.util.List;

public interface IAdminService {

    int UserCount() throws Exception;

    List<UserDTO> getUserList(HashMap<String, Integer> hMap) throws Exception;

    int Modass(UserDTO uDTO) throws Exception;
}
