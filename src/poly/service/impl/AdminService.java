package poly.service.impl;

import org.springframework.stereotype.Service;
import poly.dto.UserDTO;
import poly.persistance.mapper.AdminMapper;
import poly.service.IAdminService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

@Service("AdminService")
public class AdminService implements IAdminService {

    @Resource(name = "AdminMapper")
    private AdminMapper adminMapper;


    @Override
    public int UserCount() throws Exception {
        return adminMapper.UserCount();
    }

    @Override
    public List<UserDTO> getUserList(HashMap<String, Integer> hMap) throws Exception {
        return adminMapper.getUserList(hMap);
    }

    @Override
    public int Modass(UserDTO uDTO) throws Exception {
        return adminMapper.Modass(uDTO);
    }
}
