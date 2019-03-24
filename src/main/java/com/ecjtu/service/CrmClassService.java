package com.ecjtu.service;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

import com.ecjtu.po.CrmClass;

public interface CrmClassService extends IBaseService<CrmClass>{
	List<CrmClass> search(CrmClass crmClass);
}
