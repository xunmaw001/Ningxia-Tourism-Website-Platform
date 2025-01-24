package com.dao;

import com.entity.JingdainOrderEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.JingdainOrderView;

/**
 * 景点订单 Dao 接口
 *
 * @author 
 */
public interface JingdainOrderDao extends BaseMapper<JingdainOrderEntity> {

   List<JingdainOrderView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
