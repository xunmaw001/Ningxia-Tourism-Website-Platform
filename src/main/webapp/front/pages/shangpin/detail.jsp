<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>商品详情页</title>
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css">
</head>
<style>
    .particulars {
        width: 90%;
        background-color: #fff;
        border-bottom: 1px dotted var(--publicMainColor);
        padding: 10px 0;
    }

    .dataExhibition {
        display: inline-block;
        width: 60%;
    }

    .displayBianhao {
        display: inline-block;
        width: auto;
    }

    .detail-tab .layui-tab-card>.layui-tab-title .layui-this{
        border: 2px dotted var(--publicMainColor);
        background-color: #fff;
        color: #000;
    }</style>
<body>

    <div id="app">
<div style="width: 1000px;margin: 10px auto;height: auto;">
    <div style="border: 1px  dotted var(--publicMainColor);border-radius: 15px;margin-top:25px;height: 50px;line-height: 50px;padding-left: 15px;display: flex;justify-content: space-between;align-items: center;padding-right: 15px;">
        <span>
            <a style="color: #000;" href="../home/home.jsp">
                首页
            </a>/
            <a>
                <cite style="color: #815476;">
                    {{title}}
                </cite>
            </a>
        </span>
        <a v-if='storeupFlag' @click="addShangpinCollection()" href="javascript:void(0)" style="text-decoration: none;display: block;width: 40px;height: 40px; border-radius: 50%;text-align: center;line-height: 40px;background-color: #fff;">
            <i class="layui-icon" style="font-size: 40px;color: red;" v-if='true'>&#xe67a;</i>
        </a>
        <a style="text-decoration: none;display: block;width: 40px;height: 40px; border-radius: 50%;text-align: center;line-height: 40px;background-color: #fff;"
           v-if='!storeupFlag' @click="addShangpinCollection()" href="javascript:void(0)">
            <i class="layui-icon" style="font-size: 40px;color: red;" v-if='true'>&#xe67b;</i>
        </a>
    </div>
    <div style="display: flex;margin-top: 20px;">
        <!-- 详情介绍 -->
        <div style="width: 50%;height: auto;">
            <div class="particulars" style="text-align: center;font-size: 18px;">
                <span>{{title}}</span>
            </div>
                  <div v-if="detail.shangpinUuidNumber" class="particulars">
                      <span class="displayBianhao">商品编号:</span>
                      <span class="dataExhibition"> {{detail.shangpinUuidNumber}} </span>
                  </div>
                  <div v-if="detail.shangpinAddress" class="particulars">
                      <span class="displayBianhao">商品地点:</span>
                      <span class="dataExhibition"> {{detail.shangpinAddress}} </span>
                  </div>
                  <div v-if="detail.zanNumber" class="particulars">
                      <span class="displayBianhao">赞:</span>
                      <span class="dataExhibition"> {{detail.zanNumber}} </span>
                  </div>
                  <div v-if="detail.caiNumber" class="particulars">
                      <span class="displayBianhao">踩:</span>
                      <span class="dataExhibition"> {{detail.caiNumber}} </span>
                  </div>
                  <div v-if="detail.shangpinTypes" class="particulars">
                      <span class="displayBianhao">商品类型:</span>
                      <span class="dataExhibition"> {{detail.shangpinValue}} </span>
                  </div>
                  <div v-if="detail.shangpinKucunNumber" class="particulars">
                      <span class="displayBianhao">商品库存:</span>
                      <span class="dataExhibition"> {{detail.shangpinKucunNumber}} </span>
                  </div>
                  <div v-if="detail.shangpinNewMoney" class="particulars">
                      <span class="displayBianhao">金额:</span>
                      <span class="dataExhibition"> {{detail.shangpinNewMoney}} </span>
                  </div>
                  <div v-if="detail.shangpinClicknum" class="particulars">
                      <span class="displayBianhao">商品热度:</span>
                      <span class="dataExhibition"> {{detail.shangpinClicknum}} </span>
                  </div>
                  <div style="color: red" class="particulars" @click="jump('../shangjia/detail.jsp?id='+detail.shangjiaId)">
                      <span class="displayBianhao">查看所属商家:</span>
                      <span class="dataExhibition">  {{ detail.shangjiaName }} </span>
                  </div>
                  <div class="particulars">
                      <!-- 赞 踩 -->
                      <div style="display:flex;">
                          <div v-if="zanFlag == 0 && caiFlag == 0" @click="zanNumberClick()" style="display: flex;align-items: center;" >
                              <i class="layui-icon" style="font-size: 20px;color: red;margin-right: 10px;">&#xe6c6;</i>
                              ({{detail.zanNumber}})
                          </div>
                          <div v-if="zanFlag == 0 && caiFlag == 0" @click="caiNumberClick()" style="display: flex;align-items: center;" >
                              <i class="layui-icon" style="font-size: 20px;color: red;margin-right: 10px;">&#xe6c5;</i>
                              ({{detail.caiNumber}})
                          </div>
                          <!-- 已赞 -->
                          <div v-if="zanFlag == 1" @click="zanNumberClick()" style="display: flex;align-items: center;">
                              <i class="layui-icon" style="font-size: 20px;color: red;margin-right: 10px;">&#xe6c6;</i>
                              ({{detail.zanNumber}})
                          </div>
                          <!-- 已踩 -->
                          <div v-if="caiFlag == 1" @click="caiNumberClick()" style="display: flex;align-items: center;">
                              <i class="layui-icon" style="font-size: 20px;color: red;margin-right: 10px;">&#xe6c5;</i>
                              ({{detail.caiNumber}})
                          </div>
                      </div>
                  </div>
        </div>
        <!-- 图片 -->
        <div style="width: 50%;height: auto;">
            <div>
                <div v-if="swiperList.length" v-for="(item,index) in swiperList" :key="index">
                    <img style="width: 100%;height: 100%;object-fit:cover;" :src="baseUrl+item" />
                </div>
            </div>
        </div>
    </div>
    <!-- 按钮 -->
    <div style="width: 100%;">
        <div  style="display: flex;margin-top: 30px;justify-content: center;border-bottom:1px dotted var(--publicMainColor) ;border-top:1px dotted var(--publicMainColor) ;padding: 20px;align-items: center;">
            <button style="height:auto;"
                    :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(244, 121, 131, 1)","color":"#666","borderRadius":"4px 0 0 4px","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                    type="button" @click="buyNumber>0?buyNumber--:buyNumber"
                    class="layui-btn layui-btn-primary">
                -
            </button>
            <input style="text-align:center;padding:10px 20px;width:300px;"
                   :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(255, 242, 223, 1)","color":"rgba(255, 45, 81, 1)","borderRadius":"0","borderWidth":"1px 0","width":"44px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                   type="number" v-model="buyNumber" id="buyNumber" name="buyNumber" class="layui-input"
                   disabled="disabled" />
            <button style="height:auto;"
                    :style='{"padding":"0","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(68, 206, 246, 1)","color":"#666","borderRadius":"0 4px 4px 0","borderWidth":"1px","width":"34px","lineHeight":"34px","fontSize":"14px","borderStyle":"solid"}'
                    type="button" @click="buyNumber++" class="layui-btn layui-btn-primary">
                +
            </button>
            <button @click="addShangpinOrder()" style="height:auto;"
                    :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}'
                    type="button" class="layui-btn btn-submit">
                立即购买
            </button>
            <!--
             <button @click="shangpinYuyue()" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}' type="button" class="layui-btn btn-submit">
                 立即预约
             </button>
        -->
        </div>
    </div>

    <!-- 视频 -->


    <!-- 评论 -->
    <div class="layui-row detail-tab" style="border: none;box-shadow: none;">
        <div class="layui-tab layui-tab-card" style="overflow: hidden;border: none; box-shadow: none;">
            <ul class="layui-tab-title " :style='{"backgroundColor":"#fff","fontSize":"14px"}' style="color: var(--publicMainColor);border: none;">
                <li class="layui-this">商品介绍</li>
                <li>评论</li>
            </ul>

            <div class="layui-tab-content" style="border: 1px dotted var(--publicMainColor);border-radius: 15px;margin-top: 10px;margin-bottom: 50px;">
                <div class="layui-tab-item layui-show">
                    <div v-html="myFilters(detail.shangpinContent)"></div>
                </div>
                <div class="layui-tab-item">
                    <div class="message-container">
                        <div class="message-list"
                             :style='{"padding":"0 20px 20px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"var(--publicSubColor)}","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"dotted"}'>
                            <div v-for="(item,index) in shangpinCommentbackDataList" v-bind:key="index"
                                 :style='{"padding":"20px 0","boxShadow":"0 0 0px rgba(255,0,0,0)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","borderRadius":"0","borderWidth":"0 0 1px 0","borderStyle":"dotted"}'
                                 class="message-item">
                                <div class="username-container" style="display: flex;justify-content: space-between;">
                                    <div style="display:flex;">
                                        <img :src="baseUrl+item.yonghuPhoto"
                                             :style='{"boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 10px 0 0","borderColor":"rgba(0,0,0,.3)","borderRadius":"50%","borderWidth":"0","width":"40px","borderStyle":"dotted","height":"40px"}'
                                             class="avator">
                                        <span style="display: inline-block;"
                                              :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","color":"rgba(6, 82, 121, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"dotted"}'
                                              class="username">
                                            {{item.yonghuName}}
                                        </span>
                                        <el-rate v-if="item.shangpinCommentbackPingfenNumber" v-model="item.shangpinCommentbackPingfenNumber" disabled show-score text-color="#ff9900"
                                                 score-template="{value}">
                                        </el-rate>
                                    </div>
                                    <span style="font-size: 12px">{{item.insertTime}}</span>
                                </div>
                                <div class="content" style="margin: 0;flex: 1;">
												<span class="message main_color" style="display: inline-block;"
                                                      :style='{"padding":"8px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(255, 0, 0, 0)","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"dotted"}'>
													留言:{{item.shangpinCommentbackText}}
												</span>
                                </div>
                                <div v-if="item.replyText" class="content" style="margin: 0;flex: 1;">
												<span class="message sub_color" style="display: inline-block;"
                                                      :style='{"padding":"8px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(255, 0, 0, 0)","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"dotted"}'>
													回复:{{item.replyText}}
												</span>
                                </div>
                            </div>
                        </div>
                        <div class="pager" id="CommentbackPager"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>    </div>


    <script src="../../layui/layui.js"></script>
    <script src="../../js/vue.js"></script>
    <!-- 引入element组件库 -->
    <script src="../../xznstatic/js/element.min.js"></script>
    <!-- 引入element样式 -->
    <link rel="stylesheet" href="../../xznstatic/css/element.min.css">
    <!-- 组件配置信息 -->
    <script src="../../js/config.js"></script>
    <!-- 扩展插件配置信息 -->
    <script src="../../modules/config.js"></script>
    <!-- 工具方法 -->
    <script src="../../js/utils.js"></script>

    <script>
        Vue.prototype.myFilters= function (msg) {
            if(msg != null){
                return msg.replace(/\n/g, "<br>");
            }else{
                return "";
            }
        };
        var vue = new Vue({
            el: '#app',
            data: {
                userId: localStorage.getItem("userid"),//当前登录人的id
                sessionTable: localStorage.getItem("userTable"),//登录账户所在表名
                role: localStorage.getItem("role"),//权限
                user:{},//当前登录用户信息
                // 轮播图
                swiperList: [],//用于当前表的图片
                // 数据详情
                detail: {
                    id: 0
                },
                // 商品标题
                title: '',
                totalScore: 0,//评分
                baseUrl:"",//路径
                storeupFlag: 0,//收藏 [0为收藏 1已收藏]
                zanFlag: 0,//赞 [0 未赞 1 已赞]
                caiFlag: 0,//踩 [0 未踩 1 已踩]
                //系统推荐
                shangpinRecommendList: [],
    <!-- 是订单并且非座位才有购物车 -->
                // 加入购物车数量
                buyNumber: 1,
                // 当前详情页表
                detailTable: 'shangpin',
                // 评价列表
                shangpinCommentbackDataList: [],
            },
            methods: {
                //分享
                share(){
                    let element = createElement("http://localhost:8080/ningxialvyouwangzhan/front/index.jsp?url="+"./pages/shangpin/detail.jsp?id="+this.id);
                    element.select();
                    element.setSelectionRange(0, element.value.length);
                    document.execCommand('copy');
                    element.remove();
                    layui.layer.msg('复制分享页面成功,快去分享吧!', {time: 2000,icon: 6});
                },

                jump(url) {
                    jump(url)
                },
                isAuth(tablename, button) {
                    return isFrontAuth(tablename, button)
                },
                //预约
                shangpinYuyue(){
                    let _this = this;
                    var mymessage = confirm("确定要预约吗？");if(!mymessage){return false;}
                    // localStorage.setItem('shangpinId', _this.detail.id);
                    // _this.jump("../shangpinOrder/add.jsp");

                    let data={
                        shangpinId:_this.detail.id,
                        yonghuId:localStorage.getItem("userid"),
                        shangpinOrderYesnoTypes:1,
                    }
                    // 提交数据
                    layui.http.requestJson('shangpinOrder/add', 'post', data, function (res) {
                        if(res.code == 0) {
                            layui.layer.msg('预约成功', {
                                time: 2000,
                                icon: 6
                            }, function () {
                                _this.jump("../shangpinOrder/list.jsp");
                            });
                        }else{
                            layui.layer.msg(res.msg, {
                                time: 5000,
                                icon: 5
                            });
                        }
                    });
                },
                // 收藏商品
                addShangpinCollection() {
                    let _this = this;
                    layui.http.request('shangpinCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                        shangpinId: _this.detail.id,
                        shangpinCollectionTypes: 1,
                        yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.list.length == 1) {
                            layui.http.requestJson('shangpinCollection/delete', 'post', [res.data.list[0].id], function (res) {
                                layui.layer.msg('取消成功', {
                                    time: 1000,
                                    icon: 5
                                }, function () {
                                    window.location.reload();
                                });
                            });
                            return false;
                        }
                        layui.http.requestJson('shangpinCollection/add', 'post', {
                            yonghuId: localStorage.getItem('userid'),
                            shangpinId: _this.detail.id,
                            shangpinCollectionTypes: 1,
                        }, function (res) {
                            layui.layer.msg('收藏成功', {
                                time: 1000,
                                icon: 6
                            }, function () {
                                window.location.reload();
                            });
                        });
                    });
                },
                // 赞
                zanNumberClick() {
                    let _this = this;
                    layui.http.request('shangpinCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                        shangpinId: _this.detail.id,
                        shangpinCollectionTypes: 2,
                        yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.total == 1) {
                            layui.http.requestJson('shangpinCollection/delete', 'post', [res.data.list[0].id], function (res) {
                                _this.detail.zanNumber = _this.detail.zanNumber - 1;
                                layui.http.requestJson(`shangpin/update`, 'POST', _this.detail, (res1) => {
                                    if(res1.code==0){
                                        layui.layer.msg('取消点赞成功', {
                                            time: 1000,
                                            icon: 6
                                        }, function () {
                                            _this.zanFlag =0;
                                        });
                                    }else{
                                        layui.layer.msg('取消点赞失败', {
                                            time: 1000,
                                            icon: 5
                                        }, function () {
                                            return false;
                                        });
                                    }
                                });
                            });
                        }else{
                            layui.http.requestJson('shangpinCollection/add', 'post', {
                                    yonghuId: localStorage.getItem('userid'),
                                    shangpinId: _this.detail.id,
                                    shangpinCollectionTypes: 2,
                            }, function (res) {
                                _this.detail.zanNumber = _this.detail.zanNumber + 1;
                                layui.http.requestJson(`shangpin/update`, 'POST', _this.detail, (res1) => {
                                    if(res1.code==0){
                                        layui.layer.msg('点赞成功', {
                                            time: 1000,
                                            icon: 6
                                        }, function () {
                                            _this.zanFlag =1;
                                        });
                                    }else{
                                        layui.layer.msg('点赞失败', {
                                            time: 1000,
                                            icon: 5
                                        }, function () {
                                            return false;
                                        });
                                    }
                                });
                            });
                        }
                    });
                },

                // 踩
                caiNumberClick() {
                    let _this = this;
                    layui.http.request('shangpinCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                            shangpinId: _this.detail.id,
                            shangpinCollectionTypes: 3,
                            yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.total == 1) {
                            layui.http.requestJson('shangpinCollection/delete', 'post', [res.data.list[0].id], function (res) {

                                _this.detail.caiNumber = _this.detail.caiNumber - 1;
                                layui.http.requestJson(`shangpin/update`, 'POST',_this.detail , (res1) => {
                                    if(res1.code==0){
                                        layui.layer.msg('取消点踩成功', {
                                            time: 1000,
                                            icon: 6
                                        }, function () {
                                            _this.caiFlag =0;
                                        });
                                    }else{
                                        layui.layer.msg('取消点踩失败', {
                                            time: 1000,
                                            icon: 5
                                        }, function () {
                                            return false;
                                        });
                                    }
                                });
                            });
                        }else{
                            layui.http.requestJson('shangpinCollection/add', 'post', {
                                    yonghuId: localStorage.getItem('userid'),
                                    shangpinId: _this.detail.id,
                                    shangpinCollectionTypes: 3,
                            }, function (res) {
                                _this.detail.caiNumber = _this.detail.caiNumber + 1;
                                layui.http.requestJson(`shangpin/update`, 'POST', _this.detail, (res1) => {
                                    if(res1.code==0){
                                        layui.layer.msg('点踩成功', {
                                            time: 1000,
                                            icon: 6
                                        }, function () {
                                            _this.caiFlag =1;
                                        });
                                    }else{
                                        layui.layer.msg('点踩失败', {
                                            time: 1000,
                                            icon: 5
                                        }, function () {
                                            return false;
                                        });
                                    }
                                });
                            });
                        }
                    });
                },
                // 立即购买
                addShangpinOrder() {
                                                                                                          // 库存限制
                    if (this.detail.shangpinKucunNumber > 0 && this.detail.shangpinKucunNumber < this.buyNumber) {
                        layui.layer.msg(`商品库存不足`, {
                            time: 2000,
                            icon: 5
                        });
                        return false;
                    }
                    // 保存到storage中，在确认下单页面中获取要购买的商品
                localStorage.setItem('shangpins', JSON.stringify([{
                        shangpinId: vue.detail.id,
                    shangjiaId: vue.detail.shangjiaId,
                    shangpinName: vue.detail.shangpinName,
                    shangpinUuidNumber: vue.detail.shangpinUuidNumber,
                    shangpinPhoto: vue.detail.shangpinPhoto,
                    shangpinAddress: vue.detail.shangpinAddress,
                    zanNumber: vue.detail.zanNumber,
                    caiNumber: vue.detail.caiNumber,
                    shangpinTypes: vue.detail.shangpinTypes,
                    shangpinKucunNumber: vue.detail.shangpinKucunNumber,
                    shangpinNewMoney: vue.detail.shangpinNewMoney,
                    shangpinClicknum: vue.detail.shangpinClicknum,
                    shangpinContent: vue.detail.shangpinContent,
                    shangpinDelete: vue.detail.shangpinDelete,
                    createTime: vue.detail.createTime,
                        buyNumber: this.buyNumber,
                    yonghuId: localStorage.getItem('userid'),
                }]));
                    // 跳转到确认下单页面
                    jump('../shangpinOrder/confirm.jsp');
                },

                }
        });

        layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery', 'laypage', 'util'], function () {
            var layer = layui.layer;
            var util = layui.util;
            var element = layui.element;
            var form = layui.form;
            var carousel = layui.carousel;
            var http = layui.http;
            var jquery = layui.jquery;
            var laypage = layui.laypage;
            vue.baseUrl = http.baseurl

            localStorage.setItem("goUtl","./pages/shangpin/detail.jsp?id="+ http.getParam('id'))

            var limit = 10;

            let table = localStorage.getItem("userTable");
            if(table){
                http.request(table+"/session", 'get', {}, function (data) {
                    vue.user = data.data;
                });
            }

            // 数据ID
            var id = http.getParam('id');
            vue.detail.id = id;
            // 数据信息
            http.request(`${vue.detailTable}/detail/` + id, 'get', {}, function (res) {
                // 详情信息
                vue.detail = res.data;
                vue.title = vue.detail.shangpinName;
                vue.detail.shangpinContent = vue.detail.shangpinContent.replaceAll("src=\"upload/","src=\""+vue.baseUrl+"upload/");
                // 轮播图片
                vue.swiperList = vue.detail.shangpinPhoto ? vue.detail.shangpinPhoto.split(",") : [];
                // 轮播图
                vue.$nextTick(() => {
                    carousel.render({
                        elem: '#swiper',
                        width: '420px',
                        height: '400px',
                        arrow: 'hover',
                        anim: 'default',
                        autoplay: 'true',
                        interval: '3000',
                        indicator: 'inside'
                    });
                });

            });


            // 系统推荐
            http.request(`shangpin/gexingtuijian`, 'get', {
                page: 1,
                limit: 5,
                shangpinTypes: vue.detail.shangpinTypes,
                shangpinDelete: 1,
            }, function (res) {
                vue.shangpinRecommendList = res.data.list;
            });

            if (localStorage.getItem('userid')) {
                http.request('shangpinCollection/list', 'get', {
                    page: 1,
                    limit: 1,
                    shangpinId: vue.detail.id,
                    yonghuId: localStorage.getItem('userid'),
                }, function (res) {
                    if(res.data.total >0){
                        res.data.list.forEach(element => {
                            if (element.shangpinCollectionTypes == 1) {
                                vue.storeupFlag = 1;
                            }
                            if (element.shangpinCollectionTypes == 2) {
                                vue.zanFlag = 1;
                            }
                            if (element.shangpinCollectionTypes == 3) {
                                vue.caiFlag = 1;
                            }
                        });

                    }
                });
            }


            // 获取评价
            http.request(`${vue.detailTable}Commentback/list`, 'get', {
                page: 1,
                limit: limit,
                shangpinId: vue.detail.id
            }, function (res) {
                vue.shangpinCommentbackDataList = res.data.list;
                // 分页
                laypage.render({
                    elem: 'LiuyanPager',
                    count: res.data.total,
                    limit: limit,
                    jump: function (obj, first) {
                        //首次不执行
                        if (!first) {
                            http.request(`${vue.detailTable}Commentback/list`, 'get', {
                                page: obj.curr,
                                limit: obj.limit,
                                shangpinId: vue.detail.id
                            }, function (res) {
                                vue.shangpinCommentbackDataList = res.data.list
                            })
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
