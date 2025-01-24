package com.entity.model;

import com.entity.JingdainEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 景点介绍
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class JingdainModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 景点名称
     */
    private String jingdainName;


    /**
     * 景点编号
     */
    private String jingdainUuidNumber;


    /**
     * 景点照片
     */
    private String jingdainPhoto;


    /**
     * 景点地点
     */
    private String jingdainAddress;


    /**
     * 赞
     */
    private Integer zanNumber;


    /**
     * 踩
     */
    private Integer caiNumber;


    /**
     * 景点类型
     */
    private Integer jingdainTypes;


    /**
     * 景点门票
     */
    private Integer jingdainKucunNumber;


    /**
     * 现价/积分
     */
    private Double jingdainNewMoney;


    /**
     * 景点热度
     */
    private Integer jingdainClicknum;


    /**
     * 景点介绍
     */
    private String jingdainContent;


    /**
     * 逻辑删除
     */
    private Integer jingdainDelete;


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
