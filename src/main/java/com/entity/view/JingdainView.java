package com.entity.view;

import org.apache.tools.ant.util.DateUtils;
import com.annotation.ColumnInfo;
import com.entity.JingdainEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import com.utils.DateUtil;

/**
* 景点介绍
* 后端返回视图实体辅助类
* （通常后端关联的表或者自定义的字段需要返回使用）
*/
@TableName("jingdain")
public class JingdainView extends JingdainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//当前表
	/**
	* 景点类型的值
	*/
	@ColumnInfo(comment="景点类型的字典表值",type="varchar(200)")
	private String jingdainValue;




	public JingdainView() {

	}

	public JingdainView(JingdainEntity jingdainEntity) {
		try {
			BeanUtils.copyProperties(this, jingdainEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	//当前表的
	/**
	* 获取： 景点类型的值
	*/
	public String getJingdainValue() {
		return jingdainValue;
	}
	/**
	* 设置： 景点类型的值
	*/
	public void setJingdainValue(String jingdainValue) {
		this.jingdainValue = jingdainValue;
	}




	@Override
	public String toString() {
		return "JingdainView{" +
			", jingdainValue=" + jingdainValue +
			"} " + super.toString();
	}
}
