package com.entity.model;

import com.entity.JingdainOrderEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;


/**
 * 景点订单
 * 接收传参的实体类
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了）
 * 取自ModelAndView 的model名称
 */
public class JingdainOrderModel implements Serializable {
    private static final long serialVersionUID = 1L;




    /**
     * 主键
     */
    private Integer id;


    /**
     * 订单编号
     */
    private String jingdainOrderUuidNumber;


    /**
     * 景点
     */
    private Integer jingdainId;


    /**
     * 用户
     */
    private Integer yonghuId;


    /**
     * 购买数量
     */
    private Integer buyNumber;


    /**
     * 预约时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date jingdainOrderTime;


    /**
     * 实付价格
     */
    private Double jingdainOrderTruePrice;


    /**
     * 订单类型
     */
    private Integer jingdainOrderTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
    private Date insertTime;


    /**
     * 创建时间 show3 listShow
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
	 * 获取：订单编号
	 */
    public String getJingdainOrderUuidNumber() {
        return jingdainOrderUuidNumber;
    }


    /**
	 * 设置：订单编号
	 */
    public void setJingdainOrderUuidNumber(String jingdainOrderUuidNumber) {
        this.jingdainOrderUuidNumber = jingdainOrderUuidNumber;
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
	 * 获取：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 设置：用户
	 */
    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 获取：购买数量
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }


    /**
	 * 设置：购买数量
	 */
    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 获取：预约时间
	 */
    public Date getJingdainOrderTime() {
        return jingdainOrderTime;
    }


    /**
	 * 设置：预约时间
	 */
    public void setJingdainOrderTime(Date jingdainOrderTime) {
        this.jingdainOrderTime = jingdainOrderTime;
    }
    /**
	 * 获取：实付价格
	 */
    public Double getJingdainOrderTruePrice() {
        return jingdainOrderTruePrice;
    }


    /**
	 * 设置：实付价格
	 */
    public void setJingdainOrderTruePrice(Double jingdainOrderTruePrice) {
        this.jingdainOrderTruePrice = jingdainOrderTruePrice;
    }
    /**
	 * 获取：订单类型
	 */
    public Integer getJingdainOrderTypes() {
        return jingdainOrderTypes;
    }


    /**
	 * 设置：订单类型
	 */
    public void setJingdainOrderTypes(Integer jingdainOrderTypes) {
        this.jingdainOrderTypes = jingdainOrderTypes;
    }
    /**
	 * 获取：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 设置：订单创建时间
	 */
    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 获取：创建时间 show3 listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 设置：创建时间 show3 listShow
	 */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    }
