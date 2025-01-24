package com.dao;

import com.entity.JingdainEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.JingdainView;

/**
 * 景点介绍 Dao 接口
 *
 * @author 
 */
public interface JingdainDao extends BaseMapper<JingdainEntity> {

   List<JingdainView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
