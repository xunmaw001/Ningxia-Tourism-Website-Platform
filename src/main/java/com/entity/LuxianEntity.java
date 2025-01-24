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
 * 路线
 *
 * @author 
 * @email
 */
@TableName("luxian")
public class LuxianEntity<T> implements Serializable {
    private static final long serialVersionUID = 1L;


	public LuxianEntity() {

	}

	public LuxianEntity(T t) {
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
     * 景点
     */
    @ColumnInfo(comment="景点",type="int(11)")
    @TableField(value = "jingdain_id")

    private Integer jingdainId;


    /**
     * 路线名称
     */
    @ColumnInfo(comment="路线名称",type="varchar(200)")
    @TableField(value = "luxian_name")

    private String luxianName;


    /**
     * 路线编号
     */
    @ColumnInfo(comment="路线编号",type="varchar(200)")
    @TableField(value = "luxian_uuid_number")

    private String luxianUuidNumber;


    /**
     * 路线照片
     */
    @ColumnInfo(comment="路线照片",type="varchar(200)")
    @TableField(value = "luxian_photo")

    private String luxianPhoto;


    /**
     * 路线出发地点
     */
    @ColumnInfo(comment="路线出发地点",type="varchar(200)")
    @TableField(value = "luxian_address")

    private String luxianAddress;


    /**
     * 路线途径地点
     */
    @ColumnInfo(comment="路线途径地点",type="varchar(200)")
    @TableField(value = "luxian_tujing_address")

    private String luxianTujingAddress;


    /**
     * 路线目的地点
     */
    @ColumnInfo(comment="路线目的地点",type="varchar(200)")
    @TableField(value = "luxian_mudi_address")

    private String luxianMudiAddress;


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
     * 路线类型
     */
    @ColumnInfo(comment="路线类型",type="int(11)")
    @TableField(value = "luxian_types")

    private Integer luxianTypes;


    /**
     * 路线热度
     */
    @ColumnInfo(comment="路线热度",type="int(11)")
    @TableField(value = "luxian_clicknum")

    private Integer luxianClicknum;


    /**
     * 路线详情
     */
    @ColumnInfo(comment="路线详情",type="longtext")
    @TableField(value = "luxian_content")

    private String luxianContent;


    /**
     * 逻辑删除
     */
    @ColumnInfo(comment="逻辑删除",type="int(11)")
    @TableField(value = "luxian_delete")

    private Integer luxianDelete;


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
	 * 获取：景点
	 */
    public Integer getJingdainId() {
        return jingdainId;
    }
    /**
	 * 设置：景点
	 */

    public void setJingdainId(Integer jingdainId) {
        this.jingdainId = jingdainId;
    }
    /**
	 * 获取：路线名称
	 */
    public String getLuxianName() {
        return luxianName;
    }
    /**
	 * 设置：路线名称
	 */

    public void setLuxianName(String luxianName) {
        this.luxianName = luxianName;
    }
    /**
	 * 获取：路线编号
	 */
    public String getLuxianUuidNumber() {
        return luxianUuidNumber;
    }
    /**
	 * 设置：路线编号
	 */

    public void setLuxianUuidNumber(String luxianUuidNumber) {
        this.luxianUuidNumber = luxianUuidNumber;
    }
    /**
	 * 获取：路线照片
	 */
    public String getLuxianPhoto() {
        return luxianPhoto;
    }
    /**
	 * 设置：路线照片
	 */

    public void setLuxianPhoto(String luxianPhoto) {
        this.luxianPhoto = luxianPhoto;
    }
    /**
	 * 获取：路线出发地点
	 */
    public String getLuxianAddress() {
        return luxianAddress;
    }
    /**
	 * 设置：路线出发地点
	 */

    public void setLuxianAddress(String luxianAddress) {
        this.luxianAddress = luxianAddress;
    }
    /**
	 * 获取：路线途径地点
	 */
    public String getLuxianTujingAddress() {
        return luxianTujingAddress;
    }
    /**
	 * 设置：路线途径地点
	 */

    public void setLuxianTujingAddress(String luxianTujingAddress) {
        this.luxianTujingAddress = luxianTujingAddress;
    }
    /**
	 * 获取：路线目的地点
	 */
    public String getLuxianMudiAddress() {
        return luxianMudiAddress;
    }
    /**
	 * 设置：路线目的地点
	 */

    public void setLuxianMudiAddress(String luxianMudiAddress) {
        this.luxianMudiAddress = luxianMudiAddress;
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
	 * 获取：路线类型
	 */
    public Integer getLuxianTypes() {
        return luxianTypes;
    }
    /**
	 * 设置：路线类型
	 */

    public void setLuxianTypes(Integer luxianTypes) {
        this.luxianTypes = luxianTypes;
    }
    /**
	 * 获取：路线热度
	 */
    public Integer getLuxianClicknum() {
        return luxianClicknum;
    }
    /**
	 * 设置：路线热度
	 */

    public void setLuxianClicknum(Integer luxianClicknum) {
        this.luxianClicknum = luxianClicknum;
    }
    /**
	 * 获取：路线详情
	 */
    public String getLuxianContent() {
        return luxianContent;
    }
    /**
	 * 设置：路线详情
	 */

    public void setLuxianContent(String luxianContent) {
        this.luxianContent = luxianContent;
    }
    /**
	 * 获取：逻辑删除
	 */
    public Integer getLuxianDelete() {
        return luxianDelete;
    }
    /**
	 * 设置：逻辑删除
	 */

    public void setLuxianDelete(Integer luxianDelete) {
        this.luxianDelete = luxianDelete;
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
        return "Luxian{" +
            ", id=" + id +
            ", jingdainId=" + jingdainId +
            ", luxianName=" + luxianName +
            ", luxianUuidNumber=" + luxianUuidNumber +
            ", luxianPhoto=" + luxianPhoto +
            ", luxianAddress=" + luxianAddress +
            ", luxianTujingAddress=" + luxianTujingAddress +
            ", luxianMudiAddress=" + luxianMudiAddress +
            ", zanNumber=" + zanNumber +
            ", caiNumber=" + caiNumber +
            ", luxianTypes=" + luxianTypes +
            ", luxianClicknum=" + luxianClicknum +
            ", luxianContent=" + luxianContent +
            ", luxianDelete=" + luxianDelete +
            ", insertTime=" + DateUtil.convertString(insertTime,"yyyy-MM-dd") +
            ", createTime=" + DateUtil.convertString(createTime,"yyyy-MM-dd") +
        "}";
    }
}
