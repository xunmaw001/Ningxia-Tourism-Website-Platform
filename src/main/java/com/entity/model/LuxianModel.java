package com.entity.model;

import com.entity.LuxianEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 路线
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class LuxianModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 景点
     */
    private Integer jingdainId;


    /**
     * 路线名称
     */
    private String luxianName;


    /**
     * 路线编号
     */
    private String luxianUuidNumber;


    /**
     * 路线照片
     */
    private String luxianPhoto;


    /**
     * 路线出发地点
     */
    private String luxianAddress;


    /**
     * 路线途径地点
     */
    private String luxianTujingAddress;


    /**
     * 路线目的地点
     */
    private String luxianMudiAddress;


    /**
     * 赞
     */
    private Integer zanNumber;


    /**
     * 踩
     */
    private Integer caiNumber;


    /**
     * 路线类型
     */
    private Integer luxianTypes;


    /**
     * 路线热度
     */
    private Integer luxianClicknum;


    /**
     * 路线详情
     */
    private String luxianContent;


    /**
     * 逻辑删除
     */
    private Integer luxianDelete;


    /**
     * 录入时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间  show1 show2 photoShow
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
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
	 * 获取：创建时间  show1 show2 photoShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间  show1 show2 photoShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
