package com.entity;

import com.annotation.ColumnInfo;
import javax.validation.constraints.*;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;
import java.io.Serializable;
import java.util.*;
import org.apache.tools.ant.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.utils.DateUtil;


/**
 * 景点介绍
 *
 * @author 
 * @email
 */
@TableName("jingdain")
public class JingdainEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public JingdainEntity() {

	}

	public JingdainEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    @ColumnInfo(comment="主键",type="int(11)")
    @TableField(value = "id")

    private Integer id;


    /**
     * 景点名称
     */
    @ColumnInfo(comment="景点名称",type="varchar(200)")
    @TableField(value = "jingdain_name")

    private String jingdainName;


    /**
     * 景点编号
     */
    @ColumnInfo(comment="景点编号",type="varchar(200)")
    @TableField(value = "jingdain_uuid_number")

    private String jingdainUuidNumber;


    /**
     * 景点照片
     */
    @ColumnInfo(comment="景点照片",type="varchar(200)")
    @TableField(value = "jingdain_photo")

    private String jingdainPhoto;


    /**
     * 景点地点
     */
    @ColumnInfo(comment="景点地点",type="varchar(200)")
    @TableField(value = "jingdain_address")

    private String jingdainAddress;


    /**
     * 赞
     */
    @ColumnInfo(comment="赞",type="int(11)")
    @TableField(value = "zan_number")

    private Integer zanNumber;


    /**
     * 踩
     */
    @ColumnInfo(comment="踩",type="int(11)")
    @TableField(value = "cai_number")

    private Integer caiNumber;


    /**
     * 景点类型
     */
    @ColumnInfo(comment="景点类型",type="int(11)")
    @TableField(value = "jingdain_types")

    private Integer jingdainTypes;


    /**
     * 景点门票
     */
    @ColumnInfo(comment="景点门票",type="int(11)")
    @TableField(value = "jingdain_kucun_number")

    private Integer jingdainKucunNumber;


    /**
     * 现价/积分
     */
    @ColumnInfo(comment="现价/积分",type="decimal(10,2)")
    @TableField(value = "jingdain_new_money")

    private Double jingdainNewMoney;


    /**
     * 景点热度
     */
    @ColumnInfo(comment="景点热度",type="int(11)")
    @TableField(value = "jingdain_clicknum")

    private Integer jingdainClicknum;


    /**
     * 景点介绍
     */
    @ColumnInfo(comment="景点介绍",type="longtext")
    @TableField(value = "jingdain_content")

    private String jingdainContent;


    /**
     * 逻辑删除
     */
    @ColumnInfo(comment="逻辑删除",type="int(11)")
    @TableField(value = "jingdain_delete")

    private Integer jingdainDelete;


    /**
     * 录入时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="录入时间",type="timestamp")
    @TableField(value = "insert_time",fill = FieldFill.INSERT)

    private Date insertTime;


    /**
     * 创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    @ColumnInfo(comment="创建时间",type="timestamp")
    @TableField(value = "create_time",fill = FieldFill.INSERT)

    private Date createTime;


    /**
	 * 获取：主键
	 */
    public Integer getId() {
        return id;
    }
    /**
	 * 设置：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 获取：景点名称
	 */
    public String getJingdainName() {
        return jingdainName;
    }
    /**
	 * 设置：景点名称
	 */

    public void setJingdainName(String jingdainName) {
        this.jingdainName = jingdainName;
    }
    /**
	 * 获取：景点编号
	 */
    public String getJingdainUuidNumber() {
        return jingdainUuidNumber;
    }
    /**
	 * 设置：景点编号
	 */

    public void setJingdainUuidNumber(String jingdainUuidNumber) {
        this.jingdainUuidNumber = jingdainUuidNumber;
    }
    /**
	 * 获取：景点照片
	 */
    public String getJingdainPhoto() {
        return jingdainPhoto;
    }
    /**
	 * 设置：景点照片
	 */

    public void setJingdainPhoto(String jingdainPhoto) {
        this.jingdainPhoto = jingdainPhoto;
    }
    /**
	 * 获取：景点地点
	 */
    public String getJingdainAddress() {
        return jingdainAddress;
    }
    /**
	 * 设置：景点地点
	 */

    public void setJingdainAddress(String jingdainAddress) {
        this.jingdainAddress = jingdainAddress;
    }
    /**
	 * 获取：赞
	 */
    public Integer getZanNumber() {
        return zanNumber;
    }
    /**
	 * 设置：赞
	 */

    public void setZanNumber(Integer zanNumber) {
        this.zanNumber = zanNumber;
    }
    /**
	 * 获取：踩
	 */
    public Integer getCaiNumber() {
        return caiNumber;
    }
    /**
	 * 设置：踩
	 */

    public void setCaiNumber(Integer caiNumber) {
        this.caiNumber = caiNumber;
    }
    /**
	 * 获取：景点类型
	 */
    public Integer getJingdainTypes() {
        return jingdainTypes;
    }
    /**
	 * 设置：景点类型
	 */

    public void setJingdainTypes(Integer jingdainTypes) {
        this.jingdainTypes = jingdainTypes;
    }
    /**
	 * 获取：景点门票
	 */
    public Integer getJingdainKucunNumber() {
        return jingdainKucunNumber;
    }
    /**
	 * 设置：景点门票
	 */

    public void setJingdainKucunNumber(Integer jingdainKucunNumber) {
        this.jingdainKucunNumber = jingdainKucunNumber;
    }
    /**
	 * 获取：现价/积分
	 */
    public Double getJingdainNewMoney() {
        return jingdainNewMoney;
    }
    /**
	 * 设置：现价/积分
	 */

    public void setJingdainNewMoney(Double jingdainNewMoney) {
        this.jingdainNewMoney = jingdainNewMoney;
    }
    /**
	 * 获取：景点热度
	 */
    public Integer getJingdainClicknum() {
        return jingdainClicknum;
    }
    /**
	 * 设置：景点热度
	 */

    public void setJingdainClicknum(Integer jingdainClicknum) {
        this.jingdainClicknum = jingdainClicknum;
    }
    /**
	 * 获取：景点介绍
	 */
    public String getJingdainContent() {
        return jingdainContent;
    }
    /**
	 * 设置：景点介绍
	 */

    public void setJingdainContent(String jingdainContent) {
        this.jingdainContent = jingdainContent;
    }
    /**
	 * 获取：逻辑删除
	 */
    public Integer getJingdainDelete() {
        return jingdainDelete;
    }
    /**
	 * 设置：逻辑删除
	 */

    public void setJingdainDelete(Integer jingdainDelete) {
        this.jingdainDelete = jingdainDelete;
    }
    /**
	 * 获取：录入时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }
    /**
	 * 设置：录入时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间
	 */
    public Date getCreateTime() {
        return createTime;
    }
    /**
	 * 设置：创建时间
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Jingdain{" +
            ", id=" + id +
            ", jingdainName=" + jingdainName +
            ", jingdainUuidNumber=" + jingdainUuidNumber +
            ", jingdainPhoto=" + jingdainPhoto +
            ", jingdainAddress=" + jingdainAddress +
            ", zanNumber=" + zanNumber +
            ", caiNumber=" + caiNumber +
            ", jingdainTypes=" + jingdainTypes +
            ", jingdainKucunNumber=" + jingdainKucunNumber +
            ", jingdainNewMoney=" + jingdainNewMoney +
            ", jingdainClicknum=" + jingdainClicknum +
            ", jingdainContent=" + jingdainContent +
            ", jingdainDelete=" + jingdainDelete +
            ", insertTime=" + DateUtil.convertString(insertTime,"yyyy-MM-dd") +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
