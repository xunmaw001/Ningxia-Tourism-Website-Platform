package com.entity.vo;

import com.entity.JingdainOrderEntity;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

/**
 * 景点订单
 * 手机端接口返回实体辅助类
 * （主要作用去除一些不必要的字段）
 */
@TableName("jingdain_order")
public class JingdainOrderVO implements Serializable {
    private static final long serialVersionUID = 1L;


    /**
     * 主键
     */

    @TableField(value = "id")
    private Integer id;


    /**
     * 订单编号
     */

    @TableField(value = "jingdain_order_uuid_number")
    private String jingdainOrderUuidNumber;


    /**
     * 景点
     */

    @TableField(value = "jingdain_id")
    private Integer jingdainId;


    /**
     * 用户
     */

    @TableField(value = "yonghu_id")
    private Integer yonghuId;


    /**
     * 购买数量
     */

    @TableField(value = "buy_number")
    private Integer buyNumber;


    /**
     * 预约时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "jingdain_order_time")
    private Date jingdainOrderTime;


    /**
     * 实付价格
     */

    @TableField(value = "jingdain_order_true_price")
    private Double jingdainOrderTruePrice;


    /**
     * 订单类型
     */

    @TableField(value = "jingdain_order_types")
    private Integer jingdainOrderTypes;


    /**
     * 订单创建时间
     */
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat

    @TableField(value = "insert_time")
    private Date insertTime;


    /**
     * 创建时间 show3 listShow
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
	 * 设置：订单编号
	 */
    public String getJingdainOrderUuidNumber() {
        return jingdainOrderUuidNumber;
    }


    /**
	 * 获取：订单编号
	 */

    public void setJingdainOrderUuidNumber(String jingdainOrderUuidNumber) {
        this.jingdainOrderUuidNumber = jingdainOrderUuidNumber;
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
	 * 设置：用户
	 */
    public Integer getYonghuId() {
        return yonghuId;
    }


    /**
	 * 获取：用户
	 */

    public void setYonghuId(Integer yonghuId) {
        this.yonghuId = yonghuId;
    }
    /**
	 * 设置：购买数量
	 */
    public Integer getBuyNumber() {
        return buyNumber;
    }


    /**
	 * 获取：购买数量
	 */

    public void setBuyNumber(Integer buyNumber) {
        this.buyNumber = buyNumber;
    }
    /**
	 * 设置：预约时间
	 */
    public Date getJingdainOrderTime() {
        return jingdainOrderTime;
    }


    /**
	 * 获取：预约时间
	 */

    public void setJingdainOrderTime(Date jingdainOrderTime) {
        this.jingdainOrderTime = jingdainOrderTime;
    }
    /**
	 * 设置：实付价格
	 */
    public Double getJingdainOrderTruePrice() {
        return jingdainOrderTruePrice;
    }


    /**
	 * 获取：实付价格
	 */

    public void setJingdainOrderTruePrice(Double jingdainOrderTruePrice) {
        this.jingdainOrderTruePrice = jingdainOrderTruePrice;
    }
    /**
	 * 设置：订单类型
	 */
    public Integer getJingdainOrderTypes() {
        return jingdainOrderTypes;
    }


    /**
	 * 获取：订单类型
	 */

    public void setJingdainOrderTypes(Integer jingdainOrderTypes) {
        this.jingdainOrderTypes = jingdainOrderTypes;
    }
    /**
	 * 设置：订单创建时间
	 */
    public Date getInsertTime() {
        return insertTime;
    }


    /**
	 * 获取：订单创建时间
	 */

    public void setInsertTime(Date insertTime) {
        this.insertTime = insertTime;
    }
    /**
	 * 设置：创建时间 show3 listShow
	 */
    public Date getCreateTime() {
        return createTime;
    }


    /**
	 * 获取：创建时间 show3 listShow
	 */

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

}
