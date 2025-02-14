package com.dao;

import com.entity.JingdainCollectionEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.JingdainCollectionView;

/**
 * 景点收藏 Dao 接口
 *
 * @author 
 */
public interface JingdainCollectionDao extends BaseMapper<JingdainCollectionEntity> {

   List<JingdainCollectionView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
