    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>景点收藏</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <script type="text/javascript" src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />

    <link rel="stylesheet" href="../../css/theme.css"/>
</head>
<style>
    .center-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 20px;
        display: flex;
        margin-bottom: 20px;
    }
    /*添加地址按钮样式*/
    .btn-container {
        margin-top: 20px;
        text-align: right;
        margin-bottom: 60px;
        border: 2px dotted #EEEEEE;
        padding: 20px;
    }

    /*腰线*/
    .index-title {
        text-align: center;
        box-sizing: border-box;
        width: 980px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .index-title span {
        padding: 0 10px;
        line-height: 1.4;
    }

    /*小菜单样式*/

     .center-container .left-container {
        border: 2px dotted #EEEEEE;
        width: 200px;
        padding-top: 20px;
    }

    .center-container .right-container {
        flex: 1;
        border: 2px dotted #EEEEEE;
        background: #FFFFFF;
        text-align: left;
        padding: 20px;
        padding-top: 40px;
    }

    .center-container .layui-nav-tree {
        margin-top: 20px;
        width: 80%;
    }

    .center-container .layui-nav {
        position: inherit;
    }

    .center-container .layui-nav-tree .layui-nav-item {
        line-height: 44px;
        font-size: 16px;
        color: rgba(17, 17, 17, 1);
        border-width: 0px 0px 1px 0px;
        border-style: solid;
        border-radius: 0;
        background-color: #fff;
        text-align: center;
        border-color: var(--publicMainColor);
        box-shadow: 0 0 0px var(--publicMainColor);
    }

    .center-container .layui-nav-tree .layui-nav-bar {
        height: 44px !important;
        opacity: 0 !important;
    }

    .center-container .layui-nav-tree .layui-nav-item.layui-this {
        font-size: 16px;
        color: rgba(17, 17, 17, 1);
        border-width: 0;
        border-style: solid;
        border-radius: 0;
        background-color: var(--publicSubColor);
    }

    .center-container .layui-nav-tree .layui-nav-item:hover {
        font-size: 14px;
        color: #fff;
        border-width: 0;
        border-style: solid;
        border-radius: 0;
        background-color: var(--publicMainColor);
    }

    .center-container .layui-nav-tree .layui-nav-item a {
        line-height: inherit;
        height: auto;
        background-color: inherit;
        color: inherit;
        text-decoration: none;
        border-color: var(--publicMainColor);
        box-shadow: 0 0 0px var(--publicMainColor);
    }</style>
<body class='bodyClass'>
<div id="app">
    <el-dialog title="弹出内容" :visible.sync="showContentModal" :modal-append-to-body="false">
        <div class="content" style="word-break: break-all;" v-html="showContent">
        </div>
        <div slot="footer" class="dialog-footer">
            <el-button @click="showContentModal = false">关 闭</el-button>
        </div>
    </el-dialog>
<!-- 标题 -->
     <div class="index-title sub_backgroundColor" :style='{"padding":"10px","boxShadow":"0 0 2px rgba(160, 67, 26, 1)","margin":"10px auto","borderColor":"rgba(0,0,0,.3)","color":"rgba(255, 255, 255, 1)","borderRadius":"4px","borderWidth":"0","fontSize":"20px","borderStyle":"solid","height":"auto"}'>
         <span>USER / COLLECTION</span><span>景点收藏收藏</span>
     </div>
    <!-- 标题 -->
    <div class="center-container">
        <!-- 个人中心菜单 config.js-->
            <div class="left-container" :style='{"backgroundColor":"#fff","padding":"0","boxShadow":"0px 0px 1px rgba(181, 181, 181, 1)","margin":"0","borderColor":"rgba(191, 191, 191, 1)","backgroundColor":"rgba(255, 255, 255, 1)","borderRadius":"0","borderWidth":"0 0 1px 0","width":"20%","borderStyle":"solid"}'>
                <ul class="layui-nav layui-nav-tree">
                    <li v-for="(item,index) in centerMenu" v-bind:key="index" class="layui-nav-item" :class="item.url=='../jingdainCollection/list.jsp'?'layui-this':''">
                        <a :href="'javascript:jump(\''+item.url+'\')'">{{item.name}}</a>
                    </li>
                </ul>
            </div>        <!-- 个人中心菜单 -->
        <div class="right-container sub_borderColor" :style='{"padding":"20px","boxShadow":"0px rgba(255,0,0,.8)","margin":"0","backgroundColor":"#fff","borderRadius":"0","borderWidth":"1px","borderStyle":"solid","width":"80%"}'>
            <div style="display: flex;flex-wrap: wrap;justify-content: space-evenly;">
                <div v-for="(item,index) in dataList" :key="index" style="flex: 0 0 25%;padding: 3px">
                    <div :style='{"padding":"10px","borderColor":"var(--publicSubColor)","boxShadow":"0 0 6px var(--publicSubColor)","margin":"0 0 10px 0","borderColor":"rgba(0,0,0,.3)","backgroundColor":"#fff","borderRadius":"4px","borderWidth":"0","borderStyle":"solid"}'>
                            <i @click="deleteJingdainCollection(item.id)" class="layui-icon" style="float:right;color:red;margin-top: -10px;font-size:20px">&#xe640;</i>
                    <!-- class="animation-box"-->
                        <img @click="jumpCheck('../jingdain/detail.jsp?id='+item.jingdainId , item.jingdainDelete == null?'':item.jingdainDelete , item.shangxiaTypes == null?'':item.shangxiaTypes)"
                             :style='{"boxShadow":"0 0 0px rgba(255,0,0,.8)","borderColor":"rgba(0,0,0,.3)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"230px"}'
                             :src="item.jingdainPhoto?baseUrl+item.jingdainPhoto.split(',')[0]:''">
                        <div @click="jumpCheck('../jingdain/detail.jsp?id='+item.jingdainId , item.jingdainDelete == null?'':item.jingdainDelete , item.shangxiaTypes == null?'':item.shangxiaTypes)">
                            <div v-if="item.jingdainNewMoney"
                                 :style='{"padding":"0","margin":"10px 0 0 0","backgroundColor":"rgba(0,0,0,0)","color":"red","borderRadius":"0","textAlign":"left","width":"100%","fontSize":"16px"}'>
                                {{item.jingdainNewMoney}} RMB
                            </div>
                            <div v-else
                                 :style='{"padding":"0","margin":"10px 0 0 0","backgroundColor":"rgba(0,0,0,0)","color":"red","borderRadius":"0","textAlign":"left","width":"100%","fontSize":"16px"}'>
                                {{item.jingdainValue}}
                            </div>
                            <div :style='{"isshow":true,"padding":"0","margin":"5px 0 0 0","backgroundColor":"rgba(0,0,0,0)","color":"#666","borderRadius":"0","textAlign":"right","width":"100%","fontSize":"12px"}'>
                                {{item.jingdainName}}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pager" style="margin-bottom: 50px;" id="pager" :style="{textAlign:'center'}"></div>
        </div>
    </div></div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/echarts.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script type="text/javascript">
    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,30)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            userId: localStorage.getItem("userid"),//当前登录人的id
            sessionTable: localStorage.getItem("userTable"),//登录账户所在表名
            role: localStorage.getItem("role"),//权限
            user:{},//当前登录用户信息
            form:{
                jingdainId: '',
                yonghuId: '',
                jingdainCollectionTypes: '',//数字
                jingdainCollectionValue: '',//数字对应的值
                insertTime: '',
                createTime: '',
            },
            //小菜单
            centerMenu: centerMenu,
            //项目路径
            baseUrl:"",
            //弹出内容模态框
            showContentModal:false,
            showContent:"",
            jingdainCollectionTypesList: [],
            jingdainTypesList: [],

            //订单评论模态框
            jingdainCommentbackContent: null,//评价内容
            jingdainCommentbackId: null,//操作数据id
            jingdainCommentbackModal: false,//模态框状态
            jingdainCommentbackPingfenNumber:0,//评分
            //查询条件
            searchForm: {
                page: 1
                ,limit: 8
                ,sort: "id"//字段
                ,order: "desc"//asc desc
                        ,jingdainCollectionTypes: 1
                ,yonghuId : localStorage.getItem('userid')
                ,jingdainName: null
                ,jingdainTypes: null
            },

            dataList: [],
        },
        filters: {
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }
                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            isAuth(tablename, button) {
                return isFrontAuth(tablename, button);
            },
            jump(url) {
                jump(url);
            },
            jumpCheck(url,check1,check2) {
                if(check1 == "2" || check1 == 2){//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if(check2 == "2"  || check2 == 2){//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            },
            showContentFunction(content) {
                this.showContentModal=true;
                this.showContent=content.replaceAll(/\n/g, "<br>").replaceAll("src=\"upload/","src=\""+this.baseUrl+"upload/");
            },
            wuyong(id) {
                var mymessage = confirm("确定要    吗？");if(!mymessage){return false;}
                layui.http.requestJson(`jingdainCollection/update`, 'post', {
                    id:id,
//                    jingdainCollectionTypes:1,
                }, function (res) {
                    if(res.code == 0){
                        layui.layer.msg('操作成功', {time: 2000, icon: 6 }, function () {window.location.reload();});
                    }else{
                        layui.layer.msg(res.msg, {time: 5000,icon: 5});
                    }
                });
            },
            deleteData(data){
                var mymessage = confirm("确定要删除这条数据吗？");
                if(!mymessage){
                    return false;
                }
                // 删除信息
                layui.http.requestJson(`jingdainCollection/delete`, 'post', [data.id], (res) => {
                    if(res.code==0){
                        layer.msg('操作成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            },
            deleteJingdainCollection(id){
                layui.layer.confirm('确认要删除这个收藏吗？', {
                    btn : [ '确定', '取消' ]//按钮
                }, function(index) {
                    var paramArray = [];
                    paramArray.push(id);
                    layui.http.requestJson('jingdainCollection/delete', 'post',paramArray, function (res) {
                        if (res.code == 0) {
                            layui.layer.msg('删除成功', {
                                time: 2000,
                                icon: 6
                            });
                            location.reload();
                        } else {
                            layui.layer.msg(res.msg, {
                                time: 2000,
                                icon: 2
                            });
                        }
                    });
                });
            },

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;

        localStorage.setItem("goUtl","./pages/jingdainCollection/list.jsp")

        vue.baseUrl = http.baseurl

        let table = localStorage.getItem("userTable");
        if(table){
            http.request(table+"/session", 'get', {}, function (data) {
                vue.user = data.data;
            });
        }



        //类型的动态搜素
        $(document).on("click", ".thisTableType-search", function (e) {
            vue.searchForm.jingdainCollectionTypes = $(this).attr('index');
            pageList();
        });


                                                            //级联表的 景点类型 字段 字典表查询
            jingdainTypesSelect();
            //级联表的 景点类型 字段 字典表查询方法
            function jingdainTypesSelect() {
                http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=jingdain_types", 'get', {}, function (res) {
                    if(res.code == 0){
                        vue.jingdainTypesList = res.data.list;
                    }
                });
            }


            // 分页列表
            pageList();

            // 搜索按钮
            jquery('#btn-search').click(function (e) {
                pageList();
            });

            function pageList() {
                // 获取列表数据
                http.request('jingdainCollection/list', 'get', vue.searchForm, function (res) {
                    vue.dataList = res.data.list;
                    // 分页
                    laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: vue.searchForm.limit,
                        groups: 3,
                        layout: ["prev", "page", "next"],
                        jump: function (obj, first) {
                            vue.searchForm.page = obj.curr;//翻页
                            //首次不执行
                            if (!first) {
                                http.request('jingdainCollection/list', 'get', vue.searchForm, function (res1) {
                                    vue.dataList = res1.data.list;
                                })
                            }
                        }
                    });
                });
            }
    });

    window.xznSlide = function () {
        jQuery(".banner").slide({mainCell: ".bd ul", autoPlay: true, interTime: 5000});
        jQuery("#ifocus").slide({
            titCell: "#ifocus_btn li",
            mainCell: "#ifocus_piclist ul",
            effect: "leftLoop",
            delayTime: 200,
            autoPlay: true,
            triggerTime: 0
        });
        jQuery("#ifocus").slide({titCell: "#ifocus_btn li", mainCell: "#ifocus_tx ul", delayTime: 0, autoPlay: true});
        jQuery(".product_list").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "leftLoop",
            autoPlay: true,
            vis: 5,
            trigger: "click",
            interTime: 4000
        });
    };
</script>
</body>
</html>
