package com.entity.view;

import org.apache.tools.ant.util.DateUtils;
import com.annotation.ColumnInfo;
import com.entity.JingdainCommentbackEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import com.utils.DateUtil;

/**
* 景点评价
* 后端返回视图实体辅助类
* （通常后端关联的表或者自定义的字段需要返回使用）
*/
@TableName("jingdain_commentback")
public class JingdainCommentbackView extends JingdainCommentbackEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//当前表

	//级联表 景点介绍
		/**
		* 景点名称
		*/

		@ColumnInfo(comment="景点名称",type="varchar(200)")
		private String jingdainName;
		/**
		* 景点编号
		*/

		@ColumnInfo(comment="景点编号",type="varchar(200)")
		private String jingdainUuidNumber;
		/**
		* 景点照片
		*/

		@ColumnInfo(comment="景点照片",type="varchar(200)")
		private String jingdainPhoto;
		/**
		* 景点地点
		*/

		@ColumnInfo(comment="景点地点",type="varchar(200)")
		private String jingdainAddress;
		/**
		* 赞
		*/

		@ColumnInfo(comment="赞",type="int(11)")
		private Integer zanNumber;
		/**
		* 踩
		*/

		@ColumnInfo(comment="踩",type="int(11)")
		private Integer caiNumber;
		/**
		* 景点类型
		*/
		@ColumnInfo(comment="景点类型",type="int(11)")
		private Integer jingdainTypes;
			/**
			* 景点类型的值
			*/
			@ColumnInfo(comment="景点类型的字典表值",type="varchar(200)")
			private String jingdainValue;
		/**
		* 景点门票
		*/

		@ColumnInfo(comment="景点门票",type="int(11)")
		private Integer jingdainKucunNumber;
		/**
		* 现价/积分
		*/
		@ColumnInfo(comment="现价/积分",type="decimal(10,2)")
		private Double jingdainNewMoney;
		/**
		* 景点热度
		*/

		@ColumnInfo(comment="景点热度",type="int(11)")
		private Integer jingdainClicknum;
		/**
		* 景点介绍
		*/

		@ColumnInfo(comment="景点介绍",type="longtext")
		private String jingdainContent;
		/**
		* 逻辑删除
		*/

		@ColumnInfo(comment="逻辑删除",type="int(11)")
		private Integer jingdainDelete;
	//级联表 用户
		/**
		* 用户编号
		*/

		@ColumnInfo(comment="用户编号",type="varchar(200)")
		private String yonghuUuidNumber;
		/**
		* 用户姓名
		*/

		@ColumnInfo(comment="用户姓名",type="varchar(200)")
		private String yonghuName;
		/**
		* 用户手机号
		*/

		@ColumnInfo(comment="用户手机号",type="varchar(200)")
		private String yonghuPhone;
		/**
		* 用户身份证号
		*/

		@ColumnInfo(comment="用户身份证号",type="varchar(200)")
		private String yonghuIdNumber;
		/**
		* 用户头像
		*/

		@ColumnInfo(comment="用户头像",type="varchar(200)")
		private String yonghuPhoto;
		/**
		* 余额
		*/
		@ColumnInfo(comment="余额",type="decimal(10,2)")
		private Double newMoney;
		/**
		* 用户邮箱
		*/

		@ColumnInfo(comment="用户邮箱",type="varchar(200)")
		private String yonghuEmail;



	public JingdainCommentbackView() {

	}

	public JingdainCommentbackView(JingdainCommentbackEntity jingdainCommentbackEntity) {
		try {
			BeanUtils.copyProperties(this, jingdainCommentbackEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}





	//级联表的get和set 景点介绍

		/**
		* 获取： 景点名称
		*/
		public String getJingdainName() {
			return jingdainName;
		}
		/**
		* 设置： 景点名称
		*/
		public void setJingdainName(String jingdainName) {
			this.jingdainName = jingdainName;
		}

		/**
		* 获取： 景点编号
		*/
		public String getJingdainUuidNumber() {
			return jingdainUuidNumber;
		}
		/**
		* 设置： 景点编号
		*/
		public void setJingdainUuidNumber(String jingdainUuidNumber) {
			this.jingdainUuidNumber = jingdainUuidNumber;
		}

		/**
		* 获取： 景点照片
		*/
		public String getJingdainPhoto() {
			return jingdainPhoto;
		}
		/**
		* 设置： 景点照片
		*/
		public void setJingdainPhoto(String jingdainPhoto) {
			this.jingdainPhoto = jingdainPhoto;
		}

		/**
		* 获取： 景点地点
		*/
		public String getJingdainAddress() {
			return jingdainAddress;
		}
		/**
		* 设置： 景点地点
		*/
		public void setJingdainAddress(String jingdainAddress) {
			this.jingdainAddress = jingdainAddress;
		}

		/**
		* 获取： 赞
		*/
		public Integer getZanNumber() {
			return zanNumber;
		}
		/**
		* 设置： 赞
		*/
		public void setZanNumber(Integer zanNumber) {
			this.zanNumber = zanNumber;
		}

		/**
		* 获取： 踩
		*/
		public Integer getCaiNumber() {
			return caiNumber;
		}
		/**
		* 设置： 踩
		*/
		public void setCaiNumber(Integer caiNumber) {
			this.caiNumber = caiNumber;
		}
		/**
		* 获取： 景点类型
		*/
		public Integer getJingdainTypes() {
			return jingdainTypes;
		}
		/**
		* 设置： 景点类型
		*/
		public void setJingdainTypes(Integer jingdainTypes) {
			this.jingdainTypes = jingdainTypes;
		}


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

		/**
		* 获取： 景点门票
		*/
		public Integer getJingdainKucunNumber() {
			return jingdainKucunNumber;
		}
		/**
		* 设置： 景点门票
		*/
		public void setJingdainKucunNumber(Integer jingdainKucunNumber) {
			this.jingdainKucunNumber = jingdainKucunNumber;
		}

		/**
		* 获取： 现价/积分
		*/
		public Double getJingdainNewMoney() {
			return jingdainNewMoney;
		}
		/**
		* 设置： 现价/积分
		*/
		public void setJingdainNewMoney(Double jingdainNewMoney) {
			this.jingdainNewMoney = jingdainNewMoney;
		}

		/**
		* 获取： 景点热度
		*/
		public Integer getJingdainClicknum() {
			return jingdainClicknum;
		}
		/**
		* 设置： 景点热度
		*/
		public void setJingdainClicknum(Integer jingdainClicknum) {
			this.jingdainClicknum = jingdainClicknum;
		}

		/**
		* 获取： 景点介绍
		*/
		public String getJingdainContent() {
			return jingdainContent;
		}
		/**
		* 设置： 景点介绍
		*/
		public void setJingdainContent(String jingdainContent) {
			this.jingdainContent = jingdainContent;
		}

		/**
		* 获取： 逻辑删除
		*/
		public Integer getJingdainDelete() {
			return jingdainDelete;
		}
		/**
		* 设置： 逻辑删除
		*/
		public void setJingdainDelete(Integer jingdainDelete) {
			this.jingdainDelete = jingdainDelete;
		}
	//级联表的get和set 用户

		/**
		* 获取： 用户编号
		*/
		public String getYonghuUuidNumber() {
			return yonghuUuidNumber;
		}
		/**
		* 设置： 用户编号
		*/
		public void setYonghuUuidNumber(String yonghuUuidNumber) {
			this.yonghuUuidNumber = yonghuUuidNumber;
		}

		/**
		* 获取： 用户姓名
		*/
		public String getYonghuName() {
			return yonghuName;
		}
		/**
		* 设置： 用户姓名
		*/
		public void setYonghuName(String yonghuName) {
			this.yonghuName = yonghuName;
		}

		/**
		* 获取： 用户手机号
		*/
		public String getYonghuPhone() {
			return yonghuPhone;
		}
		/**
		* 设置： 用户手机号
		*/
		public void setYonghuPhone(String yonghuPhone) {
			this.yonghuPhone = yonghuPhone;
		}

		/**
		* 获取： 用户身份证号
		*/
		public String getYonghuIdNumber() {
			return yonghuIdNumber;
		}
		/**
		* 设置： 用户身份证号
		*/
		public void setYonghuIdNumber(String yonghuIdNumber) {
			this.yonghuIdNumber = yonghuIdNumber;
		}

		/**
		* 获取： 用户头像
		*/
		public String getYonghuPhoto() {
			return yonghuPhoto;
		}
		/**
		* 设置： 用户头像
		*/
		public void setYonghuPhoto(String yonghuPhoto) {
			this.yonghuPhoto = yonghuPhoto;
		}

		/**
		* 获取： 余额
		*/
		public Double getNewMoney() {
			return newMoney;
		}
		/**
		* 设置： 余额
		*/
		public void setNewMoney(Double newMoney) {
			this.newMoney = newMoney;
		}

		/**
		* 获取： 用户邮箱
		*/
		public String getYonghuEmail() {
			return yonghuEmail;
		}
		/**
		* 设置： 用户邮箱
		*/
		public void setYonghuEmail(String yonghuEmail) {
			this.yonghuEmail = yonghuEmail;
		}


	@Override
	public String toString() {
		return "JingdainCommentbackView{" +
			", jingdainName=" + jingdainName +
			", jingdainUuidNumber=" + jingdainUuidNumber +
			", jingdainPhoto=" + jingdainPhoto +
			", jingdainAddress=" + jingdainAddress +
			", zanNumber=" + zanNumber +
			", caiNumber=" + caiNumber +
			", jingdainKucunNumber=" + jingdainKucunNumber +
			", jingdainNewMoney=" + jingdainNewMoney +
			", jingdainClicknum=" + jingdainClicknum +
			", jingdainContent=" + jingdainContent +
			", jingdainDelete=" + jingdainDelete +
			", yonghuUuidNumber=" + yonghuUuidNumber +
			", yonghuName=" + yonghuName +
			", yonghuPhone=" + yonghuPhone +
			", yonghuIdNumber=" + yonghuIdNumber +
			", yonghuPhoto=" + yonghuPhoto +
			", newMoney=" + newMoney +
			", yonghuEmail=" + yonghuEmail +
			"} " + super.toString();
	}
}
