<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>路线详情页</title>
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
        <a v-if='storeupFlag' @click="addLuxianCollection()" href="javascript:void(0)" style="text-decoration: none;display: block;width: 40px;height: 40px; border-radius: 50%;text-align: center;line-height: 40px;background-color: #fff;">
            <i class="layui-icon" style="font-size: 40px;color: red;" v-if='true'>&#xe67a;</i>
        </a>
        <a style="text-decoration: none;display: block;width: 40px;height: 40px; border-radius: 50%;text-align: center;line-height: 40px;background-color: #fff;"
           v-if='!storeupFlag' @click="addLuxianCollection()" href="javascript:void(0)">
            <i class="layui-icon" style="font-size: 40px;color: red;" v-if='true'>&#xe67b;</i>
        </a>
    </div>
    <div style="display: flex;margin-top: 20px;">
        <!-- 详情介绍 -->
        <div style="width: 50%;height: auto;">
            <div class="particulars" style="text-align: center;font-size: 18px;">
                <span>{{title}}</span>
            </div>
                  <div v-if="detail.luxianUuidNumber" class="particulars">
                      <span class="displayBianhao">路线编号:</span>
                      <span class="dataExhibition"> {{detail.luxianUuidNumber}} </span>
                  </div>
                  <div v-if="detail.luxianAddress" class="particulars">
                      <span class="displayBianhao">路线出发地点:</span>
                      <span class="dataExhibition"> {{detail.luxianAddress}} </span>
                  </div>
                  <div v-if="detail.luxianTujingAddress" class="particulars">
                      <span class="displayBianhao">路线途径地点:</span>
                      <span class="dataExhibition"> {{detail.luxianTujingAddress}} </span>
                  </div>
                  <div v-if="detail.luxianMudiAddress" class="particulars">
                      <span class="displayBianhao">路线目的地点:</span>
                      <span class="dataExhibition"> {{detail.luxianMudiAddress}} </span>
                  </div>
                  <div v-if="detail.zanNumber" class="particulars">
                      <span class="displayBianhao">赞:</span>
                      <span class="dataExhibition"> {{detail.zanNumber}} </span>
                  </div>
                  <div v-if="detail.caiNumber" class="particulars">
                      <span class="displayBianhao">踩:</span>
                      <span class="dataExhibition"> {{detail.caiNumber}} </span>
                  </div>
                  <div v-if="detail.luxianTypes" class="particulars">
                      <span class="displayBianhao">路线类型:</span>
                      <span class="dataExhibition"> {{detail.luxianValue}} </span>
                  </div>
                  <div v-if="detail.luxianClicknum" class="particulars">
                      <span class="displayBianhao">路线热度:</span>
                      <span class="dataExhibition"> {{detail.luxianClicknum}} </span>
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
            <!--
             <button @click="luxianYuyue()" style="height:auto;" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 5px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(23, 124, 176, 1)","color":"rgba(255, 255, 255, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","lineHeight":"40px","fontSize":"16px","borderStyle":"solid"}' type="button" class="layui-btn btn-submit">
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
                <li class="layui-this">路线详情</li>
                <li>留言</li>
            </ul>

            <div class="layui-tab-content" style="border: 1px dotted var(--publicMainColor);border-radius: 15px;margin-top: 10px;margin-bottom: 50px;">
                <div class="layui-tab-item layui-show">
                    <div v-html="myFilters(detail.luxianContent)"></div>
                </div>
                <div class="layui-tab-item">
                    <div class="message-container">
                        <form class="layui-form message-form"
                              :style='{"padding":"20px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0 0 20px 0","borderColor":"rgba(135, 206, 250, 1)","backgroundColor":"#fff","borderRadius":"10px","borderWidth":"0","borderStyle":"solid"}'>
                            <div class="layui-form-item layui-form-text"
                                 style="display: flex;align-items: center;margin:0">
                                <label style="width: auto;"
                                       :style='{"padding":"0","minWidth":"54px","fontSize":"14px","color":"#333","textAlign":"left"}'
                                       class="layui-form-label">
                                    留言
                                </label>
                                <div class="layui-input-block" style="margin:0;flex:1;">
                                    <textarea class="main_borderColor layui-textarea":style='{"padding":"10px","backgroundColor":"#fff","color":"rgba(135, 206, 250, 1)","borderRadius":"10px","borderWidth":"1px","fontSize":"14px","borderStyle":"dotted","height":"120px"}'
                                      id="luxianLiuyanText"placeholder="留言内容" required lay-verify="required"></textarea>
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button lay-submit lay-filter="luxianLiuyanText" class="layui-btn btn-submit main_backgroundColor" :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"10px 5px 0","borderColor":"rgba(0,0,0,.3)","color":"rgba(95, 89, 89, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"dotted"}'>
                                        立即提交
                                    </button>
                                    <!--<button class="layui-btn layui-btn-primary sub_backgroundColor"
                                            :style='{"padding":"0 10px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"10px 5px 0","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","width":"auto","lineHeight":"34px","fontSize":"14px","borderStyle":"dotted"}'
                                            type="reset">
                                        重置
                                    </button>-->
                                </div>
                            </div>
                        </form>
                        <div class="message-list"
                             :style='{"padding":"0 20px 20px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"0","borderColor":"var(--publicSubColor)}","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"dotted"}'>
                            <div v-for="(item,index) in luxianLiuyanDataList" v-bind:key="index"
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
                                        <el-rate v-if="item.luxianCommentbackPingfenNumber" v-model="item.luxianCommentbackPingfenNumber" disabled show-score text-color="#ff9900"
                                                 score-template="{value}">
                                        </el-rate>
                                    </div>
                                    <span style="font-size: 12px">{{item.insertTime}}</span>
                                </div>
                                <div class="content" style="margin: 0;flex: 1;">
												<span class="message main_color" style="display: inline-block;"
                                                      :style='{"padding":"8px","boxShadow":"0 0 0px rgba(255,0,0,.3)","margin":"8px 0 0 50px","borderColor":"rgba(0,0,0,.3)","backgroundColor":"rgba(255, 0, 0, 0)","borderRadius":"4px","borderWidth":"0","fontSize":"14px","borderStyle":"dotted"}'>
													留言:{{item.luxianLiuyanText}}
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
                        <div class="pager" id="LiuyanPager"></div>
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
                luxianRecommendList: [],
                    // 当前详情页表
                detailTable: 'luxian',
                // 留言列表
                luxianLiuyanDataList: [],
            },
            methods: {
                //分享
                share(){
                    let element = createElement("http://localhost:8080/ningxialvyouwangzhan/front/index.jsp?url="+"./pages/luxian/detail.jsp?id="+this.id);
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
                luxianYuyue(){
                    let _this = this;
                    var mymessage = confirm("确定要预约吗？");if(!mymessage){return false;}
                    // localStorage.setItem('luxianId', _this.detail.id);
                    // _this.jump("../luxianOrder/add.jsp");

                    let data={
                        luxianId:_this.detail.id,
                        yonghuId:localStorage.getItem("userid"),
                        luxianOrderYesnoTypes:1,
                    }
                    // 提交数据
                    layui.http.requestJson('luxianOrder/add', 'post', data, function (res) {
                        if(res.code == 0) {
                            layui.layer.msg('预约成功', {
                                time: 2000,
                                icon: 6
                            }, function () {
                                _this.jump("../luxianOrder/list.jsp");
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
                addLuxianCollection() {
                    let _this = this;
                    layui.http.request('luxianCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                        luxianId: _this.detail.id,
                        luxianCollectionTypes: 1,
                        yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.list.length == 1) {
                            layui.http.requestJson('luxianCollection/delete', 'post', [res.data.list[0].id], function (res) {
                                layui.layer.msg('取消成功', {
                                    time: 1000,
                                    icon: 5
                                }, function () {
                                    window.location.reload();
                                });
                            });
                            return false;
                        }
                        layui.http.requestJson('luxianCollection/add', 'post', {
                            yonghuId: localStorage.getItem('userid'),
                            luxianId: _this.detail.id,
                            luxianCollectionTypes: 1,
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
                    layui.http.request('luxianCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                        luxianId: _this.detail.id,
                        luxianCollectionTypes: 2,
                        yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.total == 1) {
                            layui.http.requestJson('luxianCollection/delete', 'post', [res.data.list[0].id], function (res) {
                                _this.detail.zanNumber = _this.detail.zanNumber - 1;
                                layui.http.requestJson(`luxian/update`, 'POST', _this.detail, (res1) => {
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
                            layui.http.requestJson('luxianCollection/add', 'post', {
                                    yonghuId: localStorage.getItem('userid'),
                                    luxianId: _this.detail.id,
                                    luxianCollectionTypes: 2,
                            }, function (res) {
                                _this.detail.zanNumber = _this.detail.zanNumber + 1;
                                layui.http.requestJson(`luxian/update`, 'POST', _this.detail, (res1) => {
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
                    layui.http.request('luxianCollection/list', 'get', {
                        page: 1,
                        limit: 1,
                            luxianId: _this.detail.id,
                            luxianCollectionTypes: 3,
                            yonghuId: localStorage.getItem('userid'),
                    }, (res) => {
                        if (res.data.total == 1) {
                            layui.http.requestJson('luxianCollection/delete', 'post', [res.data.list[0].id], function (res) {

                                _this.detail.caiNumber = _this.detail.caiNumber - 1;
                                layui.http.requestJson(`luxian/update`, 'POST',_this.detail , (res1) => {
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
                            layui.http.requestJson('luxianCollection/add', 'post', {
                                    yonghuId: localStorage.getItem('userid'),
                                    luxianId: _this.detail.id,
                                    luxianCollectionTypes: 3,
                            }, function (res) {
                                _this.detail.caiNumber = _this.detail.caiNumber + 1;
                                layui.http.requestJson(`luxian/update`, 'POST', _this.detail, (res1) => {
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

            localStorage.setItem("goUtl","./pages/luxian/detail.jsp?id="+ http.getParam('id'))

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
                vue.title = vue.detail.luxianName;
                vue.detail.luxianContent = vue.detail.luxianContent.replaceAll("src=\"upload/","src=\""+vue.baseUrl+"upload/");
                // 轮播图片
                vue.swiperList = vue.detail.luxianPhoto ? vue.detail.luxianPhoto.split(",") : [];
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
            http.request(`luxian/gexingtuijian`, 'get', {
                page: 1,
                limit: 5,
                luxianTypes: vue.detail.luxianTypes,
                luxianDelete: 1,
            }, function (res) {
                vue.luxianRecommendList = res.data.list;
            });

            if (localStorage.getItem('userid')) {
                http.request('luxianCollection/list', 'get', {
                    page: 1,
                    limit: 1,
                    luxianId: vue.detail.id,
                    yonghuId: localStorage.getItem('userid'),
                }, function (res) {
                    if(res.data.total >0){
                        res.data.list.forEach(element => {
                            if (element.luxianCollectionTypes == 1) {
                                vue.storeupFlag = 1;
                            }
                            if (element.luxianCollectionTypes == 2) {
                                vue.zanFlag = 1;
                            }
                            if (element.luxianCollectionTypes == 3) {
                                vue.caiFlag = 1;
                            }
                        });

                    }
                });
            }

            // 获取留言
            http.request(`${vue.detailTable}Liuyan/list`, 'get', {
                page: 1,
                limit: limit,
                luxianId: vue.detail.id
            }, function (res) {
                vue.luxianLiuyanDataList = res.data.list;
                // 分页
                laypage.render({
                    elem: 'LiuyanPager',
                    count: res.data.total,
                    limit: limit,
                    jump: function (obj, first) {
                        //首次不执行
                        if (!first) {
                            http.request(`${vue.detailTable}Liuyan/list`, 'get', {
                                page: obj.curr,
                                limit: obj.limit,
                                luxianId: vue.detail.id
                            }, function (res) {
                                vue.luxianLiuyanDataList = res.data.list
                            })
                        }
                    }
                });
            });

            // 提交留言
            form.on('submit(luxianLiuyanText)', function (data) {
                data.yonghuId = localStorage.getItem('userid');
                data.tableName = localStorage.getItem('userTable');
                data.luxianLiuyanText =jquery("#luxianLiuyanText").val();
                if(data.luxianLiuyanText == null || data.luxianLiuyanText == ''){
                    layer.msg("留言不能为空", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                data.luxianId = vue.detail.id;
                http.requestJson(`${vue.detailTable}Liuyan/add`, 'post', data, function (res) {
                    layer.msg('留言成功', {
                        time: 2000,
                        icon: 6
                    }, function () {
                        window.location.reload();
                    });
                    return false;
                });
                return false;
            });
        });
    </script>
</body>
</html>
