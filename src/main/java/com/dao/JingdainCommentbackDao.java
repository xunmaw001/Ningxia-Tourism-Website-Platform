package com.dao;

import com.entity.JingdainCommentbackEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.view.JingdainCommentbackView;

/**
 * 景点评价 Dao 接口
 *
 * @author 
 */
public interface JingdainCommentbackDao extends BaseMapper<JingdainCommentbackEntity> {

   List<JingdainCommentbackView> selectListView(Pagination page,@Param("params")Map<String,Object> params);

}
