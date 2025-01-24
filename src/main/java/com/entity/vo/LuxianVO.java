package com.entity.vo;

import com.entity.LuxianEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 路线
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("luxian")
public class LuxianVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 景点
     */

    @TableField(value = "jingdain_id")
    private Integer jingdainId;


    /**
     * 路线名称
     */

    @TableField(value = "luxian_name")
    private String luxianName;


    /**
     * 路线编号
     */

    @TableField(value = "luxian_uuid_number")
    private String luxianUuidNumber;


    /**
     * 路线照片
     */

    @TableField(value = "luxian_photo")
    private String luxianPhoto;


    /**
     * 路线出发地点
     */

    @TableField(value = "luxian_address")
    private String luxianAddress;


    /**
     * 路线途径地点
     */

    @TableField(value = "luxian_tujing_address")
    private String luxianTujingAddress;


    /**
     * 路线目的地点
     */

    @TableField(value = "luxian_mudi_address")
    private String luxianMudiAddress;


    /**
     * 赞
     */

    @TableField(value = "zan_number")
    private Integer zanNumber;


    /**
     * 踩
     */

    @TableField(value = "cai_number")
    private Integer caiNumber;


    /**
     * 路线类型
     */

    @TableField(value = "luxian_types")
    private Integer luxianTypes;


    /**
     * 路线热度
     */

    @TableField(value = "luxian_clicknum")
    private Integer luxianClicknum;


    /**
     * 路线详情
     */

    @TableField(value = "luxian_content")
    private String luxianContent;


    /**
     * 逻辑删除
     */

    @TableField(value = "luxian_delete")
    private Integer luxianDelete;


    /**
     * 录入时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "create_time")
    private Date createTime;


    /**
	 * 设置：主键
	 */
    public Integer getId() {
        return id;
    }


    /**
	 * 获取：主键
	 */

    public void setId(Integer id) {
        this.id = id;
    }
    /**
	 * 设置：景点
	 */
    public Integer getJingdainId() {
        return jingdainId;
    }


    /**
	 * 获取：景点
	 */

    public void setJingdainId(Integer jingdainId) {
        this.jingdainId = jingdainId;
    }
    /**
	 * 设置：路线名称
	 */
    public String getLuxianName() {
        return luxianName;
    }


    /**
	 * 获取：路线名称
	 */

    public void setLuxianName(String luxianName) {
        this.luxianName = luxianName;
    }
    /**
	 * 设置：路线编号
	 */
    public String getLuxianUuidNumber() {
        return luxianUuidNumber;
    }


    /**
	 * 获取：路线编号
	 */

    public void setLuxianUuidNumber(String luxianUuidNumber) {
        this.luxianUuidNumber = luxianUuidNumber;
    }
    /**
	 * 设置：路线照片
	 */
    public String getLuxianPhoto() {
        return luxianPhoto;
    }


    /**
	 * 获取：路线照片
	 */

    public void setLuxianPhoto(String luxianPhoto) {
        this.luxianPhoto = luxianPhoto;
    }
    /**
	 * 设置：路线出发地点
	 */
    public String getLuxianAddress() {
        return luxianAddress;
    }


    /**
	 * 获取：路线出发地点
	 */

    public void setLuxianAddress(String luxianAddress) {
        this.luxianAddress = luxianAddress;
    }
    /**
	 * 设置：路线途径地点
	 */
    public String getLuxianTujingAddress() {
        return luxianTujingAddress;
    }


    /**
	 * 获取：路线途径地点
	 */

    public void setLuxianTujingAddress(String luxianTujingAddress) {
        this.luxianTujingAddress = luxianTujingAddress;
    }
    /**
	 * 设置：路线目的地点
	 */
    public String getLuxianMudiAddress() {
        return luxianMudiAddress;
    }


    /**
	 * 获取：路线目的地点
	 */

    public void setLuxianMudiAddress(String luxianMudiAddress) {
        this.luxianMudiAddress = luxianMudiAddress;
    }
    /**
	 * 设置：赞
	 */
    public Integer getZanNumber() {
        return zanNumber;
    }


    /**
	 * 获取：赞
	 */

    public void setZanNumber(Integer zanNumber) {
        this.zanNumber = zanNumber;
    }
    /**
	 * 设置：踩
	 */
    public Integer getCaiNumber() {
        return caiNumber;
    }


    /**
	 * 获取：踩
	 */

    public void setCaiNumber(Integer caiNumber) {
        this.caiNumber = caiNumber;
    }
    /**
	 * 设置：路线类型
	 */
    public Integer getLuxianTypes() {
        return luxianTypes;
    }


    /**
	 * 获取：路线类型
	 */

    public void setLuxianTypes(Integer luxianTypes) {
        this.luxianTypes = luxianTypes;
    }
    /**
	 * 设置：路线热度
	 */
    public Integer getLuxianClicknum() {
        return luxianClicknum;
    }


    /**
	 * 获取：路线热度
	 */

    public void setLuxianClicknum(Integer luxianClicknum) {
        this.luxianClicknum = luxianClicknum;
    }
    /**
	 * 设置：路线详情
	 */
    public String getLuxianContent() {
        return luxianContent;
    }


    /**
	 * 获取：路线详情
	 */

    public void setLuxianContent(String luxianContent) {
        this.luxianContent = luxianContent;
    }
    /**
	 * 设置：逻辑删除
	 */
    public Integer getLuxianDelete() {
        return luxianDelete;
    }


    /**
	 * 获取：逻辑删除
	 */

    public void setLuxianDelete(Integer luxianDelete) {
        this.luxianDelete = luxianDelete;
    }
    /**
	 * 设置：录入时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：录入时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间  show1 show2 photoShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
