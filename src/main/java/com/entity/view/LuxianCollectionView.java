package com.entity.view;

import org.apache.tools.ant.util.DateUtils;
import com.annotation.ColumnInfo;
import com.entity.LuxianCollectionEntity;
import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.io.Serializable;
import java.util.Date;
import com.utils.DateUtil;

/**
* 路线收藏
* 后端返回视图实体辅助类
* （通常后端关联的表或者自定义的字段需要返回使用）
*/
@TableName("luxian_collection")
public class LuxianCollectionView extends LuxianCollectionEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	//当前表
	/**
	* 类型的值
	*/
	@ColumnInfo(comment="类型的字典表值",type="varchar(200)")
	private String luxianCollectionValue;

	//级联表 路线
							/**
		* 路线名称
		*/

		@ColumnInfo(comment="路线名称",type="varchar(200)")
		private String luxianName;
		/**
		* 路线编号
		*/

		@ColumnInfo(comment="路线编号",type="varchar(200)")
		private String luxianUuidNumber;
		/**
		* 路线照片
		*/

		@ColumnInfo(comment="路线照片",type="varchar(200)")
		private String luxianPhoto;
		/**
		* 路线出发地点
		*/

		@ColumnInfo(comment="路线出发地点",type="varchar(200)")
		private String luxianAddress;
		/**
		* 路线途径地点
		*/

		@ColumnInfo(comment="路线途径地点",type="varchar(200)")
		private String luxianTujingAddress;
		/**
		* 路线目的地点
		*/

		@ColumnInfo(comment="路线目的地点",type="varchar(200)")
		private String luxianMudiAddress;
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
		* 路线类型
		*/
		@ColumnInfo(comment="路线类型",type="int(11)")
		private Integer luxianTypes;
			/**
			* 路线类型的值
			*/
			@ColumnInfo(comment="路线类型的字典表值",type="varchar(200)")
			private String luxianValue;
		/**
		* 路线热度
		*/

		@ColumnInfo(comment="路线热度",type="int(11)")
		private Integer luxianClicknum;
		/**
		* 路线详情
		*/

		@ColumnInfo(comment="路线详情",type="longtext")
		private String luxianContent;
		/**
		* 逻辑删除
		*/

		@ColumnInfo(comment="逻辑删除",type="int(11)")
		private Integer luxianDelete;
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



	public LuxianCollectionView() {

	}

	public LuxianCollectionView(LuxianCollectionEntity luxianCollectionEntity) {
		try {
			BeanUtils.copyProperties(this, luxianCollectionEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



	//当前表的
	/**
	* 获取： 类型的值
	*/
	public String getLuxianCollectionValue() {
		return luxianCollectionValue;
	}
	/**
	* 设置： 类型的值
	*/
	public void setLuxianCollectionValue(String luxianCollectionValue) {
		this.luxianCollectionValue = luxianCollectionValue;
	}


	//级联表的get和set 路线

		/**
		* 获取： 路线名称
		*/
		public String getLuxianName() {
			return luxianName;
		}
		/**
		* 设置： 路线名称
		*/
		public void setLuxianName(String luxianName) {
			this.luxianName = luxianName;
		}

		/**
		* 获取： 路线编号
		*/
		public String getLuxianUuidNumber() {
			return luxianUuidNumber;
		}
		/**
		* 设置： 路线编号
		*/
		public void setLuxianUuidNumber(String luxianUuidNumber) {
			this.luxianUuidNumber = luxianUuidNumber;
		}

		/**
		* 获取： 路线照片
		*/
		public String getLuxianPhoto() {
			return luxianPhoto;
		}
		/**
		* 设置： 路线照片
		*/
		public void setLuxianPhoto(String luxianPhoto) {
			this.luxianPhoto = luxianPhoto;
		}

		/**
		* 获取： 路线出发地点
		*/
		public String getLuxianAddress() {
			return luxianAddress;
		}
		/**
		* 设置： 路线出发地点
		*/
		public void setLuxianAddress(String luxianAddress) {
			this.luxianAddress = luxianAddress;
		}

		/**
		* 获取： 路线途径地点
		*/
		public String getLuxianTujingAddress() {
			return luxianTujingAddress;
		}
		/**
		* 设置： 路线途径地点
		*/
		public void setLuxianTujingAddress(String luxianTujingAddress) {
			this.luxianTujingAddress = luxianTujingAddress;
		}

		/**
		* 获取： 路线目的地点
		*/
		public String getLuxianMudiAddress() {
			return luxianMudiAddress;
		}
		/**
		* 设置： 路线目的地点
		*/
		public void setLuxianMudiAddress(String luxianMudiAddress) {
			this.luxianMudiAddress = luxianMudiAddress;
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
		* 获取： 路线类型
		*/
		public Integer getLuxianTypes() {
			return luxianTypes;
		}
		/**
		* 设置： 路线类型
		*/
		public void setLuxianTypes(Integer luxianTypes) {
			this.luxianTypes = luxianTypes;
		}


			/**
			* 获取： 路线类型的值
			*/
			public String getLuxianValue() {
				return luxianValue;
			}
			/**
			* 设置： 路线类型的值
			*/
			public void setLuxianValue(String luxianValue) {
				this.luxianValue = luxianValue;
			}

		/**
		* 获取： 路线热度
		*/
		public Integer getLuxianClicknum() {
			return luxianClicknum;
		}
		/**
		* 设置： 路线热度
		*/
		public void setLuxianClicknum(Integer luxianClicknum) {
			this.luxianClicknum = luxianClicknum;
		}

		/**
		* 获取： 路线详情
		*/
		public String getLuxianContent() {
			return luxianContent;
		}
		/**
		* 设置： 路线详情
		*/
		public void setLuxianContent(String luxianContent) {
			this.luxianContent = luxianContent;
		}

		/**
		* 获取： 逻辑删除
		*/
		public Integer getLuxianDelete() {
			return luxianDelete;
		}
		/**
		* 设置： 逻辑删除
		*/
		public void setLuxianDelete(Integer luxianDelete) {
			this.luxianDelete = luxianDelete;
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
		return "LuxianCollectionView{" +
			", luxianCollectionValue=" + luxianCollectionValue +
			", luxianName=" + luxianName +
			", luxianUuidNumber=" + luxianUuidNumber +
			", luxianPhoto=" + luxianPhoto +
			", luxianAddress=" + luxianAddress +
			", luxianTujingAddress=" + luxianTujingAddress +
			", luxianMudiAddress=" + luxianMudiAddress +
			", zanNumber=" + zanNumber +
			", caiNumber=" + caiNumber +
			", luxianClicknum=" + luxianClicknum +
			", luxianContent=" + luxianContent +
			", luxianDelete=" + luxianDelete +
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
